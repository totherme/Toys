/**
 * 
 */
package org.totherme.bot.tests;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import org.totherme.bot.BotCommandInvocation;

/**
 * Tests the BotCommandInvocation class, whose job is to parse and represent an invocation of a 
 * BotCommand in IRC.
 * @author gds
 *
 */
public class BotCommandInvocationTest {

    /**
     * @throws java.lang.Exception
     */
    @BeforeClass
    public static void setUpBeforeClass() throws Exception {
    }

    /**
     * @throws java.lang.Exception
     */
    @AfterClass
    public static void tearDownAfterClass() throws Exception {
    }

    /**
     * @throws java.lang.Exception
     */
    @Before
    public void setUp() throws Exception {
    }

    /**
     * @throws java.lang.Exception
     */
    @After
    public void tearDown() throws Exception {
    }

    /**
     * Test that various command strings are properly parsed.
     */
    @Test
    public void test() {
        assertEquals(null, BotCommandInvocation.parseCommand(""));
        assertEquals(null, BotCommandInvocation.parseCommand("fred"));
        assertEquals(null, BotCommandInvocation.parseCommand(" fred"));
        assertEquals(null, BotCommandInvocation.parseCommand(" fred and bob"));
        assertEquals(null, BotCommandInvocation.parseCommand(" @things"));
        assertEquals(null, BotCommandInvocation.parseCommand("name@place.tld"));
        
        BotCommandInvocation cmd = BotCommandInvocation.parseCommand("@cmd");
        assertEquals("Checking single command", "cmd", cmd.getCommand());
        assertEquals("Checking single command", "", cmd.getArguments());
        
        BotCommandInvocation cmd2 = BotCommandInvocation.parseCommand("@cmd ");
        assertEquals("Checking single command with space", "cmd", cmd2.getCommand());
        assertEquals("Checking single command with space", "", cmd2.getArguments());
        
        BotCommandInvocation cmdWithArg = BotCommandInvocation.parseCommand("@command argument");
        assertEquals("command with one argument", "command", cmdWithArg.getCommand());
        assertEquals("command with one argument", "argument", cmdWithArg.getArguments());
        
        BotCommandInvocation cmdWithArg2 = BotCommandInvocation.parseCommand("@command   argument");
        assertEquals("command with one argument and middle spaces", "command", cmdWithArg2.getCommand());
        assertEquals("command with one argument and middle spaces", "argument", cmdWithArg2.getArguments());
        
        BotCommandInvocation cmdWithArg3 = BotCommandInvocation.parseCommand("@command\targument");
        assertEquals("command with one argument and tab", "command", cmdWithArg3.getCommand());
        assertEquals("command with one argument and tab", "argument", cmdWithArg3.getArguments());
        
        BotCommandInvocation cmdWithArg4 = BotCommandInvocation.parseCommand("@command argument ");
        assertEquals("command with one argument and following space", "command", cmdWithArg4.getCommand());
        assertEquals("command with one argument and following space", "argument", cmdWithArg4.getArguments());
        
        BotCommandInvocation cmdWithArgs = BotCommandInvocation.parseCommand("@command and some arguments");
        assertEquals("command with many args", "command", cmdWithArgs.getCommand());
        assertEquals("command with many args", "and some arguments", cmdWithArgs.getArguments());

        BotCommandInvocation cmdWithArgs2 = BotCommandInvocation.parseCommand("@command and some arguments ");
        assertEquals("command with many args and space", "command", cmdWithArgs2.getCommand());
        assertEquals("command with many args and space", "and some arguments", cmdWithArgs2.getArguments());
    }

}
