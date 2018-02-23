package datenbank;

import static datenbank.Provider.*;

import java.sql.*;

public class ConnectionProvider {
	private static Connection con = null;
	static {
		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection("jdbc:mysql://db725808780.db.1and1.com","dbo725808780","InDon123");
		} catch (Exception e) {
			System.out.println("Connection nicht m�glich zum DB");
		}
	}

	public static Connection getCon() {
		return con;
	}

}