public class TestParent{
    public static void main(String[] args) {
        Parent a = new Child();
        ((Child)a).setName("ЮђПе");
        System.out.println(((Child)a).name);
    }
}
class Parent {
}
class Child extends Parent {
    public String name;
    public void setName(String s) {
        name = s;
    }
}
    