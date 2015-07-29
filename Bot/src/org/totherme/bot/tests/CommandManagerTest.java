/**
 * 
 */
package org.totherme.bot.tests;

import static org.junit.Assert.*;

import java.util.ArrayList;

import org.junit.Before;
import org.junit.Test;
import org.pircbotx.PircBotX;
import org.pircbotx.hooks.types.GenericMessageEvent;
import org.pircbotx.hooks.types.GenericUserEvent;
import org.totherme.bot.BotCommand;
import org.totherme.bot.CommandManager;

/**
 * This class tests the CommandManager, whose job is to call listener methods when certain 
 * specified things happen on IRC.
 * @author gds
 *
 */
public class CommandManagerTest {

    /**
     * We keep a log of the listeners that have been called by the CommandManager, and the order 
     * they were called in.
     */
    private final ArrayList<BotCommand<PircBotX>> callList = new ArrayList<BotCommand<PircBotX>>();
    
    /**
     * A sample listener, which will log its command calls to the callList.
     */
    private final BotCommand<PircBotX> testCommand1 = new BotCommand<PircBotX>(){
        @Override
        public String getCommandName() {
            return "testcmd1";
        }

        @Override
        public void runCommand(String arguments, GenericMessageEvent<PircBotX> event) {
            callList.add(this);
            
        }

        @Override
        public void passiveListen(GenericUserEvent<PircBotX> event) {
            // ignore
            
        }
        
    };
    
    /**
     * Another sample listener, which will log its command calls to the callList, implementing a 
     * command which is disjoint from that of testCommand1
     */
    private final BotCommand<PircBotX> testCommand2 = new BotCommand<PircBotX>(){
        @Override
        public String getCommandName() {
            return "testcmd2";
        }

        @Override
        public void runCommand(String arguments, GenericMessageEvent<PircBotX> event) {
            callList.add(this);
            
        }

        @Override
        public void passiveListen(GenericUserEvent<PircBotX> event) {
            // ignore
            
        }
        
    };

    /**
     * An event which should result in testCommand1 being called
     */
    private GenericMessageEvent<PircBotX> messageEvent1 = new MockGenericMessageEvent() {
        @Override
        public String getMessage() {
            return "@" + testCommand1.getCommandName() + " and some arguments";
        }
    };

    /**
     * An event which should result in testCommand2 being called
     */
    private GenericMessageEvent<PircBotX> messageEvent2 = new MockGenericMessageEvent() {
        @Override
        public String getMessage() {
            return "@" + testCommand2.getCommandName();
        }
    };

    /**
     * A sample listener, which will log to the callList any time ANYTHING happens.
     */
    private final BotCommand<PircBotX> testPassive1 = new BotCommand<PircBotX>(){
        @Override
        public String getCommandName() {
            return "testPassive1";
        }

        @Override
        public void runCommand(String arguments, GenericMessageEvent<PircBotX> event) {
            // ignore
        }

        @Override
        public void passiveListen(GenericUserEvent<PircBotX> event) {
            callList.add(this);
            
        }
        
    };
    
    /**
     * Another sample listener, which will log to the callList any time ANYTHING happens.
     */
    private final BotCommand<PircBotX> testPassive2 = new BotCommand<PircBotX>(){
        @Override
        public String getCommandName() {
            return "testPassive2";
        }

        @Override
        public void runCommand(String arguments, GenericMessageEvent<PircBotX> event) {
            // ignore
        }

        @Override
        public void passiveListen(GenericUserEvent<PircBotX> event) {
            callList.add(this);
        }
        
    };

    private final GenericUserEvent<PircBotX> userEvent1 = new MockGenericUserEvent();
    private final GenericUserEvent<PircBotX> userEvent2 = new MockGenericUserEvent();

    /**
     * A command manager to test
     */
    private CommandManager<PircBotX> cmdManager;
    
    /**
     * @throws java.lang.Exception
     */
    @Before
    public void setUp() throws Exception {
        // Create a new CommandManager to test
        cmdManager = new CommandManager<PircBotX>();
        // Wipe the state of the callList
        for(int i = callList.size() - 1 ; i >= 0 ; i--) {
            callList.remove(i);
        }
    }

    /**
     * Testing that registered commands get called when they should, and not when they shouldn't.
     * 
     * This exercises 
     * {@link org.totherme.bot.CommandManager#onGenericMessage(org.pircbotx.hooks.types.GenericMessageEvent)}
     * and
     * {@link org.totherme.bot.CommandManager#registerCommand(org.totherme.bot.BotCommand)}
     */
    @Test
    public void testListenersGetCommandCallBacks() {
        
        cmdManager.registerCommand(testCommand1);
        
        
        cmdManager.onGenericMessage(messageEvent1);
        assertEquals(1, callList.size());
        assertEquals(testCommand1, callList.get(0));
        
        cmdManager.registerCommand(testCommand2);
        
        
        cmdManager.onGenericMessage(messageEvent2);
        assertEquals(2, callList.size());
        assertEquals(testCommand1, callList.get(0));
        assertEquals(testCommand2, callList.get(1));

        cmdManager.onGenericMessage(messageEvent1);
        assertEquals(3, callList.size());
        assertEquals(testCommand1, callList.get(0));
        assertEquals(testCommand2, callList.get(1));
        assertEquals(testCommand1, callList.get(2));
    }
    
    /**
     * Testing that registered commands get called when they should, and not when they shouldn't, 
     * even if they're added in bulk. 
     * 
     * This exercises 
     * {@link org.totherme.bot.CommandManager#onGenericMessage(org.pircbotx.hooks.types.GenericMessageEvent)}
     * and
     * {@link org.totherme.bot.CommandManager#registerCommand(java.lang.Iterable)}
     */
    @Test
    public void testListenersGetCommandCallBacksByIterator() {
        ArrayList<BotCommand<PircBotX>> list = new ArrayList<BotCommand<PircBotX>>();
        list.add(testCommand1);
        list.add(testCommand2);
        cmdManager.registerCommand(list);
        cmdManager.onGenericMessage(messageEvent1);
        assertEquals(1, callList.size());
        assertEquals(testCommand1, callList.get(0));
        cmdManager.onGenericMessage(messageEvent2);
        assertEquals(2, callList.size());
        assertEquals(testCommand1, callList.get(0));
        assertEquals(testCommand2, callList.get(1));
    }

    /**
     * Testing that registering a 0-length collection doesn't break anything.
     * 
     * This exercises
     * {@link org.totherme.bot.CommandManager#onGenericMessage(org.pircbotx.hooks.types.GenericMessageEvent)}
     * and
     * {@link org.totherme.bot.CommandManager#registerCommand(org.totherme.bot.BotCommand)}
     * and
     * {@link org.totherme.bot.CommandManager#registerCommand(java.lang.Iterable)}
     */
    @Test
    public void testListenersWithEmptyIterator() {
        cmdManager.registerCommand(new ArrayList<BotCommand<PircBotX>>());
        cmdManager.onGenericMessage(messageEvent1);
        assertEquals(0, callList.size());
        cmdManager.onGenericMessage(messageEvent2);
        assertEquals(0, callList.size());
        cmdManager.registerCommand(testCommand1);
        cmdManager.registerCommand(new ArrayList<BotCommand<PircBotX>>());
        cmdManager.onGenericMessage(messageEvent1);
        assertEquals(1, callList.size());
        assertEquals(testCommand1, callList.get(0));
    }

    /**
     * Testing that passive listeners get to hear everything that goes on.
     * This exercises
     * {@link org.totherme.bot.CommandManager#onGenericUser(org.pircbotx.hooks.types.GenericMessageEvent)}
     * and
     * {@link org.totherme.bot.CommandManager#registerCommand(org.totherme.bot.BotCommand)}
     * 
     */
    @Test
    public void testPassiveListening() {
        cmdManager.registerCommand(testPassive1);
        cmdManager.onGenericUser(userEvent1);
        assertEquals(1, callList.size());
        assertEquals(testPassive1, callList.get(0));
        cmdManager.registerCommand(testPassive2);
        cmdManager.onGenericUser(userEvent2);
        assertEquals(3, callList.size());
        assertEquals(testPassive1, callList.get(0));
        assertTrue("The two new calls should have been one for each passive listener", 
                 ((testPassive1 == callList.get(1) && (testPassive2 == callList.get(2)))
              || ((testPassive2 == callList.get(1) && (testPassive1 == callList.get(2))))));
    }
    
    /**
     * Testing that passive listeners get to hear everything that goes on.
     * This exercises
     * {@link org.totherme.bot.CommandManager#onGenericUser(org.pircbotx.hooks.types.GenericMessageEvent)}
     * and
     * {@link org.totherme.bot.CommandManager#registerCommand(java.util.Iterator)}
     * 
     */
    @Test
    public void testPassiveListeningWithIterator() {
        ArrayList<BotCommand<PircBotX>> list = new ArrayList<BotCommand<PircBotX>>();
        list.add(testPassive1);
        list.add(testPassive2);
        cmdManager.registerCommand(list);
        cmdManager.onGenericUser(userEvent2);
        assertEquals(2, callList.size());
        assertTrue("The two new calls should have been one for each passive listener", 
                 ((testPassive1 == callList.get(0) && (testPassive2 == callList.get(1)))
              || ((testPassive2 == callList.get(0) && (testPassive1 == callList.get(1))))));
    }
}
