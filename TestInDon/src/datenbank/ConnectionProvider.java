package datenbank;

import static datenbank.Provider.*;

import java.sql.*;

public class ConnectionProvider {
	private static Connection con = null;
	static {
		try {
			Class.forName(DRIVER);
<<<<<<< HEAD
		//	con = DriverManager.getConnection("jdbc:mysql://server2.febas.net/InDon","InDonAdmin","InDon123");
			con = DriverManager.getConnection("jdbc:mysql://db725808780.db.1and1.com/db725808780","dbo725808780","InDon123");
			//con = DriverManager.getConnection(CONNECTION_URL, USERNAME, PASSWORD);
=======
			con = DriverManager.getConnection("jdbc:mysql://db725808780.db.1and1.com","dbo725808780","InDon123");
>>>>>>> branch 'NewMaster' of https://github.com/domi-95/InDon.git
		} catch (Exception e) {
<<<<<<< HEAD
			System.out.println("Connection nicht möglich zur DB");
=======
			System.out.println("Connection nicht mï¿½glich zum DB");
>>>>>>> branch 'NewMaster' of https://github.com/domi-95/InDon.git
		}
	}

	public static Connection getCon() {
		return con;
	}

}