package datenbank;

import java.sql.*;
import java.util.*;
import benutzer.*;
import spende.*;

public class Datenbank {
	
	public static void main(String[] args) {
		System.out.println(Datenbank.holeSpenden(2));
	}
	


	public static List<Kategorie> holeKategorien(Anlaufstelle anlaufstelle) {
		List<Kategorie> result = new LinkedList<Kategorie>();
		Connection con = ConnectionProvider.getCon();
		try {
			Statement myst = con.createStatement();
			ResultSet myRs = myst.executeQuery(
					"SELECT * FROM kategorie k, anlaufstelle a, anlaufstelle_kategorie ak WHERE k.id = kategorie_id AND a.id = anlaufstelle_id AND a.id = '"
							+ anlaufstelle.getId() + "' ");
			while (myRs.next()) {
				result.add(new Kategorie(myRs.getInt("k.id"), myRs.getString("k.bezeichnung"), anlaufstelle,
						myRs.getBoolean("ak.stark_gefragt"), myRs.getBoolean("ak.verfuegbar")));
			}

			return result;
		} catch (SQLException e) {
			System.out.println("FEHLER beim Holen der Kategorien");
			e.printStackTrace();
		}
		return null;
	}

	public static List<Anlaufstelle> holeAnlaufstelle() {
		List<Anlaufstelle> result = new LinkedList<Anlaufstelle>();
		Connection con = ConnectionProvider.getCon();
		try {
			Statement myst = con.createStatement();
			ResultSet myRs = myst.executeQuery("SELECT * FROM anlaufstelle");
			while (myRs.next()) {
				result.add(new Anlaufstelle(myRs.getInt("id"), myRs.getString("bezeichnung"), myRs.getString("adresse"),
						myRs.getString("ort"), myRs.getInt("plz")));
			}

			return result;

		} catch (SQLException e) {
			System.out.println("FEHLER beim holen der Anlaufstelle");
			e.printStackTrace();
		}
		return null;
	}

	public static Anlaufstelle holAnlaufstelle(int id) {
		Connection con = ConnectionProvider.getCon();
		try {
			Statement myst = con.createStatement();
			ResultSet myRs = myst.executeQuery("SELECT * FROM anlaufstelle WHERE  id = '" + id + "'");
			myRs.next();
			return new Anlaufstelle(myRs.getInt("id"), myRs.getString("bezeichnung"), myRs.getString("adresse"),
					myRs.getString("ort"), myRs.getInt("plz"));
		} catch (SQLException e) {
			System.out.println("FEHLER beim holen der Anlaufstelle");
			e.printStackTrace();
		}
		return null;
	}

	public static List<Anlaufstelle> holeAnlaufstelle(int id_ret) {
		List<Anlaufstelle> result = new LinkedList<Anlaufstelle>();
		Connection con = ConnectionProvider.getCon();
		try {
			Statement myst = con.createStatement();
			ResultSet myRs = myst.executeQuery("SELECT * FROM anlaufstelle WHERE ret_id =  '" + id_ret + "'");
			while (myRs.next()) {
				result.add(new Anlaufstelle(myRs.getInt("id"), myRs.getString("bezeichnung"), myRs.getString("adresse"),
						myRs.getString("ort"), myRs.getInt("plz")));
			}

			return result;

		} catch (SQLException e) {
			System.out.println("FEHLER beim holen der Anlaufstelle");
			e.printStackTrace();
		}
		return null;
	}

	public static List<Spende> holeSpenden(int anlaufstelle_id) {
		List<Spende> result = new LinkedList<Spende>();
		Connection con = ConnectionProvider.getCon();
		try {
			Statement myst = con.createStatement();
			ResultSet myRs = myst.executeQuery(
					"SELECT * from spende s, anlaufstelle a, kategorie k WHERE s.anlaufstelle_id = a.id AND s.kategorie_id = k.id AND a.id = '"
							+ anlaufstelle_id + "' AND s.verfuegbar = '0'");
			while (myRs.next()) {
				result.add(new Spende(
						myRs.getInt("s.id"), 
						myRs.getString("s.bezeichnung_spende"),
						myRs.getString("s.beschreibung"),
						myRs.getString("s.zustand"),
						myRs.getInt("s.abholung"),
						myRs.getInt("s.lieferung"), 
						myRs.getBytes("s.bild"),
						myRs.getString("s.mhd"),
						myRs.getInt("s.anonym"), 
						myRs.getString("s.vorname"), 
						myRs.getString("s.nachname"),
						myRs.getString("s.adresse"), 
						myRs.getInt("s.plz"),
						myRs.getString("s.ort"),
						new Anlaufstelle(myRs.getInt("a.id"), 
										 myRs.getString("a.bezeichnung"),
										 myRs.getString("a.adresse"), 
										 myRs.getString("s.ort"), 
										 myRs.getInt("a.plz")),
						new Kategorie(myRs.getInt("k.id"), 
									  myRs.getString("k.bezeichnung")),
						myRs.getInt("s.menge"),
						myRs.getInt("s.restmenge"),
						myRs.getString("s.email"),
						myRs.getInt("s.telefon")));
			}
			return result;
		} catch (SQLException e) {
			System.out.println("FEHLER beim holen der Spende");
			e.printStackTrace();
		}
		return null;
	}
	
	public static List<Spende> holeSpendenMInteressen(int anlaufstelle_id) {
		List<Spende> result = new LinkedList<Spende>();
		Connection con = ConnectionProvider.getCon();
		try {
			Statement myst = con.createStatement();
//			ResultSet myRs = myst.executeQuery(
//					"SELECT DISTINCT * from spende s, anlaufstelle a, kategorie k, interesse i WHERE s.anlaufstelle_id = a.id AND s.kategorie_id = k.id AND a.id = '"
//							+ anlaufstelle_id + "' AND s.verfuegbar = '0' AND i.s_id = s.id");
			
			
			ResultSet myRs = myst.executeQuery("SELECT s.id, s.bezeichnung_spende, s.beschreibung, s.zustand, s.abholung, s.lieferung, s.bild, s.mhd, s.anonym, s.vorname, s.nachname, s.adresse, s.plz, s.ort, a.id, a.bezeichnung, a.adresse, s.ort, a.plz, k.id, k.bezeichnung, s.menge, s.restmenge, s.email, s.telefon  FROM spende s, anlaufstelle a, kategorie k, interesse i WHERE s.anlaufstelle_id = a.id AND s.kategorie_id = k.id AND a.id = '" + anlaufstelle_id + "' AND s.verfuegbar = '0' AND i.s_id = s.id GROUP BY  s.id, s.bezeichnung_spende, s.beschreibung, s.zustand, s.abholung, s.lieferung, s.mhd, s.vorname, s.nachname, s.adresse, s.plz, s.ort, a.id, a.bezeichnung, a.adresse, s.ort, a.plz, k.id, k.bezeichnung, s.menge, s.restmenge, s.email, s.telefon");
			// ResultSet myRs = myst.executeQuery("SELECT s.id, s.bezeichnung_spende, s.beschreibung, s.zustand, s.abholung, s.lieferung, s.mhd, s.vorname, s.nachname, s.adresse, s.plz, s.ort, a.id, a.bezeichnung, a.adresse, s.ort, a.plz, k.id, k.bezeichnung, s.menge, s.restmenge, s.email, s.telefon FROM spende s, anlaufstelle a, kategorie k, interesse i WHERE s.anlaufstelle_id = a.id AND s.kategorie_id = k.id AND a.id = 1 AND s.verfuegbar = '0' AND i.s_id = s.id GROUP BY s.id, s.bezeichnung_spende, s.beschreibung, s.zustand, s.abholung, s.lieferung, s.mhd, s.vorname, s.nachname, s.adresse, s.plz, s.ort, a.id, a.bezeichnung, a.adresse, s.ort, a.plz, k.id, k.bezeichnung, s.menge, s.restmenge, s.email, s.telefon");
			
			
			while (myRs.next()) {
				result.add(new Spende(
						myRs.getInt("s.id"), 
						myRs.getString("s.bezeichnung_spende"),
						myRs.getString("s.beschreibung"),
						myRs.getString("s.zustand"),
						myRs.getInt("s.abholung"),
						myRs.getInt("s.lieferung"), 
						myRs.getBytes("s.bild"),
						myRs.getString("s.mhd"),
						myRs.getInt("s.anonym"), 
						myRs.getString("s.vorname"), 
						myRs.getString("s.nachname"),
						myRs.getString("s.adresse"), 
						myRs.getInt("s.plz"),
						myRs.getString("s.ort"),
						new Anlaufstelle(myRs.getInt("a.id"), 
										 myRs.getString("a.bezeichnung"),
										 myRs.getString("a.adresse"), 
										 myRs.getString("s.ort"), 
										 myRs.getInt("a.plz")),
						new Kategorie(myRs.getInt("k.id"), 
									  myRs.getString("k.bezeichnung")),
						myRs.getInt("s.menge"),
						myRs.getInt("s.restmenge"),
						myRs.getString("s.email"),
						myRs.getInt("s.telefon")));
			}
			return result;
		} catch (SQLException e) {
			System.out.println("FEHLER beim holen der Spende");
			e.printStackTrace();
		}
		return null;
	}

	public static Spende holeSpende(int spenden_id) {
		Connection con = ConnectionProvider.getCon();
		try {
			Statement myst = con.createStatement();
			ResultSet myRs = myst.executeQuery(
					"SELECT * from spende s, anlaufstelle a, kategorie k WHERE s.anlaufstelle_id = a.id AND s.kategorie_id = k.id AND s.id = '"
							+ spenden_id + "'AND s.verfuegbar = '0'");
			myRs.next();
			return new Spende(
					myRs.getInt("id"), 
					myRs.getString("s.bezeichnung_spende"),
					myRs.getString("s.beschreibung"),
					myRs.getString("s.zustand"),
					myRs.getInt("s.abholung"),
					myRs.getInt("s.lieferung"), 
					myRs.getBytes("bild"), myRs.getString("s.mhd"),
					myRs.getInt("s.anonym"), 
					myRs.getString("s.vorname"), 
					myRs.getString("s.nachname"),
					myRs.getString("s.adresse"), 
					myRs.getInt("s.plz"),
					myRs.getString("s.ort"),
					new Anlaufstelle(myRs.getInt("a.id"), 
									 myRs.getString("a.bezeichnung"),
									 myRs.getString("a.adresse"), 
									 myRs.getString("s.ort"), 
									 myRs.getInt("plz")),
					new Kategorie(myRs.getInt("id"), 
								  myRs.getString("bezeichnung")),
					myRs.getInt("s.menge"),
					myRs.getInt("s.restmenge"),
					myRs.getString("s.email"),
					myRs.getInt("s.telefon"));

		} catch (SQLException e) {
			System.out.println("FEHLER beim holen der Spende");
			e.printStackTrace();
		}
		return null;
	}

	public static boolean speichereSpende(String beschreibung, String bezeichnung, String zustand, int abholung,
			int lieferung, Blob in, String mhd, int anonym, String vorname, String name, String adresse, int plz,
			String ort, int ret_id, int kat_id) {
		try {
			Connection con = ConnectionProvider.getCon();
			String sql = "INSERT INTO spende (beschreibung, bezeichnung_spende, zustand, abholung, lieferung, bild, mhd, anonym, vorname, nachname, adresse, plz, ort, anlaufstelle_id, kategorie_id)"
					+ "VALUES ('" + beschreibung + "','" + bezeichnung + "', '" + zustand + "', " + abholung + ","
					+ lieferung + ", '" + in + "'+, '" + mhd + "'," + anonym + ", '" + vorname + "' , '" + name + "', '"
					+ adresse + "', " + plz + ", '" + ort + "'," + ret_id + "," + kat_id + ")";
			Statement st = con.createStatement();
			// PreparedStatement st = con.prepareStatement(sql);
			// st.setBlob(1, in);
			st.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println("Fehler beim Einf�gen der Spende");
			e.printStackTrace();
		}
		
		return false;
	}

	public static boolean speichereInteresse(int s_id, int b_id, int prio, String timestamp) {
		try {
			Connection con = ConnectionProvider.getCon();
			String sql = "INSERT INTO interesse (b_id, s_id, prio, timestamp)  VALUES ('" + s_id + "','" + b_id + "', '"
					+ prio + "', '" + timestamp + "')";
			Statement st = con.createStatement();
			st.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println("Fehler beim Einfuegen einer Interessensbekundung");
			e.printStackTrace();
			return false;
		}

		return true;
	}

	public static Benutzer validate(String benutzername, String passwort) {

		try {

			Connection con = ConnectionProvider.getCon();

			Statement myst = con.createStatement();
			ResultSet mitarbeiter = myst.executeQuery(
					"SELECT * FROM mitarbeiter m, rettungsorganisation r WHERE m.ret_id = r.id AND m.benutzername = '"
							+ benutzername + "' AND m.passwort = '" + passwort + "'");

			if (mitarbeiter.next()) {
				return new Mitarbeiter(mitarbeiter.getInt("m.id"), mitarbeiter.getString("m.benutzername"),
						mitarbeiter.getString("m.passwort"), mitarbeiter.getString("r.bezeichnung"),
						mitarbeiter.getInt("r.id"), mitarbeiter.getString("m.name"),
						mitarbeiter.getString("m.vorname"));

			}

			myst = con.createStatement();
			ResultSet beduerftiger = myst.executeQuery(
					"SELECT * FROM beduerftiger b, anlaufstelle a WHERE b.anlauf_id = a.id AND b.benutzername = '"
							+ benutzername + "' AND b.passwort = '" + passwort + "'");

			if (beduerftiger.next()) {
				Anlaufstelle a = new Anlaufstelle(beduerftiger.getInt("a.id"), beduerftiger.getString("a.bezeichnung"),
						beduerftiger.getString("a.adresse"), beduerftiger.getString("a.ort"),
						beduerftiger.getInt("a.plz"));
				return new Beduerftiger(beduerftiger.getInt("b.id"), beduerftiger.getString("b.benutzername"),
						beduerftiger.getString("passwort"), beduerftiger.getString("b.name"),
						beduerftiger.getString("b.vorname"), a, beduerftiger.getInt("personenHaushalt"));
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

	public static List<Interesse> holeInteresse(int spenden_id) {
		List<Interesse> result = new LinkedList<Interesse>();
		Connection con = ConnectionProvider.getCon();
		try {
			Statement myst = con.createStatement();
			ResultSet myRs = myst.executeQuery(
					"SELECT * from interesse i, beduerftiger b, spende s WHERE i.b_id = b.id AND i.s_id = s.id AND s.id = '"
							+ spenden_id + "' ORDER BY timestamp ASC");
			while (myRs.next()) {
				result.add(new Interesse(Datenbank.holeSpende(spenden_id),
						new Beduerftiger(myRs.getInt("b.id"), myRs.getString("b.benutzername"),
								myRs.getString("b.passwort"), myRs.getString("b.name"), myRs.getString("b.vorname"),
								myRs.getInt("b.personenHaushalt"), myRs.getInt("b.erhalteneSpenden")),
						myRs.getInt("prio"), myRs.getString("i.timestamp")));
			}
			return result;
		} catch (SQLException e) {
			System.out.println("FEHLER beim holen der Spende");
			e.printStackTrace();
		}
		return null;

	}

	public static boolean setSpendeNV(int s_id) {
		try {
			Connection con = ConnectionProvider.getCon();
			String sql = "UPDATE spende SET verfuegbar = '1' WHERE id = '" + s_id + "'";
			Statement st = con.createStatement();
			st.execute(sql);

		} catch (Exception e) {
			System.out.println("Fehler beim Einf�gen der Spende");
			e.printStackTrace();
		}
		return false;
	}

	public static boolean speichereZuordnung(Spende s, int bd_id, int erhalteneMenge) {
		int verfuegbar = 0;
		int restmenge = s.getMenge() - erhalteneMenge;
		if (restmenge == 0) {
			verfuegbar = 1;
		}
		try {
			Connection con = ConnectionProvider.getCon();
			String sql = "UPDATE spende SET beduerftiger_id = '" + bd_id + "', verfuegbar = '"+verfuegbar+"', restmenge = '"
					+ restmenge + "' WHERE id = '" + s.getId() + "'";
			String sql2 = "UPDATE beduerftiger SET `erhalteneSpenden` = `erhalteneSpenden` + 1  WHERE id = '"+bd_id+"'";
			Statement st = con.createStatement();
			Statement st2 = con.createStatement();
			st.executeUpdate(sql);
			st2.executeUpdate(sql2);
		} catch (Exception e) {
			System.out.println("Fehler beim Einfuegen der Zuordnung");
			e.printStackTrace();
			return false;
		}

		return true;
	}

}
