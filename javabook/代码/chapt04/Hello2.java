import java.io.*;
public class Hello2 {  
    public static void main(String[] args) 
    { 
        try{
            BufferedReader reader = new BufferedReader
                    (new InputStreamReader(System.in));
            String str = reader.readLine(); //IO操作
            int n = Integer.parseInt(str);
            System.out.println("刚才输入的整数是：" + n);
        } catch(IOException e){
            System.out.println("readLine()失败");
        }
    }
}
