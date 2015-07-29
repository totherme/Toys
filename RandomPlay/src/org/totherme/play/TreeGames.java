package org.totherme.play;

import java.util.ArrayList;
import java.util.Iterator;

public class TreeGames {
    public static class NodeList implements Iterable<Tree> {
        private ArrayList<Tree> kids = new ArrayList<>();

        @Override
        public Iterator<Tree> iterator() {
            return kids.iterator();
        }
        
        public Tree item(int i) { return kids.get(i); }
        
        public void append(Tree t) { kids.add(t); }

        public int length() { return kids.size() ; }
        
        public String toString() {
            String str = "<";
            for (Tree t : kids) {
                str += (" " + t + " ");
            }
            str += ">";
            return str;
        }
    }
    public static class Tree {
        private NodeList kids = new NodeList();
        private String name;
        
        public NodeList getChildren() { return kids; }
        
        public Tree(String name) { this.name = name; }
        
        public String toString() {
            return name + kids;
        }
    }

    public static void addLeafDepths(ArrayList<Integer> d, Tree t, int currentDepth) {
        if (t.getChildren().length()==0) {
            d.add(currentDepth);
        } else {
            for (Tree t2 : t.getChildren()) {
                addLeafDepths(d, t2, currentDepth+1);
            }
        }
    }
    
    public static boolean testLeafDepths(ArrayList<Integer> s) {
        int min = Integer.MAX_VALUE;
        int max = Integer.MIN_VALUE;
        for (int i : s) {
            if(i<min) min = i;
            if(i>max) max = i;
        }
        return max-min <= 1;
    }
    
    public static boolean isBallenced(Tree t) {
        ArrayList<Integer> depths = new ArrayList<>();
        addLeafDepths(depths, t, 0);
        return testLeafDepths(depths);
    }

    public static class Pair { public int max = Integer.MIN_VALUE; public int min = Integer.MAX_VALUE; }
    
    public static class OptimisingException extends Exception {} 
    
    public static boolean isBallenced2(Tree t) {
        Pair mm = new Pair();
        try {
            checkBal(mm, t, 0);
        } catch (OptimisingException ex) {
            return false;
        }
        return true;
    }
    
    public static void checkBal(Pair mm, Tree t, int currentDepth) throws OptimisingException {
        if (t.getChildren().length()==0) {
            if (currentDepth < mm.min) mm.min = currentDepth;
            if (currentDepth > mm.max) mm.max = currentDepth;
            if (mm.max - mm.min > 1) throw new OptimisingException();
        } else {
            for (Tree t2 : t.getChildren()) {
                checkBal(mm, t2, currentDepth+1);
            }
        }
    }
    
    public static void main(String[] args) {
        System.out.println("Can I make a Tree?");
        System.out.println("here: " + new Tree("fred"));
        System.out.println("Ballenced? "+ isBallenced(new Tree("fred")));
        System.out.println("Ballenced2? "+ isBallenced2(new Tree("fred")));
        Tree t = new Tree("fred");
        t.getChildren().append(new Tree("Belphagor"));
        Tree steve = new Tree("Steve"); 
        t.getChildren().append(steve);
        System.out.println("t is: "+t);
        System.out.println("Ballenced? "+ isBallenced(t));
        System.out.println("Ballenced2? "+ isBallenced2(t));
        Tree oink  = new Tree("Oink");
        steve.getChildren().append(oink);
        System.out.println("t is: "+t);
        System.out.println("Ballenced? "+ isBallenced(t));
        System.out.println("Ballenced2? "+ isBallenced2(t));
        Tree longevity = new Tree("longevity");
        oink.getChildren().append(longevity);
        System.out.println("t is: "+t);
        System.out.println("Ballenced? "+ isBallenced(t));
        System.out.println("Ballenced2? "+ isBallenced2(t));
    }
}
