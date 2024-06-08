import java.io.*;
public class Rename {
    public static void main(String[] args) { 
      File oldFile = new File("old.txt");
      File newFile = new File("d:" + File.separator + "temp" + File.separator 
                                             + "new.txt");
      if(oldFile.exists()) {
            oldFile.renameTo(newFile);
      }
      else{
            try{
                  oldFile.createNewFile();    // throws IOException
            }catch(IOException e){
                  System.out.println("无法创建old.txt文件");
            }
        }
    }    
}
