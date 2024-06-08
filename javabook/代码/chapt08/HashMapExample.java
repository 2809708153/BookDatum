import java.util.*;
public class HashMapExample {
    public static void main(String[] args){
        System.out.println(
                           frequency(new String[]{
            "Momo", "Momo", "Koko", "Noa", "Momo", "Koko"
        }).toString());
    }
    public static HashMap<String, Integer> frequency(String[] names) {
        HashMap<String, Integer> frequency = 
            new HashMap<String, Integer>();
        for(String name : names) {
            Integer currentCount = frequency.get(name);
            if(currentCount == null) {
                currentCount = 0; // auto-boxing
            }
            frequency.put(name, ++currentCount);
        }
        return frequency;
    }
    
}
