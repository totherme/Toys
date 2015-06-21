package org.totherme.bot.tests;

import org.pircbotx.PircBotX;
import org.pircbotx.User;
import org.pircbotx.hooks.Event;
import org.pircbotx.hooks.types.GenericMessageEvent;

/**
 * An empty mock of a GenericUser event. Extend this to override with functionality for testing 
 * things.
 * @author gds
 *
 */
class MockGenericMessageEvent implements
        GenericMessageEvent<PircBotX> {
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
    public int compareTo(Event<PircBotX> arg0) {
        // Not expected to be used
        return 0;
    }

    @Override
    public User getUser() {
        // Not expected to be used
        return null;
    }

    @Override
    public String getMessage() {
        // Not expected to be used
        return null;
    }
}