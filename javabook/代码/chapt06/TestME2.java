public class TestME2 {
    public static void main(String[] args) {
        Data d = new Data(1);
        Thread1 t1 = new Thread1(d);
        t1.start();
        Thread2 t2 = new Thread2(d);
        t2.start();
        try{Thread.sleep(200);}catch(Exception e){};
        System.out.println(d.count);
    }
}
class Data {
    public int count;
    public Data(int n) {
        count = n;
    }
}
class Thread1 extends Thread{
    Data data;
    public Thread1(Data d){
        data = d;
    }
    public void run() {
        int tmp1;
        synchronized(data){
           tmp1 = data.count;
           tmp1 ++;
           data.count = tmp1;
        }
    }
}
class Thread2 extends Thread{
    Data data;
    public Thread2(Data d) {        
        data = d;
    }
    public void run() {
        int tmp2;
        synchronized(data){
           tmp2 = data.count;
           tmp2 = tmp2 + 2;
           data.count = tmp2;
        }
    }
}
