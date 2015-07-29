/**
 * 
 */
package org.totherme.bot.tests;

import static org.junit.Assert.*;

import java.util.ArrayList;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.pircbotx.Channel;
import org.pircbotx.Configuration;
import org.pircbotx.PircBotX;
import org.pircbotx.Configuration.BotFactory;
import org.pircbotx.User;
import org.pircbotx.UserChannelDao;
import org.totherme.bot.BotCommand;
import org.totherme.bot.CommandManager;
import org.totherme.bot.MessageManager;

/**
 * Tests the MessageManager class, whose job is to:
 * 1) Take messages from arbitrary users, for other users.
 * 2) Replay a given user's messages on request
 * 3) Notify a user if they have messages waiting
 * 
 * @author gds
 *
 */
public class MessageManagerTest {

    MessageManager<PircBotX> msgManager;
    CommandManager<PircBotX> cmdManager;
    BotCommand<PircBotX> tellCommand;
    BotCommand<PircBotX> msgsCommand;
    
    /**
     * @throws java.lang.Exception
     */
    @Before
    public void setUp() throws Exception {
        msgManager = new MessageManager<PircBotX>();
        cmdManager = new CommandManager<PircBotX>();
        tellCommand = msgManager.getTellCommand();
        msgsCommand = msgManager.getMsgsCommand();
        cmdManager.registerCommand(tellCommand);
        cmdManager.registerCommand(msgsCommand);
    }

    /**
     * Test that neither {@link org.totherme.bot.MessageManager#getTellCommand} nor 
     * {@link org.totherme.bot.MessageManager#getMsgsCommand} return null.
     */
    @Test
    public void noNullCommands() {
        assertTrue("getTellCommand should return /something/.", tellCommand!=null);
        assertTrue("getMsgsCommand should return /something/.", msgsCommand!=null);
        
    }

    /**
     * Test method for {@link org.totherme.bot.MessageManager#getCommands()}.
     */
    @Test
    public void testGetCommands() {
        // getCommands is a convenience to save having to call both getTellCommand and 
        // getMsgsCommand.
        Iterable<BotCommand<PircBotX>> commands = msgManager.getCommands();
        assertTrue("getCommands should return /something/.", commands!=null);
        ArrayList<BotCommand<PircBotX>> commandList = new ArrayList<BotCommand<PircBotX>>();
        for(BotCommand<PircBotX> command : commands) {
            commandList.add(command);
        }
        assertTrue("There ought to be two commands", commandList.size()==2);
        assertTrue("commands ought to contain precisely tellCommand and msgsCommand", 
                   (commandList.get(0)==tellCommand && commandList.get(1)==msgsCommand)
                || (commandList.get(0)==msgsCommand && commandList.get(1)==tellCommand));
    }
    
    /**
     * Test that message queues start empty.
     * 
     * Or it would do if I knew how to mock up a User object.
     */
    @Test
    public void testInitialMessages() {
        // Ok, I can't mock up a working event, because it needs to have a getUser method that 
        // returns an actual User. And there seem to be no gorram methods that create Users. 
        // And all its constructors are private.
        final ArrayList<String> responses = new ArrayList<String>();
        BotFactory bf = new BotFactory();
        PircBotX bot = new PircBotX(new Configuration.Builder<PircBotX>().buildConfiguration());
        
        UserChannelDao<User, Channel> dao = new UserChannelDao<User, Channel>(bot, bf);
        bot.getUserChannelDao();
        // User user = dao.createUser("fred");
        MockGenericMessageEvent event = new MockGenericMessageEvent() {
            @Override
            public String getMessage() {
                return "@msgs";
            }
            @Override
            public void respond(String response) {
                responses.add(response);
            }
        };
        cmdManager.onGenericMessage(event);
        assertEquals("There should be 1 response", 1, responses.size());
        assertEquals("There should be no messages waiting", "You have no messages.", responses.get(0));
    }
    
    /**
     * Test that I can send one message to one person.
     */
}
