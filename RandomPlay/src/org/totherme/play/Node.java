package org.totherme.play;

import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Queue;
import java.util.Set;
import java.util.function.Predicate;

public class Node implements Iterable<Node> {

    private String name;
    private Set<Node> kids = new HashSet<>();
    public Node(String name) { this.name = name ; }
    public void addKid(Node n) { kids.add(n); }
    
    @Override
    public String toString() {
        String s = name;
        s+="< ";
        for(Node n : this) {
            s+= n.name+"<...> ";
        }
        s+=">";
        return s;
    }
    
    @Override
    public Iterator<Node> iterator() {
        return kids.iterator();
    }
    
    public static boolean isThereAPath(Node x, Node y) {
        Queue<Node> q = new LinkedList<>();
        Set<Node> seen = new HashSet<>();
        for (Node n:x) { q.add(n); }
        for (Node n:y) { q.add(n); }
        return search(q, seen, ((Node n)-> n==x || n==y));
    }
    
    public static boolean search(Queue<Node> q, Set<Node> seen, Predicate<Node> p) {
        while(q.size() > 0) {
            Node x = q.poll();
            if(p.test(x)) return true;
            for(Node y:x) {
                if(!seen.contains(y)) q.add(y);
            }
            seen.add(x);
        }
        return false;
    }
    
    public static void main(String[] args) {
        Node x = new Node("x");
        Node y = new Node("y");
        System.out.println("X is: "+ x + " whily Y is: "+y);
        System.out.println("Is there a path? "+isThereAPath(x, y));
        System.out.println("The other way? "+isThereAPath(y, x));
        x.addKid(y);
        System.out.println("X is: "+ x + " whily Y is: "+y);
        System.out.println("Is there a path? "+isThereAPath(x, y));
        System.out.println("The other way? "+isThereAPath(y, x));
        x = new Node("x");
        Node z = new Node("z");
        x.addKid(z);
        System.out.println("X is: "+ x + " while Y is: "+y+ " and Z is "+z);
        System.out.println("Is there a path? "+isThereAPath(x, y));
        System.out.println("The other way? "+isThereAPath(y, x));
        z.addKid(y);
        System.out.println("X is: "+ x + " while Y is: "+y+ " and Z is "+z);
        System.out.println("Is there a path? "+isThereAPath(x, y));
        System.out.println("The other way? "+isThereAPath(y, x));
        
    }
}
