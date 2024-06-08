public class Baby{
    String name;
    double weight;
    boolean isMale;
    int numPoops;
    Baby[] siblings;
    
    Baby(String myname, double myweight, boolean male) {
        name = myname;
        weight = myweight;
        isMale = male; 
    }   
    void poop() {
        numPoops ++;
        System.out.println("Dear mother,"+
                           "I have pooped. Ready the diaper.");
    }
    void sayHi(){
        System.out.println("Hi, my name is " + name);
    }
    void eat(double foodWeight) {
        weight += foodWeight;
    }

    public static void main(String[] args) {
        //Baby dawa = new Baby("¥Û¡¶ ø",20,true);
    }        
}
    