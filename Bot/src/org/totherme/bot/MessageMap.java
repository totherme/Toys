package org.totherme.bot;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * A message store
 * @author gds
 *
 */
class MessageMap<T> {

    private class MessageList extends ArrayList<SavedMessage> {
        /**
         * generated serial version.
         */
        private static final long serialVersionUID = -8622885729997390606L;
        public boolean newmsgs = false;        
    }
    
    private Map<String, MessageList> map = new HashMap<String,MessageList>();
    
    /**
     * Look up what messages might be waiting for some recipient in this store, return those 
     * messages, and remove them from the store.
     * 
     * @param recipient the nick of the person the messages might be addressed to.
     * @return all messages addressed to recipient
     */
    public List<SavedMessage> lookupDestructive(String recipient) {
        if (map.containsKey(recipient)) {
            List<SavedMessage> msgs = map.get(recipient);
            map.remove(recipient);
            return msgs;
        }
        else return new MessageList();
    }
    
    /**
     * Leave a message for recipient in this store.
     * 
     * @param recipient
     * @param msg
     */
    public void addMsg(String recipient, SavedMessage msg) {
        if (map.containsKey(recipient)) map.get(recipient).add(msg);
        else {
            MessageList list = new MessageList();
            list.add(msg);
            list.newmsgs = true;
            map.put(recipient, list);
        }
    }
    
    /**
     * Checks if recipient needs to be notified of waiting messages.
     * @param recipient the nick of the user we're checking the messages of
     * @return true if we should tell recipient to look at their messages. False otherwise.
     */
    public boolean needsNotifying(String recipient) {
        if (!map.containsKey(recipient)) return false;
        MessageList msgs = map.get(recipient);
        if (msgs.newmsgs) {
            msgs.newmsgs = false;
            return true;
        } 
        else return false;
        
    }
}