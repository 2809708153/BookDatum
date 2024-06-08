public class ProducerConsumer {
    public static void main(String[] args) {
        Buffer b = new Buffer();
        Producer p = new Producer(b);
        p.start();
        Consumer c = new Consumer(b);
        c.start();
    }
}
class Buffer {
    public int data;
}
class Producer extends Thread {
    Buffer buffer;
    public Producer(Buffer b) {
        buffer = b;
    }
    public void run() {
        int i;
        for(i = 1; i <= 5; i++) {
            buffer.data = i;
        }
    }
}
class Consumer extends Thread {
    Buffer buffer;
    public Consumer(Buffer b) {
        buffer = b;
    }
    public void run() {
        int i;
        for(i = 1; i <= 5; i++) {
            System.out.println(buffer.data);
        }
    }
}
