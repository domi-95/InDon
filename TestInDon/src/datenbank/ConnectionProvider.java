package datenbank;

import static datenbank.Provider.*;

import java.sql.*;

public class ConnectionProvider {
	private static Connection con = null;
	String connection_url = CONNECTION_URL;
	String username = USERNAME;
	String password = PASSWORD;
	static {
		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection("jdbc:mysql://server2.febas.net/InDon", "InDonAdmin", "InDon123");
			// con = DriverManager.getConnection("jdbc:mysql://localhost/indon","root","");			//falls Localhost verwendet werden soll
		} catch (Exception e) {
			System.out.println("Connection nicht m�glich zum DB");

		}
	}

	public static Connection getCon() {
		return con;
	}

}