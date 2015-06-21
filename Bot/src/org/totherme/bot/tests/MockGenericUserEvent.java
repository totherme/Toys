package org.totherme.bot.tests;

import org.pircbotx.PircBotX;
import org.pircbotx.User;
import org.pircbotx.hooks.Event;
import org.pircbotx.hooks.types.GenericUserEvent;

public class MockGenericUserEvent implements GenericUserEvent<PircBotX> {

    @Override
    public PircBotX getBot() {
        // Not expected to be used
        return null;
    }

    @Override
    public long getTimestamp() {
        // Not expected to be used
        return 0;
    }

    @Override
    public void respond(String arg0) {
        // Not expected to be used        
    }

    @Override
    public int compareTo(Event<PircBotX> o) {
        // Not expected to be used
        return 0;
    }

    @Override
    public User getUser() {
        // Not expected to be used
        return null;
    }

}
