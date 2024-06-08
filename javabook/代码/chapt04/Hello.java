import java.io.*;
public class Hello {  
    public static void main(String[] args) 
    { 
        BufferedReader reader = new BufferedReader
                    (new InputStreamReader(System.in));
        String str = reader.readLine(); //IO操作
        int n = Integer.parseInt(str);
        System.out.println("刚才输入的整数是：" + n);
    }
}
