public class BankAccount{
    private String number;  //�ʺ�
    private double balance;  //���
    private String password;  //����
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
