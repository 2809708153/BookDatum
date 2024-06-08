import java.util.*;
public class TestHashSet {
    public static void main(String[] args){
        Set<String> words = new HashSet<String>();
        words.add("Bats");
        words.add("Ants");
        words.add("Crabs");
        words.add("Ants");
        System.out.println(words.size());
        for (String word : words) {
            System.out.println(word);
        }
    }
}
