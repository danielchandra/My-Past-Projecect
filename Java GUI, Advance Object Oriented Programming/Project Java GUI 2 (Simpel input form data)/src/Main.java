import java.awt.GridLayout;

import javax.swing.ButtonGroup;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.JTextField;

public class Main {
	JFrame jf;
	
	private String dates[]
	        = { "1", "2", "3", "4", "5",
	            "6", "7", "8", "9", "10",
	            "11", "12", "13", "14", "15",
	            "16", "17", "18", "19", "20",
	            "21", "22", "23", "24", "25",
	            "26", "27", "28", "29", "30",
	            "31" };
	    private String months[]
	        = { "Jan", "feb", "Mar", "Apr",
	            "May", "Jun", "July", "Aug",
	            "Sup", "Oct", "Nov", "Dec" };
	    private String years[]
	        = { "1995", "1996", "1997", "1998",
	            "1999", "2000", "2001", "2002",
	            "2003", "2004", "2005", "2006",
	            "2007", "2008", "2009", "2010",
	            "2011", "2012", "2013", "2014",
	            "2015", "2016", "2017", "2018",
	            "2019","2020","2021","2022" };

	public Main() {
		
		//Membuat Panel
		JPanel jp = new JPanel(new GridLayout(10,8,8,11));
		
		//NIK
		JLabel NIK = new JLabel("NIK:");
		NIK.setHorizontalAlignment(JLabel.LEFT);
		jp.add(NIK);
		//TextField
		JTextField jtNIK = new JTextField("",10);
		jp.add(jtNIK);
		
		//Nama
		JLabel nama = new JLabel("Nama:");
		nama.setHorizontalAlignment(JLabel.LEFT);
		jp.add(nama);
		//TextField
		JTextField jtNama = new JTextField("",10);
		jp.add(jtNama);
		
		//Alamat
		JLabel Alamat = new JLabel("Alamat");
		Alamat.setHorizontalAlignment(JLabel.LEFT);
		jp.add(Alamat);
		//TextField
		JTextField jtAlamat = new JTextField("",10);
		jp.add(jtAlamat);
		
		//Tanggal Lahir
		JLabel dob = new JLabel("Tanggal Lahir");
		dob.setHorizontalAlignment(JLabel.LEFT);
		JPanel jpdob = new JPanel(new GridLayout(1,2));
		
	    JComboBox date = new JComboBox(dates);

	    JComboBox month = new JComboBox(months);

	    JComboBox year = new JComboBox(years);
	    jp.add(dob);
	    jpdob.add(date);
//	    jp.add(Bulan);
	    jpdob.add(month);
//	    jp.add(Tahun);
	    jpdob.add(year);
	    jp.add(jpdob);
//		JLabel Tanggal = new JLabel("Tanggal Lahir:");
//		Tanggal.setHorizontalAlignment(JLabel.LEFT);
//		jp.add(Tanggal);
//		//TextField
//		JTextField jtTanggal = new JTextField("",10);
//		jp.add(jtTanggal);
		
		//Jenis Kelamin
		JLabel gender = new JLabel("Jenis Kelamin: ");
		gender.setHorizontalAlignment(JLabel.LEFT);
		JPanel jpgender = new JPanel(new GridLayout(1,2));
		JRadioButton male = new JRadioButton ("Male");
		JRadioButton female = new JRadioButton ("Female");
		//Digabung menjadi ButtonGroup
		ButtonGroup genderGroup = new ButtonGroup();
		genderGroup.add(male);
		genderGroup.add(female);
		jp.add(gender);
		jpgender.add(male);
		jpgender.add(female);
		jp.add(jpgender);
		
		//Agama
		JLabel Agama = new JLabel("Agama: ");
		Agama.setHorizontalAlignment(JLabel.LEFT);
		jp.add(Agama);
		JComboBox cmb = new JComboBox(new Object[] {"Islam","Kristen","Buddha"});
		jp.add(cmb);
		
		
		//Pekerjaan
		JLabel Pekerjaan = new JLabel("Pekerjaan:");
		Pekerjaan.setHorizontalAlignment(JLabel.LEFT);
		jp.add(Pekerjaan);
		//TextField
		JTextField jtPekerjaan = new JTextField("",10);
		jp.add(jtPekerjaan);
		
		//Kewarnegaraan
		JLabel warga = new JLabel("Kewarnegaraan: ");
		warga.setHorizontalAlignment(JLabel.LEFT);
		JPanel jpwarga = new JPanel(new GridLayout(1,2));
		JRadioButton WNI = new JRadioButton ("WNI");
		JRadioButton WNA = new JRadioButton ("WNA");
		//Digabung menjadi ButtonGroup
		ButtonGroup wargaGroup = new ButtonGroup();
		wargaGroup.add(WNI);
		wargaGroup.add(WNA);
		jp.add(warga);
		jpwarga.add(WNI);
		jpwarga.add(WNA);
		jp.add(jpwarga);
		
		
		 
	
		//Membuat Frame
		jf = new JFrame("Penginputan Data Diri");
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


}
