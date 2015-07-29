package org.totherme.play;

import java.util.HashMap;
import java.util.Map;

public class StringGames {

    public static boolean uniqueWithMaps(String str) {
        Map<Integer,Boolean> appeared = new HashMap<Integer,Boolean>();
        for(int i=0 ; i<str.length() ; i++) {
            if(appeared.get(str.codePointAt(i))!=null) {
                return false;
            }
            appeared.put(str.codePointAt(i), true);
            
        }
        return true;
    } // O(n) so long as the hash function does its job on this relatively sane input, and gives us 
      // O(1) accesses to the Map.

    public static boolean uniqueWithoutMaps(String str) {
        for(int i=0 ; i<str.length()-1 ; i++) {
            for (int j=i+1 ; j<str.length(); j++) {
                if(str.charAt(i) == str.charAt(j)) return false;
            }
        }
        return true;
    } // O(n^2)

    public static void main(String[] args) {
        System.out.println("the string 'abc' says: "+uniqueWithMaps("abc") +" and " + uniqueWithoutMaps("abc"));
        System.out.println("the string '' says: "+uniqueWithMaps("") +" and " + uniqueWithoutMaps(""));
        System.out.println("the string 'abba' says: "+uniqueWithMaps("abba") +" and " + uniqueWithoutMaps("abba"));
        System.out.println("the string 'alphabetical' says: "+uniqueWithMaps("alphabetical") +" and " + uniqueWithoutMaps("alphabetical"));
        System.out.println("the string 'ab cdef'#[]9)' says: "+uniqueWithMaps("ab cdef'#[]9)") +" and " + uniqueWithoutMaps("ab cdef'#[]9)"));
        System.out.println("the string 'ab cdef' #[]9)' says: "+uniqueWithMaps("ab cdef' #[]9)") +" and " + uniqueWithoutMaps("ab cdef' #[]9)"));

    }
}