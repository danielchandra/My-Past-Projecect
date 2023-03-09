import java.util.Random;
import java.util.Scanner;
import java.util.Vector;

public class main {
	
	//temp, untuk hitung jumlah produk yang aktif
	protected int count=0;
	
	Scanner input = new Scanner(System.in);
	Vector<datacustomer> vcustomer = new Vector<>();
	Vector<dataseller> vseller = new Vector<>();
	Vector<produk> vproduk = new Vector<>();
	Random rn = new Random();
	
	
//	void login() {
//		String username;
//		String password;
//		System.out.print("Username: ");
//		username = input.nextLine();
//		System.out.println("Password: ");
//		password = input.nextLine();
//	}
	
	
	//tampilan khusus seller
	void menuseller() {
		int choose;
		do {
		System.out.println("Halaman Seller");
		System.out.println("==============");
		System.out.println("1. Add");
		System.out.println("2. View");
		System.out.println("3. Edit");
		System.out.println("4. Exit");
		System.out.print(">> ");
		choose=input.nextInt();
		switch (choose) {
		case 1:
			add();
			break;

		case 2:
			view();
			break;
			
		case 3:
			edit();
			break;
		}
		}while(choose<4);
	}
	
	void add() {
		//SKU 10 angka random
		String SKU="";
		for (int i = 0; i < 10; i++) { 
		int angka = rn.nextInt(10);
		SKU += angka;
		}
		
		String nama;
		int harga;
		String status;
		System.out.println("Nama produk: ");
		nama=input.nextLine();
		System.out.println("Harga produk:");
		harga=input.nextInt();
		do {
		System.out.println("Status produk[Aktif|Tidak]");
		status=input.nextLine();
		}while(!status.equalsIgnoreCase("Aktif") && !status.equalsIgnoreCase("Tidak"));
		
		//jika produk aktif, count + 1
		if(status.equalsIgnoreCase("Aktif")) {
			count=count+1;
		}
		
		vproduk.add(new barang(nama, SKU, harga, status));
	}
	
	
	void view() {
		for(int i=0;i<vproduk.size();i++) {
			System.out.println("Produk ke-"+i+1);
			vproduk.get(i).tampilan();
			System.out.println("===============");
		}
		
		
	}
	
	void edit() {
		String cek = null;
		String nama;
		int harga;
		String status;
		
		System.out.print("Masukkan SKU Produk: ");
		for(int i=0;i<vproduk.size();i++) {
			if(cek.equals(vproduk.get(i).SKU)) {
				System.out.print("Masukan nama produk baru: ");
				nama=input.nextLine();
//				vproduk.set(i,nama);
				System.out.print("Masukkan harga produk baru:");
				harga = input.nextInt();
				System.out.print("Masukkan status produk");
				status=input.nextLine();
			}
		}
		
	}
	
	//tampilan khusus pembeli
	void menucustomer() {
		String cektoko;
		for(int i=0;i<vseller.size();i++) {
			vseller.get(i).tampilan();
		}
		
		System.out.println("Masukkan nama toko yang ingin dilihat: ");
		cektoko=input.nextLine();
		
		for(int i=0;i<vseller.size();i++) {
			if(cektoko.equalsIgnoreCase(vseller.get(i).namatoko)){
				for(int j=0;j<vproduk.size();j++) {
					System.out.println("Produk ke-"+j+1);
					vproduk.get(j).tampilan();
					System.out.println("===============");
				}
			}
		}
	}

	public main() {
		// TODO Auto-generated constructor stub
		String username;
		String password;
		
		String nama;
		String gender;
		
		String namatoko;
		String jenis;
		String dekripsi;
		
		int pilihan;
		System.out.println("INDO MARKET PLACE");
		System.out.println("======================");
		System.out.println("1. Login");
		System.out.println("2. Register");
		System.out.print(">> ");
		pilihan=input.nextInt();
		
		//Proses login
		if(pilihan==1) {
			if(vcustomer.isEmpty() && vseller.isEmpty()) {
				System.out.println("Data customer dan data seller masih empty");
			}
			System.out.print("Username: ");
			username = input.nextLine();
			System.out.println("Password: ");
			password = input.nextLine();
			
			//Seller
			for(int i=0;i<vseller.size();i++) {
				if(username.equals(vseller.get(i).username) && username.equals(vseller.get(i).password)) {
				menuseller();
				}
			}
			
			//Customer
			for(int i=0;i<vcustomer.size();i++) {
				if(username.equals(vcustomer.get(i).nama) && username.equals(vseller.get(i).password)) {
					menucustomer();
				}
			}
		}
		
		//Register
		if(pilihan==2) {
			int regis;
			System.out.println("REGISTER");
			System.out.println("===========");
			System.out.println("1. Customer");
			System.out.println("2. Seller");
			regis = input.nextInt();
			
			//Register Costumer
			if(regis==1) {
				System.out.println("Nama: ");
				nama = input.nextLine();
				do {
				System.out.println("Gender[Male|Female]: ");
				gender = input.nextLine();
				}while(!gender.equals("Male") && !gender.equals("Female"));
				
				System.out.println("Password: ");
				password=input.nextLine();
				
				//Masukkan inputan ke data customer
				vcustomer.add(new pembeli(nama, gender, password));

			}
			
			//Register seller
			if(regis==2) {
				System.out.println("Username: ");
				username = input.nextLine();
				System.out.println("Nama Toko: ");
				namatoko = input.nextLine();
				System.out.println("Password: ");
				password = input.nextLine();
				do {
				System.out.println("Jenis[Elektronik||Fashion||Makanan & Minuman]: ");
				jenis = input.nextLine();
				}while(!jenis.equalsIgnoreCase("Elektronik") && !jenis.equalsIgnoreCase("Fashion") && !jenis.equalsIgnoreCase("Makanan dan Minuman"));
				System.out.println("Deskripsi toko: ");
				dekripsi = input.nextLine();
				
				
				//Masukkan inputan ke data seller
				vseller.add(new toko(username, namatoko, password, jenis, dekripsi));
			}
			
		}
	}
	
	public static void main(String[] args) {
		new main();
	}

}
