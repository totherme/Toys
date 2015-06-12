/**
 * A basic bot
 */
package org.totherme.bot;

import javax.net.ssl.SSLSocketFactory;

import org.pircbotx.Configuration;
import org.pircbotx.PircBotX;
import org.pircbotx.UtilSSLSocketFactory;
import org.pircbotx.hooks.ListenerAdapter;
import org.pircbotx.hooks.types.GenericMessageEvent;

/**
 * @author gds
 *
 */
public class BunnyListener extends ListenerAdapter {
    /**
     * @Override
     */
    public void onGenericMessage(GenericMessageEvent event) {
            //When someone says ?helloworld respond with "Hello World"
            if (event.getMessage().startsWith("?helloworld"))
                    event.respond("Hello world!");
    }

	/**
	 * @param args
	 */
    public static void main(String[] args) throws Exception {
        //Configure what we want our bot to do
        Configuration configuration = new Configuration.Builder()
                        .setName("bunnycat") //Set the nick of the bot. CHANGE IN YOUR CODE
                        .setServerHostname("irc.elvum.net") //Join the freenode network
                        .setServerPort(6697)
                        .setSocketFactory(new UtilSSLSocketFactory().trustAllCertificates())
                        .addAutoJoinChannel("#gdsbottest") //Join the official #pircbotx channel
                        .addListener(new BunnyListener()) //Add our listener that will be called on Events
                        .buildConfiguration();

        //Create our bot with the configuration
        PircBotX bot = new PircBotX(configuration);
        //Connect to the server
        bot.startBot();
}

}
