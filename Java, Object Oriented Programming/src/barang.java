
public class barang extends produk {

	public barang(String nama, String sKU, int harga, String status) {
		super(nama, sKU, harga, status);
		// TODO Auto-generated constructor stub
	}

	@Override
	public void tampilan() {
		// TODO Auto-generated method stub
		System.out.println("Nama Produk: "+nama);
		System.out.println("SKU: "+SKU);
		System.out.println("Harga produk: "+harga);
		System.out.println("Status produk: "+status);
		System.out.println("----------------");
	}

}
