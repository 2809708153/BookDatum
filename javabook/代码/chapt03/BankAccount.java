public class BankAccount{
    private String number;  //’ ∫≈
    private double balance;  //”‡∂Ó
    private String password;  //√‹¬Î
    public void deposit(double money){
        balance += money;
    }
    public void withdraw(double money){
        balance -= money;
    }
    public void resetPassword(String pwd){
        password = pwd;
    }
}
