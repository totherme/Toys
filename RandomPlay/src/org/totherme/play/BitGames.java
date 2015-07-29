package org.totherme.play;

public class BitGames {

    public static int combine(int n, int m, int i, int j) {
        
        int mask = 0xFFFFFFFF;
        //System.out.format("  mask = %x%n", mask);
        mask <<= (j+1);
        //System.out.format("  mask = %x%n", mask);
        mask |= ((1<<i)-1);
        //System.out.format("  mask = %x%n", mask);
        n &= mask;
        //System.out.format("  so n becomes: %x%n", n);
        
        // at this point we should have 0-ed out the bits of n that we're going to slap some of m in.
        
        int mask2 = ~ mask;
        //System.out.format("%n  mask2 = %x%n", mask2);
        m <<= i;
        //System.out.format("  m becomes = %x%n", m);
        m &= mask2;
        //System.out.format("  m becomes = %x%n", m);
        n |= m;
        //System.out.format("  so n becomes: %x%n", n);
        
        return n;
    }
    
    /**
     * 
     * @param a an integer
     * @param b an integer
     * @return the number of bits we need to flip to turn a into b.
     */
    public static int howManyBits(int a, int b) {
        int diffBits = a ^ b;
        int count = 0;
        while(diffBits != 0) {
            if (diffBits % 2 != 0) count++;
            diffBits >>>= 1;
        }
        return count;
    }

    public static void main(String[] args) {

        int n = 0;
        int m = Integer.MAX_VALUE;
        int i = 0;
        int j = 3;
        System.out.format("Trying with: %nn = %x \nm = %x%n i=%d, j=%d%n", n, m, i, j);
        System.out.format("Result: %x%n", combine(n,m,i,j));
        
        i = 4;
        j = 7;
        System.out.format("Trying with: %nn = %x \nm = %x%n i=%d, j=%d%n", n, m, i, j);
        System.out.format("Result: %x%n", combine(n,m,i,j));

        n = 0xFFFFFFFF;
        m = 0;
        i = 0;
        j = 3;
        System.out.format("Trying with: %nn = %x \nm = %x%n i=%d, j=%d%n", n, m, i, j);
        System.out.format("Result: %x%n", combine(n,m,i,j));
        
        i = 4;
        j = 7;
        System.out.format("Trying with: %nn = %x \nm = %x%n i=%d, j=%d%n", n, m, i, j);
        System.out.format("Result: %x%n", combine(n,m,i,j));
        
        System.out.println();
        System.out.println("howManyBits(31,14) = " + howManyBits(31, 14));
        System.out.println("howManyBits(14, 31) = " + howManyBits(14, 31));
        System.out.println("howManyBits(-1,-2) = " + howManyBits(-1, 2));
        System.out.println("howManyBits(-1,-3) = " + howManyBits(-1, -3));
        System.out.println("howManyBits(0xF0,0xFF) = " + howManyBits(0xF0, 0xFF));
        System.out.println("howManyBits(0xFFFFFFFF,0) = " + howManyBits(0xFFFFFFFF, 0));
        System.out.println("howManyBits(0,0xFFFFFFFF) = " + howManyBits(0, 0xFFFFFFFF));
        System.out.println("howManyBits(0x7FFFFFFF,0) = " + howManyBits(0x7FFFFFFF, 0));
        System.out.println("howManyBits(0,0x7FFFFFFF) = " + howManyBits(0, 0x7FFFFFFF));
        System.out.println("howManyBits(0xFFFFFFFF,0x7FFFFFFF) = " + howManyBits(0xFFFFFFFF, 0x7FFFFFFF));
        System.out.println("howManyBits(0x7FFFFFFF,0xFFFFFFFF) = " + howManyBits(0x7FFFFFFF, 0xFFFFFFFF));
    }
}
