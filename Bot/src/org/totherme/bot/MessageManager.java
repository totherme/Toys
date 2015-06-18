package org.totherme.bot;

import java.util.List;

import org.pircbotx.PircBotX;
import org.pircbotx.User;
import org.pircbotx.hooks.ListenerAdapter;
import org.pircbotx.hooks.types.GenericMessageEvent;
import org.pircbotx.hooks.types.GenericUserEvent;

/**
 * This class provides *two* BotCommands, one to leave messages, and one to check messages. 
 * It also manages the state of those messages, and provides notifications to users who have 
 * messages waiting
 * @author gds
 *
 */
public class MessageManager<T extends PircBotX> extends ListenerAdapter<T> {
    private static final String TELL = "tell";
    private static final String MSGS = "msgs";

    private MessageMap<T> savedMessages = new MessageMap<T>();

    /**
     * A command for leaving messages for other users.
     */
    private BotCommand<T> tellCommand = new BotCommand<T>() {
        @Override
        public String getCommandName() { return TELL; }
        @Override
        public void run(String arguments, GenericMessageEvent<T> event) {
            // Command @tell stores a message for a recipient in savedMessages
            if (arguments.indexOf(' ')==-1) return;
            String recipient = arguments.substring(0, arguments.indexOf(' '));
            String msgbody = arguments.substring(arguments.indexOf(' ')).trim();
            savedMessages.addMsg(recipient, new SavedMessage(event.getUser().getNick(), msgbody));
            event.respond("Noted.");
        }
    };

    /**
     * A command for recalling whatever messages may have been left for you.
     */
    private BotCommand<T> msgsCommand = new BotCommand<T>() {
        @Override
        public String getCommandName() { return MSGS; }
        @Override
        public void run(String arguments, GenericMessageEvent<T> event) {
            List<SavedMessage> msgs = savedMessages.lookupDestructive(event.getUser().getNick());
            if (msgs.isEmpty()) {
                event.respond("You have no messages.");
                return;
            }
            for (SavedMessage savmsg : msgs) {
                event.respond(savmsg.getSender() + " said " + savmsg.getMessage());
            }
        }
    };
    
    /**
     * We use user events to track people who may have messages.
     */
    @Override
    public void onGenericUser(GenericUserEvent<T> event) {
        User user = event.getUser();
        // It looks like channel join events call this callback with a null user.
        if(user != null && savedMessages.needsNotifying(user.getNick()))
            event.respond("You have new messages. \"/msg " + event.getBot().getNick() 
                          + " @" + MSGS + " to read them.");
    }

    /**
     * 
     * @return a BotCommand for leaving people messages.
     */
    public BotCommand<T> getTellCommand() { return tellCommand; }

    /**
     * 
     * @return a BotCommand for checking whatever messages may have been left for you.
     */
    public BotCommand<T> getMsgsCommand() { return msgsCommand; }
}
