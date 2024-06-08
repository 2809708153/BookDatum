import javax.swing.*;
import java.awt.event.*;
public class EventExample{
    public static void main(String[] args) {
        JFrame frame = new JFrame();
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        JButton button = new JButton("click me");
        frame.getContentPane().add(button);
        frame.setSize(200, 200);
        MyListener listener = new MyListener();
        button.addActionListener(listener);  // 第2步
        frame.setVisible(true);                        
    } 
}
class MyListener implements ActionListener {  // 第1步
    public void actionPerformed(ActionEvent e){ // 第1步
        System.out.println("I've been clicked");
    }
}
