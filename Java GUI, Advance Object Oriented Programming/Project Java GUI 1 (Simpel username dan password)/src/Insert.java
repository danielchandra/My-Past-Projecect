import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.*;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;

public class Insert implements ActionListener{
	JFrame jf;
    JTable j;
	//1. Driver
	//2. import java.sql.*;
	//3. Koneksi
	//4. Persiapan Statement
	
	//fungsi melihat data
	public static void getUser() {
		ResultSet rs;
		Koneksi kon = new Koneksi();
		try {
			rs = kon.getData("select * from user");
			while(rs.next()) {
				System.out.println(rs.getString(1) + " " + rs.getString(2) + " " + rs.getString(3) + " " + rs.getString(4));
			}
			kon.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	//fungsi delete user
	public static void updateUser() {
		int hasil=0;
		Koneksi kon = new Koneksi();
		try {
			hasil = kon.updateData("delete from user where id = 3");
			kon.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (hasil ==1) {
			System.out.println("Data Berhasil di delete");
		}else {
			System.out.println("Data tidak ada dalam query");
		}
	}
	
	//fungsi insert data
	public static void insertUser() {
		int hasil=0;
		String query = "insert into user values (5 , 'budi' , 20)";
		Koneksi kon = new Koneksi();
		try {
			hasil = kon.updateData(query);
			kon.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (hasil ==1) {
			System.out.println("Data Berhasil di insert");
		}else {
			System.out.println("Data gagal insert");
		}
	}
	
	public Insert() {
		
		
		
		//Membuat Panel
		JPanel jp = new JPanel(new GridLayout(7,5,5,8));
		
		
		//JTable
		// Data to be displayed in the JTable
		
//		String[][] data = {
//	            { rs.getString(1) , rs.getString(2) , rs.getString(3) , rs.getString(4))},
//	        };
		
        String[][] data = {
            { "2", "2022-07-01", "Transaksi hari ini diselesaikan hari ini" , "10" },
        };
        // Column Names
        String[] columnNames = { "ID", "Tanggal", "Keterangan","Nominal" };
        // Initializing the JTable
        j = new JTable(data, columnNames);
        j.setBounds(30, 40, 200, 300);
        // adding it to JScrollPane
        JScrollPane sp = new JScrollPane(j);
        jp.add(sp);

        //JLabel
		JLabel total = new JLabel("Total Nominal adalah");
		total.setHorizontalAlignment(JLabel.LEFT);
		jp.add(total);
		
		//TextField
		JLabel insertbaru = new JLabel("Masukkan Tanggal,Keterangan,Nominal baru untuk diinsert");
		insertbaru.setHorizontalAlignment(JLabel.LEFT);
		jp.add(insertbaru);
		JTextField jttanggal = new JTextField("",10);
		jp.add(jttanggal);
		JTextField jtKeterangan = new JTextField("",10);
		jp.add(jtKeterangan);
		JTextField jtNominal = new JTextField("",10);
		jp.add(jtNominal);
		
		//Button
		JButton jb = new JButton("Submit");
		jb.addActionListener(this);
		jp.add(jb);
        
		
		
		
		//Frame
		jf = new JFrame("Login");
		jf.setLocationRelativeTo(null);
		jf.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		jf.add(jp);
		//jf.setSize(400, 150);
		jf.pack();
		jf.setVisible(true);
	}
	
	public static void main (String[] args) throws Exception{
		new Insert();
	
		
		//Menggunakan external class Koneksi
		getUser();
		
//		updateUser();
//		insertUser();
		
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		
	}

}
