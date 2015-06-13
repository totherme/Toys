/**
 * A basic bot
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
 * @author gds
 * 
 */
public class BunnyListener<T extends PircBotX> extends ListenerAdapter<T> {
	
	/**
	 * A class to represent a single saved message.
	 * @author gds
	 *
	 */
	private class SavedMessage {
		private String sender;
		private String msg;
		public SavedMessage(String sender, String msg) {
			this.sender = sender;
			this.msg = msg;
		}
		public String getSender() { return sender ; }
		public String getMessage() { return msg ; }
	}
	
	private class MessageMap {
		private Map<String, List<SavedMessage>> map = new HashMap<String,List<SavedMessage>>();
		
		public List<SavedMessage> lookupDestructive(String recipiant) {
			if (map.containsKey(recipiant)) {
				List<SavedMessage> msgs = map.get(recipiant);
				map.remove(recipiant);
				return msgs;
			}
			else return new ArrayList<SavedMessage>();
		}
		
		public void addMsg(String recipiant, SavedMessage msg) {
			if (map.containsKey(recipiant)) map.get(recipiant).add(msg);
			else {
				ArrayList<SavedMessage> list = new ArrayList<SavedMessage>();
				list.add(msg);
				map.put(recipiant, list);
			}
		}
	}
	
	private MessageMap savedMessages = new MessageMap();
	
    /**
     * @Override
     * We use generic messages to implement commands. We use the convention that a command starts with an '@'.
     */
    public void onGenericMessage(GenericMessageEvent<T> event) {
    	String msg = event.getMessage();
        // Command @tell stores a message for a recipient in savedMessages
    	if (msg.startsWith("@tell ")) {
    		String argument = msg.substring(6).trim();
    		savedMessages.addMsg(argument.substring(0, argument.indexOf(' ')), new SavedMessage(event.getUser().getNick(), argument.substring(argument.indexOf(' ')).trim()));
            event.respond("Noted.");
    	}
        // Command @msgs replays and deletes your saved messages
    	else if (msg.startsWith("@msgs")) {
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
    	}
    }

	/**
	 * @param args
	 */
    public static void main(String[] args) throws Exception {
        //Configure what we want our bot to do
        Configuration<PircBotX> configuration = new Configuration.Builder<PircBotX>()
                        .setName("bunnycat") //Set the nick of the bot. CHANGE IN YOUR CODE
                        .setServerHostname("irc.elvum.net") //Join the freenode network
                        .setServerPort(6697)
                        .setSocketFactory(new UtilSSLSocketFactory().trustAllCertificates())
                        .addAutoJoinChannel("#gdsbottest") //Join the official #pircbotx channel
                        .addListener(new BunnyListener<PircBotX>()) //Add our listener that will be called on Events
                        .buildConfiguration();

        //Create our bot with the configuration
        PircBotX bot = new PircBotX(configuration);
        //Connect to the server
        bot.startBot();
}

}
