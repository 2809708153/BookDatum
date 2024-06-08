public class Dog {
    public void bark() {
        System.out.println("ÍôÍôÍô!");
    }

    public void bark(boolean injured) {
        if(injured) {
            System.out.println("ÎØÑÊ...");
        }
    }
    public void bark(int mood){
        if(mood == 0)   // normal
            System.out.println("ÍôÍôÍô£¡");
        else if(mood == 1) //happy
            System.out.println("Íú£¡ÍúÍú£¡");
        else if(mood == 2)  //sad
            System.out.println("ÎØ£­ÎØ");
    }
    public static void main(String[] args){
        Dog ahuang = new Dog();
        ahuang.bark();
        ahuang.bark(true);
        ahuang.bark(1);
    }
}
