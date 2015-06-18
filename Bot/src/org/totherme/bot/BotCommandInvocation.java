package org.totherme.bot;

/**
 * A command issued to the bot
 * @author gds
 *
 */
public class BotCommandInvocation {
    private String command;
    private String arguments;
    
    /**
     * 
     * @param command the name of the command
     * @param arguments the arguments (if any) of this command, or the empty string.
     */
    private BotCommandInvocation(String command, String arguments) {
        this.command = command;
        this.arguments = arguments;
    }
    
    public String getCommand() { return command; }
    public String getArguments() { return arguments; }
    
    /**
     * Attempts to parse msg as a command to the bot. 
     * 
     * @param msg an IRC message that may or may not be a bot command.
     * @return if a sensible parsing can be found, return a BotCommand representing it. Otherwise, 
     *          return null.
     */
    public static BotCommandInvocation parseCommand(String msg) {
        if (msg==null) return null;
        if (!msg.startsWith("@")) return null; // not a command
        msg = msg.substring(1);         // Strip the command prefix
        
        if(msg.indexOf(' ')==-1) return new BotCommandInvocation(msg, ""); // no arguments
        
        String command = msg.substring(0, msg.indexOf(' ')).trim();
        String args = msg.substring(command.length()).trim();
        return new BotCommandInvocation(command, args);
    }

}
