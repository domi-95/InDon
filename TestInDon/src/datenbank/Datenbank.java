package datenbank;

import java.io.InputStream;
import java.sql.*;
import java.text.DateFormat;
import java.util.*;

import benutzer.*;
import spende.*;


public class Datenbank {
	
	public static void main(String[] args) throws Exception{
//		 Anlaufstelle a = Datenbank.holAnlaufstelle(2);
//		 System.out.println(a.getBezeichnunganlaufstelle());
//		System.out.println( Datenbank.speichereInteresse(3, 2));
//		System.out.println(Datenbank.holeAnlaufstelle(1));
		//System.out.println(Datenbank.holeSpende(4));
	
		//Beduerftiger bd = (Beduerftiger)Datenbank.validate("domi", "123");
		//System.out.println(bd.getAnlaufstelle().getId());
		//System.out.println(Datenbank.holeInteresse(4));
		//Datenbank.setSpendeNV(3);
		System.out.println(Datenbank.holeSpende(4));
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
	
//	public static List<Spende> holeSpendenOhneObjekteKatundAnlauf (int anlaufstelle_id) {
//		List<Spende> result = new LinkedList<Spende>();
//		Connection con = ConnectionProvider.getCon();
//		try {
//			Statement myst = con.createStatement();
//			ResultSet myRs = myst.executeQuery("SELECT * FROM Spende WHERE anlaufstelle_id ='" + anlaufstelle_id + "'");
//			while (myRs.next()) {
//				result.add(new Spende(myRs.getInt("id"), myRs.getString("bezeichnung_spende"), myRs.getString("beschreibung"), myRs.getString("zustand"), myRs.getInt("abholung"), myRs.getInt("lieferung"), myRs.getString("bild"), myRs.getString("mhd"), myRs.getInt("anonym"), myRs.getString("vorname"), myRs.getString("nachname"), myRs.getString("adresse"), myRs.getInt("plz")));
//			}
//			return result;
//		} catch (SQLException e) {
//			System.out.println("FEHLER beim holen der Spende");
//			e.printStackTrace();
//		}
//		return null;
//	}
	
	public static List<Spende> holeSpenden (int anlaufstelle_id) {
		List<Spende> result = new LinkedList<Spende>();
		Connection con = ConnectionProvider.getCon();
		try {
			Statement myst = con.createStatement();
			ResultSet myRs = myst.executeQuery("SELECT * from spende s, anlaufstelle a, kategorie k WHERE s.anlaufstelle_id = a.id AND s.kategorie_id = k.id AND a.id = '"+anlaufstelle_id+"' AND s.verfuegbar = '0'");
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
			ResultSet myRs = myst.executeQuery("SELECT * from spende s, anlaufstelle a, kategorie k WHERE s.anlaufstelle_id = a.id AND s.kategorie_id = k.id AND s.id = '"+spenden_id+"'AND s.verfuegbar = '0'");
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
//			System.out.println("Fehler beim Einf�gen der Spende");
//			e.printStackTrace();
//		}
//	}
	
	public static boolean speichereSpende (String beschreibung, String bezeichnung, String zustand, int abholung, int lieferung, Blob in, String mhd, int anonym, String vorname, String name, String adresse, int plz, String ort, int ret_id, int kat_id) {
		try{
			 Connection con = ConnectionProvider.getCon();
				String sql ="INSERT INTO spende (beschreibung, bezeichnung_spende, zustand, abholung, lieferung, bild, mhd, anonym, vorname, nachname, adresse, plz, ort, anlaufstelle_id, kategorie_id)" + "VALUES ('"+ beschreibung+"','" + bezeichnung + "', '" + zustand + "', "+abholung+","+lieferung+", '"+in+"'+, '"+mhd+"',"+anonym+", '" + vorname + "' , '" + name + "', '" + adresse + "', " + plz + ", '" + ort + "',"+ret_id+","+kat_id+")";
				Statement st = con.createStatement();
				//PreparedStatement st = con.prepareStatement(sql);
				//st.setBlob(1, in);
				st.executeUpdate(sql);
				}
				catch (Exception e) {
					System.out.println("Fehler beim Einf�gen der Spende");
					e.printStackTrace();
				}		

		return false;
	}
	
	public static boolean speichereInteresse (int s_id, int b_id, String timestamp ) {
		try{
			 Connection con = ConnectionProvider.getCon();
				String sql ="INSERT INTO interesse (b_id, s_id, timestamp)  VALUES ('"+ s_id+"','" + b_id + "', '"+timestamp+"')";
				Statement st = con.createStatement();
				st.executeUpdate(sql);
				}
				catch (Exception e) {
					System.out.println("Fehler beim Einf�gen einer Interessensbekundung");
					e.printStackTrace();
					return false;
				}		

		return true;
	}
	
	public static Benutzer validate(String benutzername, String passwort) {

		try {
			//ResultSet beduerftiger = null;
			Connection con = ConnectionProvider.getCon();
			//ResultSet beduerftiger = null;
			Statement myst = con.createStatement();
			ResultSet mitarbeiter = myst.executeQuery("SELECT * FROM mitarbeiter m, rettungsorganisation r WHERE m.ret_id = r.id AND m.benutzername = '"+benutzername+"' AND m.passwort = '"+passwort+"'");
//			ResultSet myRs = myst.executeQuery(
//					"SELECT b.id, b.benutzername, b.passwort, b.name, b.vorname, a.id, a.bezeichnung, r.bezeichnung, r.id FROM Benutzer b, art a, rettungsorganisation r WHERE b.ret_id = r.id AND b.art_id = a.id AND b.benutzername = '"+benutzername+"' AND b.passwort = '"+passwort+"' '"
//							+s benutzername + "' and Passwort = '" + passwort + "'");

			if (mitarbeiter.next()) {
				return new Mitarbeiter(mitarbeiter.getInt("m.id"), mitarbeiter.getString("m.benutzername"), mitarbeiter.getString("m.passwort"), mitarbeiter.getString("r.bezeichnung"), mitarbeiter.getInt("r.id"), mitarbeiter.getString("m.name"), mitarbeiter.getString("m.vorname"));
				
			}
			
			myst = con.createStatement();
			ResultSet beduerftiger = myst.executeQuery("SELECT * FROM beduerftiger b, anlaufstelle a WHERE b.anlauf_id = a.id AND b.benutzername = '"+benutzername+"' AND b.passwort = '"+passwort+"'");
			
			if (beduerftiger.next()) {
				Anlaufstelle a = new Anlaufstelle(beduerftiger.getInt("a.id"), beduerftiger.getString("a.bezeichnung"), beduerftiger.getString("a.adresse"), beduerftiger.getString("a.ort"), beduerftiger.getInt("a.plz"));
				return new Beduerftiger(beduerftiger.getInt("b.id"), beduerftiger.getString("b.benutzername"), beduerftiger.getString("passwort"), beduerftiger.getString("b.name"), beduerftiger.getString("b.vorname"), a, beduerftiger.getInt("personenHaushalt"));
			}
				

			else {
				return null;
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Validation failed");
		}
		return null;
	}
	
	public static List<Interesse> holeInteresse (int spenden_id) {
		List<Interesse>result = new LinkedList<Interesse>();
		Connection con = ConnectionProvider.getCon();
		try {
			Statement myst = con.createStatement();
			ResultSet myRs = myst.executeQuery("SELECT * from interesse i, beduerftiger b, spende s WHERE i.b_id = b.id AND i.s_id = s.id AND s.id = '"+spenden_id+"'");
			while (myRs.next()) {
				result.add(new Interesse(Datenbank.holeSpende(spenden_id), new Beduerftiger(myRs.getInt("b.id"), myRs.getString("b.benutzername"), myRs.getString("b.passwort"), myRs.getString("b.name"), myRs.getString("b.vorname"), myRs.getInt("b.personenHaushalt")), myRs.getString("i.timestamp")));
			}
			return result;
		} catch (SQLException e) {
			System.out.println("FEHLER beim holen der Spende");
			e.printStackTrace();
		}
		return null;
		
	}
	
	public static boolean setSpendeNV (int s_id) {
		try{
			 Connection con = ConnectionProvider.getCon();
				String sql ="UPDATE spende SET verfuegbar = '1' WHERE id = '"+s_id+"'";
				Statement st = con.createStatement();
				st.execute(sql);
				
				}
				catch (Exception e) {
					System.out.println("Fehler beim Einf�gen der Spende");
					e.printStackTrace();
				}	
		return false;
	}
	
	public static boolean speichereZuordnung (int s_id, int bd_id ) {
		try{
			 Connection con = ConnectionProvider.getCon();
			 String sql ="UPDATE spende SET beduerftiger_id = '"+bd_id+"' WHERE id = '"+s_id+"'";
			Statement st = con.createStatement();
				st.executeUpdate(sql);
				}
				catch (Exception e) {
					System.out.println("Fehler beim Einfuegen der Zuordnung");
					e.printStackTrace();
					return false;
				}		

		return true;
	}
		
	
}
