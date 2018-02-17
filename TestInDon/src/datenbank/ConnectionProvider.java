package datenbank;

import static datenbank.Provider.*;

import java.sql.*;

public class ConnectionProvider {
	private static Connection con = null;
	static {
		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection("jdbc:mysql://server2.febas.net/InDon","InDonAdmin","InDon123");
		} catch (Exception e) {
		}
	}

	public static Connection getCon() {
		return con;
	}

}