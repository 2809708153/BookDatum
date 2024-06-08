public class ExceptionDemo{  
    public void f(int num) throws MyException {  
        if(num<0){  
            throw new MyException("参数不能为负数！");  
        }  
        System.out.println(num);  
    } 
    public void g(){  
        try{  
            f(1);  
            f(3);  
            f(0);  
            f(-1);  
            f(2);  
            f(-5);  
        }catch(MyException e){  
            System.err.println(e.getMessage());  
            return;//会立即返回吗？
        }finally{  
           System.out.println("无论什么时候！");     
        }  
    }  
    public static void main(String[] args) {  
        ExceptionDemo demo = new ExceptionDemo();  
        demo.g();  
    }  
}
class MyException extends Exception{  
    public MyException(String message){  
        super(message);  
    }  
} 
