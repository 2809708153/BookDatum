import java.io.*;    // for File
import java.util.*;  // for Scanner
import java.text.*;
public class Hours {    
    public static void main(String[] args) 
        throws FileNotFoundException { 
        Scanner input = new Scanner(new File("hours.txt"));
        while (input.hasNextLine()) {
            String line = input.nextLine();
            processEmployee(line);
        }        
    }
    public static void processEmployee(String line) {
        Scanner lineScan = new Scanner(line);
        int id = lineScan.nextInt();          // e.g. 456
        String name = lineScan.next();        // e.g. "Greg"
        double sum = 0.0;
        int count = 0;
        while (lineScan.hasNextDouble()) {
            sum = sum + lineScan.nextDouble();
            count++;
        }
        double average = sum / count;
        DecimalFormat nf = new DecimalFormat("0.00");
        System.out.println(name + " (ID#" + id + ") worked " +
            nf.format(sum) + " hours (" + average + " hours/day)");
    }
    
}
