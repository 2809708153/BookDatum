import java.util.*;
public class MyArrayList {
    public static void main(String[] args) {
        ArrayList alist = new ArrayList( );        
        String str = new String("ÄÇÄê");
        Character c = new Character('ÎÒ');
        Integer n = new Integer(18);
        alist.add(str);    // element #0
        alist.add(c);      // element #1
        alist.add(n);      // element #2        
        String str2 = (String)alist.get(0);
        Character c2 = (Character)alist.get(1);
        Integer n2 = (Integer)alist.get(2);        
        System.out.println(str2);
        System.out.println(c2);
        System.out.println(n2);
    }
}
