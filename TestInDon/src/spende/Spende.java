package spende;

import java.util.List;

import datenbank.Datenbank;

public class Spende {

	private int id;
	private String bezeichnung_spende;
	private String beschreibung;
	private String zustand;
	private int abholung; // boolean
	private int lieferung; // boolean
	private byte[] bild;
	private String mhd;
	private int anonym; // boolean
	private String vorname;
	private String name;
	private String adresse;
	private int plz;
	private String ort;
	private Anlaufstelle anlaufstelle;
	private Kategorie kategorie;
	private int menge;
	private int restmenge;
	private String email;
	private int telefon;

	public Spende(int id, String bezeichnung_spende, String beschreibung, String zustand, int abholung, int lieferung,
			byte[] bild, String mhd, int anonym, String name, String vorname, String adresse, int plz,
			Anlaufstelle anlaufstelle, Kategorie kategorie) {
		super();
		this.id = id;
		this.bezeichnung_spende = bezeichnung_spende;
		this.beschreibung = beschreibung;
		this.zustand = zustand;
		this.abholung = abholung;
		this.lieferung = lieferung;
		this.bild = bild;
		this.mhd = mhd;
		this.anonym = anonym;
		this.name = name;
		this.vorname = vorname;
		this.adresse = adresse;
		this.plz = plz;
		this.anlaufstelle = anlaufstelle;
		this.kategorie = kategorie;
	}

	public static List<Spende> spendenmatchen(int anlaufstelle_id) {
		return Datenbank.holeSpenden(anlaufstelle_id);
	}

	public int getId() {
		return id;
	}

	public String getBezeichnung_spende() {
		return bezeichnung_spende;
	}

	public String getBeschreibung() {
		return beschreibung;
	}

	public String getZustand() {
		return zustand;
	}

	public int getAbholung() {
		return abholung;
	}

	public int getLieferung() {
		return lieferung;
	}

	public byte[] getBild() {
		return bild;
	}

	public Anlaufstelle getAnlaufstelle() {
		return anlaufstelle;
	}

	public Kategorie getKategorie() {
		return kategorie;
	}

	public String getMhd() {
		return mhd;
	}

	public int getAnonym() {
		return anonym;
	}

	public String getName() {
		return name;
	}

	public String getVorname() {
		return vorname;
	}

	public String getAdresse() {
		return adresse;
	}

	public int getPlz() {
		return plz;
	}

}
