package org.totherme.bot;

import org.pircbotx.PircBotX;
import org.pircbotx.hooks.types.GenericMessageEvent;

public interface BotCommand<T extends PircBotX> {

    /**
     * gets the name of the command this class implements. So if the user invokes this command
     * by typing "@foo", then this method should return "foo".
     * @return the name of this command
     */
    public String getCommandName();
    
    public void run(String arguments, GenericMessageEvent<T> event);
}
