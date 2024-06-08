public class Baby2{
    int servings; 
    void feed(int servings) {
        servings += servings; 
    } 
    void poop() {
        System.out.println("All better!");
        servings = 0;
    }
    public static void main(String[] args) {
        Baby2 dawa = new Baby2();
        dawa.feed(10);
        System.out.println(dawa.servings);
    }
}
    