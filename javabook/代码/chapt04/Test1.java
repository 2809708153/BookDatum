import java.util.*;
public class Test1 {
    public static void main(String[] args) { 
        int[] a = { 1, 2, 3, 4 };
        try {
            for(int i = 1; i <= 4; i++)         System.out.println(a[i]);
            System.out.println("我还有幸执行到吗？");
        } catch (IndexOutOfBoundsException e) {
            System.out.println("真的出现了数组越界错误！");
        }
    }    
}
