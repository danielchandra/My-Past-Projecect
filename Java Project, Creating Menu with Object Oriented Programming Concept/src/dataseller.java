
public abstract class dataseller {

	protected String username;
	protected String namatoko;
	protected String password;
	protected String jenis;
	protected String dekripsi;
	
	public abstract void tampilan();
	
	public dataseller(String username, String namatoko, String password, String jenis, String dekripsi) {
		super();
		this.username = username;
		this.namatoko = namatoko;
		this.password = password;
		this.jenis = jenis;
		this.dekripsi = dekripsi;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getNamatoko() {
		return namatoko;
	}
	public void setNamatoko(String namatoko) {
		this.namatoko = namatoko;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getJenis() {
		return jenis;
	}
	public void setJenis(String jenis) {
		this.jenis = jenis;
	}
	public String getDekripsi() {
		return dekripsi;
	}
	public void setDekripsi(String dekripsi) {
		this.dekripsi = dekripsi;
	}
	
	
}
