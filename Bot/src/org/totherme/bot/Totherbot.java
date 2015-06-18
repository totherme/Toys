package org.totherme.bot;

import org.pircbotx.Configuration;
import org.pircbotx.PircBotX;
import org.pircbotx.UtilSSLSocketFactory;

public class Totherbot {
    /**
     * Eventually, this should read in the magic strings from some configuration file, and possibly
     * also have a CLI. For now, we just connect to our favourite server and a test channel.
     * @param args
     */
    public static void main(String[] args) throws Exception {
        
        // The features we're enabling on this run
        URLTitleGetter<PircBotX> urlTitleGetter = new URLTitleGetter<PircBotX>();
        CommandManager<PircBotX> cmds = new CommandManager<PircBotX>();
        QuitCommand<PircBotX> quitCmd = new QuitCommand<>();
        MessageManager<PircBotX> msgManager = new MessageManager<PircBotX>();
        cmds.registerCommand(quitCmd)
            .registerCommand(msgManager.getTellCommand())
            .registerCommand(msgManager.getMsgsCommand());
        
        Configuration<PircBotX> configuration = new Configuration.Builder<PircBotX>()
                        .setName("totherbot")
                        .setServerHostname("irc.elvum.net")
                        .setServerPort(6697)
                        .setSocketFactory(new UtilSSLSocketFactory().trustAllCertificates())
                        .addAutoJoinChannel("#gdsbottest")
                        .addListener(urlTitleGetter)
                        .addListener(msgManager)
                        .addListener(cmds)
                        .buildConfiguration();

        //Create our bot with the configuration
        PircBotX bot = new PircBotX(configuration);
        //Connect to the server
        bot.startBot();
    }


}
