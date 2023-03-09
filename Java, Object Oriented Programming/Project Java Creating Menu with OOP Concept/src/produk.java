
public abstract class produk {

	protected String nama;
	protected String SKU;
	protected int harga;
	protected String status;
	
	public abstract void tampilan();
	
	public String getNama() {
		return nama;
	}
	public void setNama(String nama) {
		this.nama = nama;
	}
	public String getSKU() {
		return SKU;
	}
	public void setSKU(String sKU) {
		SKU = sKU;
	}
	public int getHarga() {
		return harga;
	}
	public void setHarga(int harga) {
		this.harga = harga;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public produk(String nama, String sKU, int harga, String status) {
		super();
		this.nama = nama;
		SKU = sKU;
		this.harga = harga;
		this.status = status;
	}
	
	

}
