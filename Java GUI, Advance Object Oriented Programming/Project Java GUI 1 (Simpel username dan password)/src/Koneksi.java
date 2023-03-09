import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Koneksi {
	
	String url,user,password;
	Connection con;
	Statement st;
	ResultSet rs;
	int hasil;

	public Koneksi() {
		// TODO Auto-generated constructor stub
		url = "jdbc:mysql://localhost/transaksi";
		user = "root";
		password = "";
		try {
			con = DriverManager.getConnection(url, user, password);
			st = con.createStatement();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	public ResultSet getData(String query) throws SQLException{
		rs = st.executeQuery(query);
		return rs;
	}
	
	public int updateData(String query) throws SQLException {
		hasil = st.executeUpdate(query);
		return hasil;
	}
	
	public void closeConnection() throws SQLException {
		st.close();
		con.close();
	}

}
