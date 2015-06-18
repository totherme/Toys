package org.totherme.bot;

import java.util.HashMap;
import java.util.Map;

import org.pircbotx.PircBotX;
import org.pircbotx.hooks.ListenerAdapter;
import org.pircbotx.hooks.types.GenericMessageEvent;
import org.pircbotx.hooks.types.GenericUserEvent;

public class CommandManager<T extends PircBotX> extends ListenerAdapter<T> {
    
    Map<String,BotCommand<T>> commands = new HashMap<String,BotCommand<T>>();
    
    /**
     * We use generic messages (which may be channel messages, or privmsgs) to implement commands.
     * We use the convention that a command starts with an '@'.
     */
    @Override
    public void onGenericMessage(GenericMessageEvent<T> event) {
        String msg = event.getMessage();
        BotCommandInvocation cmd = BotCommandInvocation.parseCommand(msg);
        if (cmd==null) return;
        if (commands.containsKey(cmd.getCommand())) {
            commands.get(cmd.getCommand()).runCommand(cmd.getArguments(), event);
        }
    }

    /**
     * We use user events to handle passive listening, for exmaple tracking when people were last
     * seen, or who has messages
     */
    @Override
    public void onGenericUser(GenericUserEvent<T> event) {
        for(BotCommand<T> cmd : commands.values()) {
            cmd.passiveListen(event);
        }
    }

    
    /**
     * Register a BotCommand with this command manager.
     * 
     * This has the effect that whenever that command is invoked by an IRC user, the run method of 
     * the command will be called.
     * @param cmd the BotCommand to register with this command manager.
     * @return this CommandManager (for chaining multiple registrations).
     */
    public CommandManager<T> registerCommand(BotCommand<T> cmd) {
        commands.put(cmd.getCommandName(), cmd);
        return this;
    }

    /**
     * Convenience for registering multiple commands at once. 
     * @param commands an iterable collection of BotCommands to register
     * @return this CommandManager (for chaining multiple registrations)
     */
    public CommandManager<T> registerCommand(Iterable<BotCommand<T>> commands) {
        for (BotCommand<T> command : commands) {
            this.registerCommand(command);
        }
        return this;
    }
}
