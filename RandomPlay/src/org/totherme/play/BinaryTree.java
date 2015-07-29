package org.totherme.play;

import java.util.Arrays;

@interface NotNull {}

public class BinaryTree {
    private int key;
    private BinaryTree left;
    private BinaryTree right;
    
    public BinaryTree(int key) {
        this.key = key;
    }
    
    public int getKey() { return key; }
    
    public void setLeft(BinaryTree left) { this.left = left; }
    public void setRight(BinaryTree right) { this.right = right; }
    
    public String toString() {
        return key+"< "+left+" "+right+" >";
    }

    public void insert(int i) {
        if (i < key) {
            if (left==null) {
                left = new BinaryTree(i);
            } else {
                left.insert(i);
            }
        } else {
            if (right==null) {
                right = new BinaryTree(i);
            } else {
                right.insert(i);
            }
        } 
    }
    
    public static BinaryTree makeTree(@NotNull int[] numbers) {
        if (numbers.length == 0) return null;
        int i = numbers.length / 2;
        BinaryTree t = new BinaryTree(numbers[i]);
        makeTreeWork(t, Arrays.copyOfRange(numbers, 0, i));
        makeTreeWork(t, Arrays.copyOfRange(numbers, i+1, numbers.length));
        return t;
    }
    
    public static void makeTreeWork(@NotNull BinaryTree t, @NotNull int[] numbers) {
        if (numbers.length == 0) return;
        int i = numbers.length / 2;
        t.insert(numbers[i]);
        makeTreeWork(t, Arrays.copyOfRange(numbers, 0, i));
        makeTreeWork(t, Arrays.copyOfRange(numbers, i+1, numbers.length));
    }
    
    public static void main(String[] args) {
        BinaryTree t5 = new BinaryTree(5);
        BinaryTree ts = new BinaryTree(5);
        System.out.println("t5 = "+t5);
        System.out.println("ts = "+ts);
        BinaryTree t3 = new BinaryTree(3);
        t5.setLeft(t3);
        ts.insert(3);
        System.out.println("t5 = "+t5);
        System.out.println("ts = "+ts);
        BinaryTree t1 = new BinaryTree(1);
        t3.setLeft(t1);
        ts.insert(1);
        System.out.println("t5 = "+t5);
        System.out.println("ts = "+ts);
        BinaryTree t4 = new BinaryTree(4);
        t3.setRight(t4);
        ts.insert(4);
        System.out.println("t5 = "+t5);
        System.out.println("ts = "+ts);
        BinaryTree t7 = new BinaryTree(7);
        t5.setRight(t7);
        ts.insert(7);
        System.out.println("t5 = "+t5);
        System.out.println("ts = "+ts);
        System.out.println();
        
        int[] array = new int[0];
        System.out.println(array+" gives "+makeTree(array));
        array = new int[1];
        array[0] = 5;
        System.out.println(array+" gives "+makeTree(array));
        array = new int[2];
        array[0] = 1;
        array[1] = 5;
        System.out.println(array+" gives "+makeTree(array));
        array = new int[3];
        array[0] = 1;
        array[1] = 5;
        array[2] = 9;
        System.out.println(array+" gives "+makeTree(array));
        array = new int[4];
        array[0] = 1;
        array[1] = 3;
        array[2] = 5;
        array[3] = 9;
        System.out.println(array+" gives "+makeTree(array));
        array = new int[5];
        array[0] = 1;
        array[1] = 3;
        array[2] = 5;
        array[3] = 7;
        array[4] = 9;
        System.out.println(array+" gives "+makeTree(array));
    }
}
