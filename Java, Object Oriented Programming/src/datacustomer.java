
public abstract class datacustomer {
	
	protected String nama;
	protected String gender;
	protected String password;
	
	public String getNama() {
		return nama;
	}
	public void setNama(String nama) {
		this.nama = nama;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPassword() {
		return password;
	}
	public datacustomer(String nama, String gender, String password) {
		super();
		this.nama = nama;
		this.gender = gender;
		this.password = password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	

}
