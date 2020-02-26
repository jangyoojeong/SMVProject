package movieDBConn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MovieDBConn {
	//紗失
	private Connection con;
	//持失切
	public MovieDBConn() throws ClassNotFoundException, SQLException {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr","hr");
	}
	//getter
	public Connection getConnection() {
		return con;
	}
	
}
