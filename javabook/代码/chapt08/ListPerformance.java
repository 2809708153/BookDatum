import java.util.*;
public class ListPerformance {
    public static void main(String[] args){
        int length = 10000;
        int[] indicesA = getIndices(length);
        int[] indicesB = getIndices(length);
        ArrayList<Double> list = new ArrayList<>();
        Double element;
        long time0, time1;
        // Populate the list    
        for (int i=0; i<length; i++) {
            list.add(new Double(i));
        }
        time0 = System.nanoTime();
        for (int i=1; i<length; i++) {
            element = list.get(indicesA[i]);
            list.set(indicesB[i], element);
        }
        time1 = System.nanoTime();
        System.out.println(list.getClass());
        System.out.println("For length = " + length);
        System.out.println("Average get and set time = " +  (time1-time0)/length + " ns");
        System.out.println("Total time = "+(time1-time0)+" ns");
    }    
    //返回一个数组，每个元素为0～length-1之间的随机数，且不重复
    private static int[] getIndices (int length)
    {
        Random random = new Random();
        ArrayList<Integer> integers = new ArrayList<>();
        int[] indices = new int[length];
        for (int i=0; i<length; i++)
        {
            integers.add(random.nextInt(i+1), new Integer(i));
        }
        for (int i=0; i<length; i++)
        {
            indices[i] = integers.get(i);
        }
        return indices;
    }
    
}
