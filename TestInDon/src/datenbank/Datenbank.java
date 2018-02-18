package datenbank;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Datenbank {
	
	public static void main(String[] args) throws Exception{
		ResultSet myRs =Datenbank.holeKategorien("Mosbach Alte Mälzerei");

		System.out.println(myRs.next());
		
	}
	
	public static ResultSet holeKategorien (String anlaufstelle) {			//haben wir in unserem Fall über ein Resultset implementiert und nicht Objektorientiert da es perfomanter ist
		Connection con = ConnectionProvider.getCon();
		try {
			Statement myst = con.createStatement();
			ResultSet myRs = myst.executeQuery("SELECT k.bezeichnung, k.stark_gefragt, k.verfuegbar, a.bezeichnung FROM kategorie k, anlaufstelle a WHERE k.anlaufstelle_id = a.id AND a.bezeichnung = '" + anlaufstelle + "' ");
			return myRs;
		} catch (SQLException e) {
			System.out.println("FEHLER beim Holen der Kategorien");
			e.printStackTrace();
		}
		return null;
	}

}
