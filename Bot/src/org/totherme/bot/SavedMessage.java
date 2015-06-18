package org.totherme.bot;

/**
 * A single saved message.
 * @author gds
 *
 */
class SavedMessage {
    private String sender;
    private String msg;
    /**
     * 
     * @param sender the nick of the person sending this message
     * @param msg the message itself
     */
    public SavedMessage(String sender, String msg) {
        this.sender = sender;
        this.msg = msg;
    }
    /**
     * 
     * @return the nick of the person who sent this message
     */
    public String getSender() { return sender ; }
    /**
     * 
     * @return the message itself
     */
    public String getMessage() { return msg ; }
}