package datenbank;

import benutzer.*;

import java.sql.*;

public class LoginDao {

	public static void main(String[] args) {
		Benutzer b1 = LoginDao.validate("kevin", "123");
		Mitarbeiter ma = (Mitarbeiter) b1;
		System.out.println(ma);

		Benutzer b2 = LoginDao.validate("domi", "123");
		Beduerftiger bd = (Beduerftiger) b2;

	}

	public static Benutzer validate(String benutzername, String passwort) {

		String art;
		int id;

		boolean status = false;
		try {
			Connection con = ConnectionProvider.getCon();
			Statement myst = con.createStatement();

			// ResultSet myRs = myst.executeQuery("select * from Benutzer where Benutzername
			// = '" + benutzername+ "' and Passwort = '" + passwort + "'");
			ResultSet myRs = myst.executeQuery(
					"SELECT b.id, b.benutzername, b.passwort, b.name, b.vorname, a.id, a.bezeichnung, r.bezeichnung FROM Benutzer b, art a, rettungsorganisation r WHERE b.ret_id = r.id AND b.art_id = a.id AND Benutzername = '"
							+ benutzername + "' and Passwort = '" + passwort + "'");

			if (myRs.next())
				return LoginDao.createBenutzer(myRs);

			else {
				return null;
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Connection failed");
		}
		return null;
	}

	public static Benutzer createBenutzer(ResultSet myRs) {

		try {
			if (myRs.getInt("a.id") == 1) {
				return new Mitarbeiter(myRs.getInt("id"), myRs.getString("benutzername"), myRs.getString("passwort"),
						myRs.getString("r.bezeichnung"), myRs.getString("name"), myRs.getString("vorname"));

			}

			if (myRs.getInt("a.id") == 2) {
				return new Beduerftiger(myRs.getInt("id"), myRs.getString("benutzername"), myRs.getString("passwort"),
						myRs.getString("name"), myRs.getString("vorname"));
			}
		} catch (Exception e) {
			System.out.println("Benutzer ist keiner Art-Nutzer zugeordnet");
			e.printStackTrace();
		}
		return null;
	}
}