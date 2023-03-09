import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class Main implements ActionListener{
	JFrame jf;
	private JTextField jtusername,jtpassword;
	public Main() {
		//Membuat Panel
		JPanel jp = new JPanel(new GridLayout(5,5,5,5));
		
		//Email
		JLabel username = new JLabel("Email");
		username.setHorizontalAlignment(JLabel.LEFT);
		jp.add(username);
		//TextField Email
		jtusername = new JTextField("",10);
		jp.add(jtusername);
		
		
		
		//Membuat Label Password
		JLabel password = new JLabel("Password");
		username.setHorizontalAlignment(JLabel.LEFT);
		jp.add(password);
		//TextField Password
		jtpassword = new JTextField("",10);
		jp.add(jtpassword);
		
		
		//Membuat button untuk input jawaban
		JButton jb = new JButton("Enter");
		jb.addActionListener(this);
		jp.add(jb);
		
		//Membuat Frame
		jf = new JFrame("Login");
		jf.setLocationRelativeTo(null);
		jf.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		jf.add(jp);
		//jf.setSize(400, 150);
		jf.pack();
		jf.setVisible(true);
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new Main();
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		if (jtusername.getText().isEmpty() || jtpassword.getText().isEmpty()) {
			JOptionPane.showMessageDialog(null, "Mohon Lengkapi Data");
		}else {
			JOptionPane.showMessageDialog(null, "Selamat Datang " + jtusername.getText() +" !");
			new Menu();
			jf.dispose();
		}
		
	}

}
