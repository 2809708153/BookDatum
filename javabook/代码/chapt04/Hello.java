import java.io.*;
public class Hello {  
    public static void main(String[] args) 
    { 
        BufferedReader reader = new BufferedReader
                    (new InputStreamReader(System.in));
        String str = reader.readLine(); //IO����
        int n = Integer.parseInt(str);
        System.out.println("�ղ�����������ǣ�" + n);
    }
}
