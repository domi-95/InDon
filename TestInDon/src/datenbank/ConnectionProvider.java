package datenbank;

import static datenbank.Provider.*;

import java.sql.*;

public class ConnectionProvider {
	private static Connection con = null;
	static {
		try {
<<<<<<< HEAD
			Class.forName(DRIVER);
			con = DriverManager.getConnection("jdbc:mysql://db725808780.db.1and1.com:3306","dbo725808780","InDon123");
		} catch (Exception e) {
			System.out.println("Connection nicht m�glich zum DB");
=======
			Class.forName(DRIVER);
		//	con = DriverManager.getConnection("jdbc:mysql://server2.febas.net/InDon","InDonAdmin","InDon123");
		//	con = DriverManager.getConnection("jdbc:mysql://db725808780.db.1and1.com/db725808780","dbo725808780","InDon123");
			con = DriverManager.getConnection("jdbc:mysql://db725808780.db.1and1.com","dbo725808780","InDon123");
		} catch (Exception e) {
			System.out.println("Connection nicht m�glich zur DB");
>>>>>>> branch 'NewMaster' of https://github.com/domi-95/InDon.git
		}
	}

	public static Connection getCon() {
		return con;
	}

}