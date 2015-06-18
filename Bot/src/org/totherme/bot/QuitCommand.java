package org.totherme.bot;

import org.pircbotx.PircBotX;
import org.pircbotx.hooks.types.GenericMessageEvent;

/**
 * This command quits the bot.
 * @author gds
 *
 */
public class QuitCommand<T extends PircBotX> implements BotCommand<T> {

    @Override
    public String getCommandName() { return "quit"; }
    
    @Override
    public void run(String arguments, GenericMessageEvent<T> event) {
        event.getBot().sendIRC().quitServer(arguments);
    }

}
