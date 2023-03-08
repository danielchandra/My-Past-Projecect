import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.FlowLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.util.Random;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;

class Game{
	private int angka1;
	private int angka2;
	private int hasil;
	private int score;
	//buat melacak lambang
	String temp ="";
	
	public Game() {
		angka1 = 0;
		angka2 = 0;
		hasil = 0;
		score = 0;
	}
	
	
	public int getRandomSign() {
	    Random rand = new Random();
	    if(rand.nextBoolean()) {
	    	temp="-";
	        return -1;
	    }
	    else {
	    	temp="+";
	        return 1;
	    }
	}
	
	
	public String pertanyaan() {
		angka1 = randomAngka();
		angka2 = randomAngka();
		hasil = angka1 + angka2 * getRandomSign();
		return angka1 + " " + temp + " "+ angka2 + " = ?";
	}
	
	public int randomAngka() {
		return (int)(Math.random() * 100) + 1;
	}

	public int getHasil() {
		return hasil;
	}
	
	public void setScore(int jawaban) {
		if(jawaban == 1)score += 10;
		else score -= 5;
	}
	
	public int getScore() {
		return score;
	}
}


public class Main implements ActionListener {
	

	Game gm;
	JLabel score;
	JTextField jawaban;
	JLabel soal;
	JFrame jf;

	public Main() {
		gm = new Game();

		//Membuat Panel
		JPanel jp = new JPanel(new GridLayout(7,15,15,8));
		
		//Membuat label Score
		score = new JLabel();
		score.setText("Score: 0");
		jp.add(score);
				
		//Membuat Soal dengan Random
		JLabel Pertanyaan = new JLabel("Pertanyaan:");
		Pertanyaan.setHorizontalAlignment(JLabel.LEFT);
		jp.add(Pertanyaan);
		soal = new JLabel();
		//dimabil dari gm main
		soal.setText(gm.pertanyaan());
		jp.add(soal);
		
		//Membuat Label dan TextField untuk jawabannya
		JLabel labeljwb = new JLabel("Jawaban:");
		labeljwb.setHorizontalAlignment(JLabel.LEFT);
		jp.add(labeljwb);
		jawaban = new JTextField();
		jp.add(jawaban);
				
		//Membuat button untuk input jawaban
		JButton jb = new JButton("Submit");
		jb.addActionListener(this);
		jp.add(jb);
		
		//Pembuatan Frame
		jf = new JFrame("Game");
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
		//Tidak Boleh kosong
		if(jawaban.getText().length()==0) {
			JOptionPane.showMessageDialog(null, "Jawaban kosong");
		}
		else {
			int flag = 0;
			try {
				//harus berupa angka integer
				int jawabanInt = Integer.parseInt(jawaban.getText());
			} catch (Exception e2) {
				flag = 1;
				JOptionPane.showMessageDialog(null, "Jawaban Harus Integer");
			}
			
			//buat perhitungan score
			if(flag==0) {
				if(Integer.parseInt(jawaban.getText())  != gm.getHasil()) {
					JOptionPane.showMessageDialog(null, "Jawaban Salah -5 Poin");
					gm.setScore(0);
				}
				else {
					JOptionPane.showMessageDialog(null, "Jawaban Benar +10 Poin");
					gm.setScore(1);
				}
				score.setText("Score : " + Integer.toString(gm.getScore()));
				soal.setText(gm.pertanyaan());
			}
			jawaban.setText("");
		}
	}

}
