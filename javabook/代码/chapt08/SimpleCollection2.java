import java.util.*;
public class SimpleCollection2  {
    public static void main(String[] args) {
        Collection c;
        c = new ArrayList();
        System.out.println(c.getClass().getName());
        for(int i=1; i <= 10; i++) { 
            c.add(i + " * " + i + " = "+i*i);
        }
        for(Object obj : c){
            System.out.println(obj);
        }
    }
}
