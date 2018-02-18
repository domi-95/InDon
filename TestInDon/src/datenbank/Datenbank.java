package datenbank;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Datenbank {
	
	public static void main(String[] args) throws Exception{
		ResultSet myRs =Datenbank.holeKategorien(1);

		System.out.println(myRs.next());
		
	}
	
	public static ResultSet holeKategorien (int id_anlaufstelle) {			
		Connection con = ConnectionProvider.getCon();
		try {
			Statement myst = con.createStatement();
			ResultSet myRs = myst.executeQuery("SELECT k.bezeichnung, ak.stark_gefragt FROM kategorie k, anlaufstelle a, anlaufstelle_kategorie ak WHERE k.id = kategorie_id AND a.id = anlaufstelle_id AND a.id = '" + id_anlaufstelle + "' ");
			return myRs;
		} catch (SQLException e) {
			System.out.println("FEHLER beim Holen der Kategorien");
			e.printStackTrace();
		}
		return null;
	}
	
	public static ResultSet holeAnlaufstelle () {			//haben wir in unserem Fall über ein Resultset implementiert und nicht Objektorientiert da es perfomanter ist
		Connection con = ConnectionProvider.getCon();
		try {
			Statement myst = con.createStatement();
			ResultSet myRs = myst.executeQuery("SELECT * FROM anlaufstelle");
			return myRs;
		} catch (SQLException e) {
			System.out.println("FEHLER beim Holen der Kategorien");
			e.printStackTrace();
		}
		return null;
	}

}
