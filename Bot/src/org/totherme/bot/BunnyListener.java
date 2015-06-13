/**
 * A basic bot that takes messages for people.
 */
package org.totherme.bot;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.pircbotx.Configuration;
import org.pircbotx.PircBotX;
import org.pircbotx.UtilSSLSocketFactory;
import org.pircbotx.hooks.ListenerAdapter;
import org.pircbotx.hooks.types.GenericMessageEvent;

/**
 * This is the main guts of the bot. There are callback methods which fire whenever interesting things happen -- such as when we receive messages.
 * 
 * @author gds
 */
public class BunnyListener<T extends PircBotX> extends ListenerAdapter<T> {
	
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
	
	/**
	 * A message store
	 * @author gds
	 *
	 */
	private class MessageMap {
		private Map<String, List<SavedMessage>> map = new HashMap<String,List<SavedMessage>>();
		
		/**
		 * Look up what messages might be waiting for some recipient in this store, return those messages, and remove them from the store.
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
			else return new ArrayList<SavedMessage>();
		}
		
		/**
		 * Leave a message for recipient in this store.
		 * 
		 * @param recipiant
		 * @param msg
		 */
		public void addMsg(String recipiant, SavedMessage msg) {
			if (map.containsKey(recipiant)) map.get(recipiant).add(msg);
			else {
				ArrayList<SavedMessage> list = new ArrayList<SavedMessage>();
				list.add(msg);
				map.put(recipiant, list);
			}
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
	 * @return if a sensible parsing can be found, return a BotCommand representing it. Otherwise, return null.
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
     * @Override
     * We use generic messages to implement commands. We use the convention that a command starts with an '@'.
     */
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
    		Iterator<SavedMessage> it = msgs.iterator();
    		while(it.hasNext()) {
    			SavedMessage savmsg = it.next();
    			event.respond(savmsg.getSender() + " said " + savmsg.getMessage());
    		}
    		return;
    	case QUIT :
    		event.getBot().sendIRC().quitServer(cmd.getArguments());
    	default: return;
    	}
    }

	/**
	 * Eventually, this should read in the magic strings from some configuration file, and possibly also have a CLI. For now, we just connect to our favourite server and a test channel.
	 * @param args
	 */
    public static void main(String[] args) throws Exception {
        Configuration<PircBotX> configuration = new Configuration.Builder<PircBotX>()
                        .setName("bunnycat")
                        .setServerHostname("irc.elvum.net")
                        .setServerPort(6697)
                        .setSocketFactory(new UtilSSLSocketFactory().trustAllCertificates())
                        .addAutoJoinChannel("#gdsbottest")
                        .addListener(new BunnyListener<PircBotX>())
                        .buildConfiguration();

        //Create our bot with the configuration
        PircBotX bot = new PircBotX(configuration);
        //Connect to the server
        bot.startBot();
}

}
