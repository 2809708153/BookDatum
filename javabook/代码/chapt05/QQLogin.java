import java.awt.*;
import javax.swing.*;
import java.awt.event.*;

public class QQLogin extends JFrame implements ActionListener{
    JButton m_loginButton;
    public static void main(String[] args) { 
        QQLogin app = new QQLogin();
        app.go();
    }
    public void go()
    {
        setTitle("QQ");
        setSize(395, 305);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        
        // 设置背景图片
        ImageIcon bg = new ImageIcon("sky.jpg");
        JLabel label = new JLabel(bg);
        label.setBounds(0, 0, bg.getIconWidth(), bg.getIconHeight());
        getLayeredPane().add(label, new Integer(-30001)); //Integer.MIN_VALUE
        // 设置ContentPane透明
        JPanel contentPane = (JPanel)getContentPane();
        contentPane.setOpaque(false);

        // contentPane = topPanel + buttonPanel
        contentPane.setLayout(new BorderLayout());        
        JPanel topPanel = getTopPanel();
        topPanel.setOpaque(false);
        contentPane.add(topPanel, "Center");
        JPanel buttonPanel = getButtonPanel(); 
        contentPane.add(buttonPanel, "South");
        
        setVisible(true);
    }
    private JPanel getTopPanel() {
        // topPanel = blank + userInfoPanel
        JPanel panel = new JPanel();
        panel.setLayout(new GridLayout(2,1));
        panel.add(new JLabel(" "));
        JPanel userInfo = getUserInfoPanel();
        userInfo.setOpaque(false);
        panel.add(userInfo);
        return panel;
    }
    private JPanel getUserInfoPanel() {
        JPanel userInfoPanel = new JPanel();

        // userInfoPanel = 头像 + accountPanel + registerPanel
        userInfoPanel.setLayout(new FlowLayout());
        //1、头像
        JLabel pic = new JLabel(new ImageIcon("头像.jpg"));
        userInfoPanel.add(pic);
        
        //2、用户名、密码、参数信息
        JPanel accountPanel = getAccountPanel();
        accountPanel.setOpaque(false);
        userInfoPanel.add(accountPanel);
        
        //3、注册和找回密码按钮
        JPanel registerPanel = getRegisterPanel();
        registerPanel.setOpaque(false);
        userInfoPanel.add(registerPanel);
        
        return(userInfoPanel);
    }
    private JPanel getAccountPanel() {
        JPanel accountPanel = new JPanel();
        
        //accountPanel = user + password + checkPanel
        accountPanel.setLayout(new BorderLayout(0, 5));        
        //1.用户帐号
        String[] ids = {"8278320112                        ", 
                        "6278293426                        ", 
                        "6277316851                        "};
        JComboBox<String> user = new JComboBox<String>(ids);
        user.setEditable(true);
        accountPanel.add(user, "North");

        //2.密码
        JPasswordField password = new JPasswordField(15);
        accountPanel.add(password, "Center");
        
        //3.设置复选框
        JPanel checkPanel = getCheckPanel();
        checkPanel.setOpaque(false);
        accountPanel.add(checkPanel, "South");
                
        return(accountPanel);
    }
    private JPanel getCheckPanel()
    {
        JPanel checkPanel = new JPanel();
        
        // checkPanel = check1 + check2
        checkPanel.setLayout(new BoxLayout(checkPanel,BoxLayout.X_AXIS));
        Font font= new Font("宋体", Font.BOLD, 12);
        JCheckBox check1 = new JCheckBox("记住密码", true);        
        check1.setFont(font);
        checkPanel.add(check1);
        
        JCheckBox check2 = new JCheckBox("自动登录", false);
        check2.setFont(font); 
        checkPanel.add(check2);

        return(checkPanel);
    }
    private JPanel getRegisterPanel()
    {
        JPanel registerPanel = new JPanel(); 
        registerPanel.setLayout(new BoxLayout(registerPanel, BoxLayout.Y_AXIS));

        // registerPanel = button1 + button2
        JButton button1 = new JButton("注册帐号"); 
        button1.setBorderPainted(false);
        button1.setFocusPainted(false);
        button1.setContentAreaFilled(false);
        button1.setAlignmentX(Component.LEFT_ALIGNMENT);
        registerPanel.add(button1);
        button1.addActionListener(this);
      
        JButton button2 = new JButton("找回密码");
        button2.setBorderPainted(false);
        button2.setFocusPainted(false);
        button2.setContentAreaFilled(false);
        button2.setAlignmentX(Component.LEFT_ALIGNMENT);
        registerPanel.add(button2);
        button2.addActionListener(this);
        
        return(registerPanel);
    }   
    private JPanel getButtonPanel() {
        JPanel buttonPanel = new JPanel();
        buttonPanel.setLayout(new BorderLayout(50,0));

        // buttonPanel = button1 + button2
        JButton button1 = new JButton(new ImageIcon("多帐号登录.jpg"));
        button1.setBorderPainted(false);
        button1.setFocusPainted(false);
        button1.setContentAreaFilled(false); 
        buttonPanel.add(button1,"West");
        button1.addActionListener(this);
        
        m_loginButton = new JButton("      登           录      ");
        buttonPanel.add(m_loginButton, "Center");
        m_loginButton.addActionListener(this);
        
        JButton button2 = new JButton(new ImageIcon("二维码登录.jpg"));
        button2.setBorderPainted(false);
        button2.setFocusPainted(false);
        button2.setContentAreaFilled(false);
        buttonPanel.add(button2 , "East");
        button2.addActionListener(this);
        
        return(buttonPanel);
    }
    public void actionPerformed(ActionEvent e){
        Object obj = e.getSource();
        if(obj == (Object)m_loginButton) JOptionPane.showMessageDialog(null, "login");
        else JOptionPane.showMessageDialog(null, "button pressed");
    }
}
