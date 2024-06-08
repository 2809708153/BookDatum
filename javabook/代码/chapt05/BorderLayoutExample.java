import javax.swing.*;
import java.awt.*;
public class BorderLayoutExample {       
    public static void main(String[] args) { 
        JFrame f = new JFrame("BorderLayout");
        f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        JPanel cp = (JPanel)f.getContentPane();
        cp.setLayout(new BorderLayout());
        cp.add("North", new JButton(new ImageIcon("north.jpg")));
        cp.add("East", new JButton(new ImageIcon("east.jpg")));
        cp.add("South", new JButton(new ImageIcon("south.jpg")));
        cp.add("West", new JButton(new ImageIcon("west.jpg")));
        cp.add("Center", new JButton(new ImageIcon("middle.jpg")));
        f.pack();
        f.setVisible(true); 
    }
}
