public class Banana{  
    double price;
    void setPrice(int val) {
        this.price = val; 
    } 
    public static void main(String args[]){  
        Banana a = new Banana();
        Banana b = new Banana(); 
        a.setPrice(10);
        b.setPrice(20);
  }  
} 
