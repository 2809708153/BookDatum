public class Calculation3{  
    void sum(int a, double b){System.out.println(a+b);}
    void sum(double b, int a){System.out.println(a+b);}
    public static void main(String args[]){  
        Calculation3 obj = new Calculation3();  
        obj.sum(10, 10.5);  
        obj.sum(20.5, 20); 
  }  
} 
