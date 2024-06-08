public class TestPriority {
    public static void main(String[] args) {
        MyThread t1= new MyThread("I'm a pretty woman.");
        t1.setPriority(Thread.MIN_PRIORITY);
        t1.start();        
        MyThread t2 = new MyThread("I'm a fat woman.");
        t2.setPriority(Thread.MAX_PRIORITY);
        t2.start();        
    }
}
class MyThread extends Thread {
    String message;
    public MyThread(String m) {
        message = m;
    }
    public void run() {
        for(int i = 1; i <= 3; i++) 
          System.out.println(message+" Priority:"+getPriority());
    }
}
