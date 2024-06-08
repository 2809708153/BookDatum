import java.util.*;
import java.io.*;
public class SpellCheck {        
    public static void main(String[] args) throws Exception{

        Set<String> dictionaryWords = readWords("words.txt");
        Set<String> documentWords = readWords("1.txt");
        
        for(String word : documentWords) {
            if(!dictionaryWords.contains(word))
                   System.out.println(word);
        }
    } 
   /* Reads all words from a file. 
              Return a set with all lowercased words in the file */
   public static Set<String> readWords(String filename)
                           throws Exception {
        Set<String> words = new HashSet<String>();
        Scanner in = new Scanner(new File(filename));
        // Use any character other than a-z or A-Z as delimiters
        in.useDelimiter("[^a-zA-Z]+");
        while(in.hasNext())
            words.add(in.next().toLowerCase());
        return words;
    }
}
