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
                break; //��������ִ�е����У�˵��û���׳��쳣
            } catch(IOException e1){
                System.out.println("IOException");
            } catch(NumberFormatException e2){
                System.out.println(str + "����һ������");
            }
        }
        System.out.println("�ղ�����������ǣ�" + n);    
    }
}
