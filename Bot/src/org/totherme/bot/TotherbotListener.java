/**
 * A basic bot that takes messages for people.
 */
package org.totherme.bot;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.cyberneko.html.parsers.DOMParser;
import org.pircbotx.Configuration;
import org.pircbotx.PircBotX;
import org.pircbotx.User;
import org.pircbotx.UtilSSLSocketFactory;
import org.pircbotx.hooks.ListenerAdapter;
import org.pircbotx.hooks.events.MessageEvent;
import org.pircbotx.hooks.types.GenericMessageEvent;
import org.pircbotx.hooks.types.GenericUserEvent;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

/**
 * This is the main guts of the bot. There are callback methods which fire whenever interesting 
 * things happen -- such as when we receive messages.
 * 
 * @author gds
 */
public class TotherbotListener<T extends PircBotX> extends ListenerAdapter<T> {
    
    /**
     * The commands this bot implements
     */
    private static final String TELL = "@tell";
    private static final String MSGS = "@msgs";
    private static final String QUIT = "@quit";
    
    /**
     * A single saved message.
     * @author gds
     *
     */
    private class SavedMessage {
        private String sender;
        private String msg;
        /**
         * 
         * @param sender the nick of the person sending this message
         * @param msg the message itself
         */
        public SavedMessage(String sender, String msg) {
            this.sender = sender;
            this.msg = msg;
        }
        /**
         * 
         * @return the nick of the person who sent this message
         */
        public String getSender() { return sender ; }
        /**
         * 
         * @return the message itself
         */
        public String getMessage() { return msg ; }
    }
    
    private class MessageList extends ArrayList<SavedMessage> {
        /**
         * generated serial version.
         */
        private static final long serialVersionUID = -8622885729997390606L;
        public boolean newmsgs = false;        
    }
    
    /**
     * A message store
     * @author gds
     *
     */
    private class MessageMap {
        private Map<String, MessageList> map = new HashMap<String,MessageList>();
        
        /**
         * Look up what messages might be waiting for some recipient in this store, return those 
         * messages, and remove them from the store.
         * 
         * @param recipient the nick of the person the messages might be addressed to.
         * @return all messages addressed to recipient
         */
        public List<SavedMessage> lookupDestructive(String recipient) {
            if (map.containsKey(recipient)) {
                List<SavedMessage> msgs = map.get(recipient);
                map.remove(recipient);
                return msgs;
            }
            else return new MessageList();
        }
        
        /**
         * Leave a message for recipient in this store.
         * 
         * @param recipient
         * @param msg
         */
        public void addMsg(String recipient, SavedMessage msg) {
            if (map.containsKey(recipient)) map.get(recipient).add(msg);
            else {
                MessageList list = new MessageList();
                list.add(msg);
                list.newmsgs = true;
                map.put(recipient, list);
            }
        }
        
        /**
         * Checks if recipient needs to be notified of waiting messages.
         * @param recipient the nick of the user we're checking the messages of
         * @return true if we should tell recipient to look at their messages. False otherwise.
         */
        public boolean needsNotifying(String recipient) {
            if (!map.containsKey(recipient)) return false;
            MessageList msgs = map.get(recipient);
            if (msgs.newmsgs) {
                msgs.newmsgs = false;
                return true;
            } 
            else return false;
            
        }
    }
    
    /**
     * A command issued to the bot
     * @author gds
     *
     */
    private class BotCommand {
        private String command;
        private String arguments;
        
        /**
         * 
         * @param command the name of the command
         * @param arguments the arguments (if any) of this command, or the empty string.
         */
        public BotCommand(String command, String arguments) {
            this.command = command;
            this.arguments = arguments;
        }
        
        public String getCommand() { return command; }
        public String getArguments() { return arguments; }
    }
    
    private MessageMap savedMessages = new MessageMap();
    
    /**
     * Attempts to parse msg as a command to the bot. 
     * 
     * @param msg an IRC message that may or may not be a bot command.
     * @return if a sensible parsing can be found, return a BotCommand representing it. Otherwise, 
     *          return null.
     */
    private BotCommand parseCommand(String msg) {
        if (msg==null) return null;
        if (!msg.startsWith("@")) return null;
        
        if(msg.indexOf(' ')==-1) return new BotCommand(msg, "");
        
        String command = msg.substring(0, msg.indexOf(' ')).trim();
        String args = msg.substring(command.length()).trim();
        return new BotCommand(command, args);
    }
    
    /**
     * Try to find a URL in the string msg,
     * then try to fetch that URL
     * then try to return the title of the webpage we've just fetched
     * @param msg a string that may contain a URL
     * @return the "title" of that URL if we could find one. Otherwise null
     */
    private String getURLTitle(String msg) {
        int plainUrlStart = msg.indexOf("http://");
        int tlsUrlStart = msg.indexOf("https://");
        int urlStart = tlsUrlStart==-1 ? plainUrlStart : tlsUrlStart;
        
        if (urlStart == -1) return null; // There's no URL here. Move along.
        
        msg = msg.substring(urlStart);
        if (msg.indexOf(' ') != -1)
            msg = msg.substring(0, msg.indexOf(' '));
        
        DOMParser parser = new DOMParser();
        try {
            parser.parse(msg);
        } catch (SAXException ex) {
            System.err.println("Couldn't parse data from "+msg+" "+ex);
            return "I couldn't parse that page.";
        } catch (IOException ex) {
            System.err.println("Couldn't get URL "+msg+" "+ex);
            return "I couldn't see that page.";
        }
        Document doc = parser.getDocument();
        if (doc==null) return "Looks like an empty document to me...";
        
        NodeList titles = doc.getElementsByTagName("title");
        String titlestring = "Untitled.";
        if (titles.getLength()>0) {
            titlestring = titles.item(0).getTextContent();
        }

        return titlestring;
    }
    
    /**
     * URL titles are only gotten for channel messages
     */
    @Override
    public void onMessage(MessageEvent<T> event) {
        String msg = event.getMessage();
        String title = getURLTitle(msg);
        if (title != null) {
            event.getBot().sendIRC().message(event.getChannel().getName(), title);
        }        
    }
    
    /**
     * We use user events to track people who may have messages.
     */
    @Override
    public void onGenericUser(GenericUserEvent<T> event) {
        User user = event.getUser();
        // It looks like channel join events call this callback with a null user.
        if(user != null && savedMessages.needsNotifying(user.getNick()))
            event.respond("You have new messages. \"/msg " + event.getBot().getNick() 
                          + " " + MSGS + " to read them.");
    }
    
    /**
     * We use generic messages (which may be channel messages, or privmsgs) to implement commands.
     * We use the convention that a command starts with an '@'.
     */
    @Override
    public void onGenericMessage(GenericMessageEvent<T> event) {
        String msg = event.getMessage();
        BotCommand cmd = parseCommand(msg);
        if (cmd==null) return;
        switch (cmd.getCommand()) {
        case TELL :
        // Command @tell stores a message for a recipient in savedMessages
            String argument = cmd.getArguments();
            if (argument.indexOf(' ')==-1) return;
            String recipient = argument.substring(0, argument.indexOf(' '));
            String msgbody = argument.substring(argument.indexOf(' ')).trim();
            savedMessages.addMsg(recipient, new SavedMessage(event.getUser().getNick(), msgbody));
            event.respond("Noted.");
            return;
        // Command @msgs replays and deletes your saved messages
        case MSGS :
            List<SavedMessage> msgs = savedMessages.lookupDestructive(event.getUser().getNick());
            if (msgs.isEmpty()) {
                event.respond("You have no messages.");
                return;
            }
            for (SavedMessage savmsg : msgs) {
                event.respond(savmsg.getSender() + " said " + savmsg.getMessage());
            }
            return;
        case QUIT :
            event.getBot().sendIRC().quitServer(cmd.getArguments());
        default: return;
        }
    }

    /**
     * Eventually, this should read in the magic strings from some configuration file, and possibly
     * also have a CLI. For now, we just connect to our favourite server and a test channel.
     * @param args
     */
    public static void main(String[] args) throws Exception {
        Configuration<PircBotX> configuration = new Configuration.Builder<PircBotX>()
                        .setName("totherbot")
                        .setServerHostname("irc.elvum.net")
                        .setServerPort(6697)
                        .setSocketFactory(new UtilSSLSocketFactory().trustAllCertificates())
                        .addAutoJoinChannel("#gdsbottest")
                        .addListener(new TotherbotListener<PircBotX>())
                        .buildConfiguration();

        //Create our bot with the configuration
        PircBotX bot = new PircBotX(configuration);
        //Connect to the server
        bot.startBot();
}

}
