public class TestMan{
    public static void main(String[] args) {
        IronMan im = new IronMan();
        im.nickname = "∏÷Ã˙œ¿";
        Man m = im;
        m.name = "Tony Stark";
        im.print();
    }
}
class Man {
    String name;
}
class IronMan extends Man {
    String nickname;
    void print() {
        System.out.println("Man: " + name);
        System.out.println("Ironman: " + nickname);
    }
}
    