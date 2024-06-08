public class CPU{ 
    public static void main(String[] args){ 
        CPU386 cpu = new CPU386();
    }
}
class CPU8086 {
  CPU8086() {
    System.out.println("8086 constructor");
  }
}

class CPU286 extends CPU8086 {
  CPU286() {
    System.out.println("286 constructor");
  }
}
class CPU386 extends CPU286 {
  CPU386() {
    System.out.println("386 constructor");
  }
}

    