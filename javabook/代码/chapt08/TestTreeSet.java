import java.util.*;
public class TestTreeSet {
    public static void main(String[] args){
        Set<String> words = new TreeSet<String>();
        words.add("Bats");
        words.add("Ants");
        words.add("Crabs");
        for (String word : words) {
            System.out.println(word);
        }
    }
}
