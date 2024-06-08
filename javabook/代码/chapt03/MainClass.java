public class MainClass {
    public static void main(String[] args) {
        Dog dog = new Dog();
        Cat cat = new Cat();
        Duck duck = new Duck();
        dog.sound();
        cat.sound();
        duck.sound();
    }
}
class Animal {
    public void sound() {
        System.out.println("Sound for an animal");
    }
}
class Dog extends Animal { 
    public void sound() {  // Overriding
        System.out.println("ÍôÍô");
    }
}
class Cat extends Animal {
    public void sound() {  // Overriding
        System.out.println("ß÷ß÷");
    }
}
class Duck extends Animal { 
    public void sound() { 
        System.out.println("ßÉßÉ");
    }
}
