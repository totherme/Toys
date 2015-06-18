package org.totherme.bot;

import org.pircbotx.PircBotX;
import org.pircbotx.hooks.types.GenericMessageEvent;
import org.pircbotx.hooks.types.GenericUserEvent;

/**
 * This command quits the bot.
 * @author gds
 *
 */
public class QuitCommand<T extends PircBotX> implements BotCommand<T> {

    @Override
    public String getCommandName() { return "quit"; }
    
    @Override
    public void runCommand(String arguments, GenericMessageEvent<T> event) {
        event.getBot().sendIRC().quitServer(arguments);
    }

    @Override
    public void passiveListen(GenericUserEvent<T> event) {
        // ignore
    }

}
