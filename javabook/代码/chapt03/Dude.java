
public class Dude{
    public String name;
    public int hp = 100; // Ѫ��
    public int mp = 0; // ħ��ֵ
    public void sayName() {
        System.out.println(name);
    }
    public void punchFace(Dude target) {
        target.hp -= 10;
    }
    
    public static void main(String[] args) {
        //System.out.println("Test");
        GrandWizard grandWizard1 = new GrandWizard();
        grandWizard1.name = "Flash";
        grandWizard1.sayName();
        
    }
}
    