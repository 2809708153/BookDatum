public class TestSellTickets {
    public static void main(String[] args) {
        SellTickets t = new SellTickets();
        new Thread(t, "thread1").start();
        new Thread(t, "thread2").start();
        new Thread(t, "thread3").start();
    }
}
class SellTickets implements Runnable
{
  private int tickets = 6;   
  public void run() {
    while(tickets > 0)
    {
       int waitTime = (int)(Math.random() * 1000);
        try{Thread.sleep(waitTime);} catch(Exception e){}
       System.out.println(Thread.currentThread().getName()+
                       " is selling ticket " + tickets);
       tickets --;
    }
  }
}
