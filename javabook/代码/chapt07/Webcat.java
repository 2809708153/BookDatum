import java.net.*;
import java.io.*;
public class Webcat {
    public static void main(String[] args) { 
        try {
            URL u = new URL(args[0]);
            InputStream in = u.openStream();
            InputStreamReader isr = new InputStreamReader(in);
            BufferedReader br = new BufferedReader(isr);
            String theLine;
            while ((theLine = br.readLine()) != null) {
                System.out.println(theLine);
            }
        } catch (IOException e) { System.err.println(e);} 
    }
}
