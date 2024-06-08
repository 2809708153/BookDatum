import java.util.*;
public class HashSetPerformance {
    public static void main(String[] args){
        int length = 10000;
        HashSet<Integer> set = new HashSet<Integer> ();
        long t1, t2;
        
        for (int i=0; i<length; i++) 
            set.add(new Integer(i));
        
        Random random = new Random();
        t1 = System.nanoTime();
        for (int i = 0; i < length; i++) {
            int e = random.nextInt(length);
            set.contains(new Integer(e));
        }
        t2 = System.nanoTime();
        System.out.println(set.getClass());
        System.out.println("For length = " + length);
        System.out.println("Average query time = " + (t2-t1)/length + " ns");
    }
}
