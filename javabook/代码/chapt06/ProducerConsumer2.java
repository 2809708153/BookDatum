public class ProducerConsumer2 {
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
    public boolean isEmpty = true;
    public synchronized void produce(int n){       
        if(isEmpty == false){
            try{wait();}catch(Exception e){}
        }
        data = n;
        isEmpty = false;
        notify();        
    }    
    public synchronized void consume(){        
        if(isEmpty == true){
            try{wait();}catch(Exception e){}
        }
        System.out.println(data);
        isEmpty = true;
        notify();
    }
}
class Producer extends Thread {
    Buffer buffer;
    public Producer(Buffer b) {
        buffer = b;
    }
    public void run() {
        int i;
        for(i = 1; i <= 5; i++) buffer.produce(i);
    }
}
class Consumer extends Thread {
    Buffer buffer;
    public Consumer(Buffer b) {
        buffer = b;
    }
    public void run() {
        int i;
        for(i = 1; i <= 5; i++) buffer.consume();
    }
}
