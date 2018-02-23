package datenbank;

import static datenbank.Provider.*;

import java.sql.*;

public class ConnectionProvider {
	private static Connection con = null;
	static {
		try {
			Class.forName(DRIVER);
		//	con = DriverManager.getConnection("jdbc:mysql://server2.febas.net/InDon","InDonAdmin","InDon123");
			con = DriverManager.getConnection("jdbc:mysql://db725808780.db.1and1.com/db725808780","dbo725808780","InDon123");
			//con = DriverManager.getConnection(CONNECTION_URL, USERNAME, PASSWORD);
		} catch (Exception e) {
			System.out.println("Connection nicht möglich zur DB");
		}
	}

	public static Connection getCon() {
		return con;
	}

}