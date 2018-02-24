package datenbank;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.util.*;
import spende.Anlaufstelle;
import spende.Kategorie;
import spende.Spende;


public class Datenbank {
	
	public static void main(String[] args) throws Exception{
//		 Anlaufstelle a = Datenbank.holAnlaufstelle(2);
//		 System.out.println(a.getBezeichnunganlaufstelle());
//		System.out.println( Datenbank.speichereInteresse(3, 2));
//		System.out.println(Datenbank.holeAnlaufstelle(1));
		//System.out.println(Datenbank.holeSpende(4));
		
//		date =  DateFormat.getTimeInstance(DateFormat.MEDIUM);
//		System.out.println(date.getTime());
		
		
		
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
	public static Anlaufstelle holAnlaufstelle (int id) {
		Connection con = ConnectionProvider.getCon();
		try {
			Statement myst = con.createStatement();
			ResultSet myRs = myst.executeQuery("SELECT * FROM anlaufstelle WHERE  id = '"+ id +"'");
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
	
	public static List<Spende> holeSpendenOhneObjekteKatundAnlauf (int anlaufstelle_id) {
		List<Spende> result = new LinkedList<Spende>();
		Connection con = ConnectionProvider.getCon();
		try {
			Statement myst = con.createStatement();
			ResultSet myRs = myst.executeQuery("SELECT * FROM Spende WHERE anlaufstelle_id ='" + anlaufstelle_id + "'");
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
	
	public static List<Spende> holeSpenden (int anlaufstelle_id) {
		List<Spende> result = new LinkedList<Spende>();
		Connection con = ConnectionProvider.getCon();
		try {
			Statement myst = con.createStatement();
			ResultSet myRs = myst.executeQuery("SELECT * from Spende s, anlaufstelle a, kategorie k WHERE s.anlaufstelle_id = a.id AND s.kategorie_id = k.id AND a.id = '"+anlaufstelle_id+"'");
			while (myRs.next()) {
				result.add(new Spende(myRs.getInt("id"), myRs.getString("s.bezeichnung_spende"), myRs.getString("s.beschreibung"), myRs.getString("zustand"), myRs.getInt("s.abholung"), myRs.getInt("s.lieferung"), myRs.getString("s.bild"), myRs.getString("s.mhd"), myRs.getInt("s.anonym"), myRs.getString("s.vorname"), myRs.getString("s.nachname"), myRs.getString("s.adresse"), myRs.getInt("s.plz"), new Anlaufstelle(myRs.getInt("a.id"), myRs.getString("a.bezeichnung"), myRs.getString("a.adresse"), myRs.getString("ort"), myRs.getInt("plz")), new Kategorie(myRs.getInt("id"), myRs.getString("bezeichnung"))));
			}
			return result;
		} catch (SQLException e) {
			System.out.println("FEHLER beim holen der Spende");
			e.printStackTrace();
		}
		return null;
	}
	
	public static Spende holeSpende (int spenden_id) {
		Connection con = ConnectionProvider.getCon();
		try {
			Statement myst = con.createStatement();
			ResultSet myRs = myst.executeQuery("SELECT * from spende s, anlaufstelle a, kategorie k WHERE s.anlaufstelle_id = a.id AND s.kategorie_id = k.id AND s.id = '"+spenden_id+"'");
			myRs.next();
			return new Spende(myRs.getInt("id"), myRs.getString("s.bezeichnung_spende"), myRs.getString("s.beschreibung"), myRs.getString("zustand"), myRs.getInt("s.abholung"), myRs.getInt("s.lieferung"), myRs.getString("s.bild"), myRs.getString("s.mhd"), myRs.getInt("s.anonym"), myRs.getString("s.vorname"), myRs.getString("s.nachname"), myRs.getString("s.adresse"), myRs.getInt("s.plz"), new Anlaufstelle(myRs.getInt("a.id"), myRs.getString("a.bezeichnung"), myRs.getString("a.adresse"), myRs.getString("ort"), myRs.getInt("plz")), new Kategorie(myRs.getInt("id"), myRs.getString("bezeichnung")));
			
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
	
	public static boolean speichereInteresse (int s_id, int b_id, ) {
		try{
			 Connection con = ConnectionProvider.getCon();
				String sql ="INSERT INTO interesse (b_id, s_id)  VALUES ('"+ s_id+"','" + b_id + "')";
				Statement st = con.createStatement();
				st.executeUpdate(sql);
				}
				catch (Exception e) {
					System.out.println("Fehler beim Einfügen einer Interessensbekundung");
					e.printStackTrace();
					return false;
				}		

		return true;
	}
		
	
}
