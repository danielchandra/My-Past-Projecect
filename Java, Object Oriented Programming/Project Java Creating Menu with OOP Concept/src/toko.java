
public class toko extends dataseller {

	public toko(String username, String namatoko, String password, String jenis, String dekripsi) {
		super(username, namatoko, password, jenis, dekripsi);
		// TODO Auto-generated constructor stub
	}

	@Override
	public void tampilan() {
		// TODO Auto-generated method stub
		System.out.println("Nama toko: "+namatoko);
		System.out.println("Jenis toko: "+jenis);
		System.out.println("Deskripsi toko: "+dekripsi);
		System.out.println("Total Produk Aktif: ");

	}

}
