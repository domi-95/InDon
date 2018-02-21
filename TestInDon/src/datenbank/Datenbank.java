package datenbank;

import java.util.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

import spende.Anlaufstelle;
import spende.Spende;



public class Datenbank {
	
	public static void main(String[] args) throws Exception{
		List<Spende> list = Datenbank.holeSpenden(1);
		System.out.println(list.get(0).getAbholung());
		
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
	

	
	public static ResultSet holAnlaufstelle () {
		Connection con = ConnectionProvider.getCon();
		try {
			Statement myst = con.createStatement();
			ResultSet myRs = myst.executeQuery("SELECT * FROM anlaufstelle ");
			return myRs;
		} catch (SQLException e) {
			System.out.println("FEHLER beim holen der Anlaufstelle");
			e.printStackTrace();
		}
		return null;
	}
	public static Anlaufstelle holAnlaufstelle (int ret_id) {
		Connection con = ConnectionProvider.getCon();
		try {
			Statement myst = con.createStatement();
			ResultSet myRs = myst.executeQuery("SELECT * FROM anlaufstelle WHERE  ret_id = '"+ ret_id +"'");
			myRs.next();
			return new Anlaufstelle(myRs.getInt("id"), myRs.getString("bezeichnung"), myRs.getString("adresse"), myRs.getString("ort"), myRs.getInt("plz"));
		} catch (SQLException e) {
			System.out.println("FEHLER beim holen der Anlaufstelle");
			e.printStackTrace();
		}
		return null;
	}
	

	
	public static List<Anlaufstelle> holeAnlaufstelle (int id_ret) {
		List<Anlaufstelle> result = new LinkedList<Anlaufstelle>();
		Connection con = ConnectionProvider.getCon();
		try {
			Statement myst = con.createStatement();
			ResultSet myRs = myst.executeQuery("SELECT * FROM anlaufstelle WHERE ret_id =  '" + id_ret + "'");
			while (myRs.next()) {
				result.add(new Anlaufstelle(myRs.getInt("id"), myRs.getString("bezeichnung"), myRs.getString("adresse"), myRs.getString("ort"), myRs.getInt("plz")));
			}
			
			return result;
			
		} catch (SQLException e) {
			System.out.println("FEHLER beim holen der Anlaufstelle");
			e.printStackTrace();
		}
		return null;
	}
	
	public static List<Spende> holeSpenden (int anlaufstelle_id) {
		List<Spende> result = new LinkedList<Spende>();
		Connection con = ConnectionProvider.getCon();
		try {
			Statement myst = con.createStatement();
			ResultSet myRs = myst.executeQuery("SELECT * FROM Spende WHERE anlaufstelle_id = 1");
			while (myRs.next()) {
				result.add(new Spende(myRs.getInt("id"), myRs.getString("bezeichnung_spende"), myRs.getString("beschreibung"), myRs.getString("zustand"), myRs.getInt("abholung"), myRs.getInt("lieferung"), myRs.getString("bild"), myRs.getString("mhd"), myRs.getInt("anonym"), myRs.getString("vorname"), myRs.getString("nachname"), myRs.getString("adresse"), myRs.getInt("plz")));
			}
			return result;
		} catch (SQLException e) {
			System.out.println("FEHLER beim holen der Spende");
			e.printStackTrace();
		}
		return null;
	}
		
	
//	public static void speichereSpendeTest (String bezeichnung) {
//		try{
//			 Connection con = ConnectionProvider.getCon();
//		
//		String sql = "INSERT INTO Spende (beschreibung, bezeichnung_spende, zustand, abholung, lieferung, bild, mhd, anonym, vorname, nachname, adresse, plz, ort, anlaufstelle_id, kategorie_id)" + "VALUES ('test','" + bezeichnung + "', 'top', 1, 1, 'test', '123', 1, 'hans', 'peter', 'kack', '123456', 'dir', 1, 2)";
//		Statement st = con.createStatement();
//		st.executeUpdate(sql);
//		}
//		catch (Exception e) {
//			System.out.println("Fehler beim Einfügen der Spende");
//			e.printStackTrace();
//		}
//	}
	
	public static boolean speichereSpende (String beschreibung, String bezeichnung, String zustand, int abholung, int lieferung, String bild_url, String mhd, int anonym, String vorname, String name, String adresse, int plz, String ort, int ret_id, int kat_id) {
		try{
			 Connection con = ConnectionProvider.getCon();
				String sql ="INSERT INTO Spende (beschreibung, bezeichnung_spende, zustand, abholung, lieferung, bild, mhd, anonym, vorname, nachname, adresse, plz, ort, anlaufstelle_id, kategorie_id)" + "VALUES ('"+ beschreibung+"','" + bezeichnung + "', '" + zustand + "', "+abholung+","+lieferung+", '"+bild_url+"', '"+mhd+"',"+anonym+", '" + vorname + "' , '" + name + "', '" + adresse + "', " + plz + ", '" + ort + "',"+ret_id+","+kat_id+")";
				Statement st = con.createStatement();
				st.executeUpdate(sql);
				}
				catch (Exception e) {
					System.out.println("Fehler beim Einfügen der Spende");
					e.printStackTrace();
				}		

		return false;
	}
}
