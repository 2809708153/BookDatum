import java.util.*;
public class Test1 {
    public static void main(String[] args) { 
        int[] a = { 1, 2, 3, 4 };
        try {
            for(int i = 1; i <= 4; i++)         System.out.println(a[i]);
            System.out.println("�һ�����ִ�е���");
        } catch (IndexOutOfBoundsException e) {
            System.out.println("��ĳ���������Խ�����");
        }
    }    
}
