/**
 * A basic bot that takes messages for people.
 */
package org.totherme.bot;

import java.io.IOException;

import org.cyberneko.html.parsers.DOMParser;
import org.pircbotx.PircBotX;
import org.pircbotx.hooks.ListenerAdapter;
import org.pircbotx.hooks.events.MessageEvent;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

/**
 * This is the main guts of the bot. There are callback methods which fire whenever interesting 
 * things happen -- such as when we receive messages.
 * 
 * @author gds
 */
public class URLTitleGetter<T extends PircBotX> extends ListenerAdapter<T> {
    
    /**
     * Try to find a URL in the string msg,
     * then try to fetch that URL
     * then try to return the title of the webpage we've just fetched
     * @param msg a string that may contain a URL
     * @return the "title" of that URL if we could find one. Otherwise null
     */
    private String getURLTitle(String msg) {
        int plainUrlStart = msg.indexOf("http://");
        int tlsUrlStart = msg.indexOf("https://");
        int urlStart = tlsUrlStart==-1 ? plainUrlStart : tlsUrlStart;
        
        if (urlStart == -1) return null; // There's no URL here. Move along.
        
        msg = msg.substring(urlStart);
        if (msg.indexOf(' ') != -1)
            msg = msg.substring(0, msg.indexOf(' '));
        
        DOMParser parser = new DOMParser();
        try {
            parser.parse(msg);
        } catch (SAXException ex) {
            System.err.println("Couldn't parse data from "+msg+" "+ex);
            return "I couldn't parse that page.";
        } catch (IOException ex) {
            System.err.println("Couldn't get URL "+msg+" "+ex);
            return "I couldn't see that page.";
        }
        Document doc = parser.getDocument();
        if (doc==null) return "Looks like an empty document to me...";
        
        NodeList titles = doc.getElementsByTagName("title");
        String titlestring = "Untitled.";
        if (titles.getLength()>0) {
            titlestring = titles.item(0).getTextContent();
        }

        return titlestring;
    }
    
    /**
     * URL titles are only gotten for channel messages
     */
    @Override
    public void onMessage(MessageEvent<T> event) {
        String msg = event.getMessage();
        String title = getURLTitle(msg);
        if (title != null) {
            event.getBot().sendIRC().message(event.getChannel().getName(), title);
        }        
    }
}
