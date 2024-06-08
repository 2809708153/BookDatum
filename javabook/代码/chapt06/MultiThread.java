public class MultiThread {      
    public static void main(String[] args) { 
        System.out.println("main thread starts");
        SpeakThread thread = new SpeakThread();
        thread.start();
        try{Thread.sleep(1);} catch(Exception e){}
        System.out.println("I'm eating");
        System.out.println("main thread ends");
    }
}
class SpeakThread extends Thread{
    public void run() {
        System.out.println("new thread starts");
        System.out.println("I'm speaking");
        System.out.println("new thread ends");
    }
}
