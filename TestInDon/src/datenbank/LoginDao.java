package datenbank;

import benutzer.Benutzer;
import java.sql.*;

public class LoginDao {

	public static Benutzer validate(String benutzername, String passwort) {

		boolean status = false;
		try {
			Connection con = ConnectionProvider.getCon();
			Statement myst = con.createStatement();
			
			ResultSet myRs = myst.executeQuery("select * from Benutzer where Benutzername = '" + benutzername+ "' and Passwort = '" + passwort + "'");

			if (myRs.next()) {
				status = true;
				return status;
			} else {
				return status;
			}
//			PreparedStatement ps = con.prepareStatement("select * from Benutzer ");
//
//			
//			ps.setString(1, bean.getBenutzername());
//			ps.setString(2, bean.getPass());
//
//			ResultSet rs = ps.executeQuery();
//			status = rs.next();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Connection failed");
		}

		return status;

	}
}