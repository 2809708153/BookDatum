import javax.swing.*;
import java.awt.*;
public class PaintFrame extends JFrame {   
    public PaintFrame() { 
        setTitle("Drawing Graphics in Frames");
        setBounds(100,50,300,300);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setVisible(true);
    }   
    public static void main(String[] args) { 
        PaintFrame frame = new PaintFrame();        
    }
    public void paint(Graphics g) {
        g.setColor(Color.RED);
        g.fillOval(20, 20, 100, 100);
    }    
}
