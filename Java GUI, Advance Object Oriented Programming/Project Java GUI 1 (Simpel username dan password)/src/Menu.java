import java.awt.FlowLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;

public class Menu implements ActionListener{
	JFrame jf;
	JButton jb1 = new JButton("Insert Data");
	JButton jb2 = new JButton("Update Profile");
	JButton jb3 = new JButton("Logout");


	public Menu() {
		//Membuat Panel
		JPanel jp = new JPanel(new GridLayout(1,1,1,1));
		
		//3 Button
		jb1.addActionListener(this);
		jb2.addActionListener(this);
		jb3.addActionListener(this);
		//Rapiin posisi button biar bisa kanan kiri
		FlowLayout fl = new FlowLayout();
		fl.setHgap(5);
		fl.setVgap(5);
		fl.setAlignment(FlowLayout.CENTER);
		JPanel jpFlow = new JPanel();
		jpFlow.add(jb1);
		jpFlow.add(jb2);
		jpFlow.add(jb3);
		jp.add(jpFlow);
		
		//Frame
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
		new Menu();
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		if(e.getSource() == jb1) {
			new Insert();
			jf.dispose();
		}
		
		if(e.getSource() == jb3) {
			JOptionPane.showMessageDialog(null, "Log Out Berhasil Dilakukan, kembali ke Menu Utama");
			new Main();
			jf.dispose();
		}
	}

}
