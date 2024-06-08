import java.io.*;
public class Hello3 {  
    public static void main(String[] args) 
    { 
        int n = 0;
        String str = "";
        while(true)
        { 
            try{
                BufferedReader reader = new BufferedReader
                    (new InputStreamReader(System.in));
                str = reader.readLine(); // e1 
                n = Integer.parseInt(str); // e2
                break; //若代码能执行到本行，说明没有抛出异常
            } catch(IOException e1){
                System.out.println("IOException");
            } catch(NumberFormatException e2){
                System.out.println(str + "不是一个整数");
            }
        }
        System.out.println("刚才输入的整数是：" + n);    
    }
}
