public class NotEnoughMoney extends Exception 
{ 
    int my_money;
    public NotEnoughMoney() { }     
    public NotEnoughMoney(String msg) { 
        super(msg);     
    }
    public void GetMoney (int money)
        throws NotEnoughMoney 
    {
        if(money > my_money) 
            throw new NotEnoughMoney();
    }
    /*
    public void BuyStuff() {
        try {
            GetMoney(200);
            System.out.println("买了！");
        } catch (NotEnoughMoney e) {
            System.out.println("异常：钱不够！");
        }
    }
*/
    
    public void BuyStuff() throws NotEnoughMoney {
    GetMoney(200);
    System.out.println("买了！");
    }

     
}
