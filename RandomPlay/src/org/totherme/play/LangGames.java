package org.totherme.play;

import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.FileSystem;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Map;
import java.util.Random;
import java.util.List;

public class LangGames {
    public static void say(/* @NonNull */ String str) {
        System.out.println("I say I say I say! " + str);
    }
    
    public static boolean thing() {
        Random r = new Random();
        boolean b = r.nextBoolean();
        say(""+b);
        return b;
    }
    public static void main(String[] args) {
        say("fred");
        say(null);
        boolean test = "fred"=="fr"+(thing()?"ed":"id");
        say("Is it? " + test);
        
        try {
            List<String> lines = Files.readAllLines(FileSystems.getDefault().getPath("/tmp/thing"), Charset.defaultCharset());
        } catch(IOException ex) { /*whatever*/ }
 
    }
}
