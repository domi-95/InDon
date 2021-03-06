package spende;
import java.util.List;

import datenbank.Datenbank;

public class Spende {
	
	private int id;	
	private String bezeichnung_spende;
	private String beschreibung;
	private String zustand;
	private int abholung; //boolean
	private int lieferung; //boolean
	private String bild;
	private String mhd;
	private int anonym;	//boolean
	private String name;
	private String vorname;
	private String adresse;
	private int plz;
	

	public Spende(int id, String bezeichnung_spende, String beschreibung, String zustand, int abholung, int lieferung,
			String bild, String mhd, int anonym, String name, String vorname, String adresse, int plz) {
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
	}

	public static List<Spende> spendenmatchen(int anlaufstelle_id) {
		return Datenbank.holeSpenden(anlaufstelle_id);
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBezeichnung_spende() {
		return bezeichnung_spende;
	}

	public void setBezeichnung_spende(String bezeichnung_spende) {
		this.bezeichnung_spende = bezeichnung_spende;
	}

	public String getBeschreibung() {
		return beschreibung;
	}

	public void setBeschreibung(String beschreibung) {
		this.beschreibung = beschreibung;
	}

	public String getZustand() {
		return zustand;
	}

	public void setZustand(String zustand) {
		this.zustand = zustand;
	}

	public int getAbholung() {
		return abholung;
	}

	public void setAbholung(int abholung) {
		this.abholung = abholung;
	}

	public int getLieferung() {
		return lieferung;
	}

	public void setLieferung(int lieferung) {
		this.lieferung = lieferung;
	}

	public String getBild() {
		return bild;
	}

	public void setBild(String bild) {
		this.bild = bild;
	}

	public String getMhd() {
		return mhd;
	}

	public void setMhd(String mhd) {
		this.mhd = mhd;
	}

	public int getAnonym() {
		return anonym;
	}

	public void setAnonym(int anonym) {
		this.anonym = anonym;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getVorname() {
		return vorname;
	}

	public void setVorname(String vorname) {
		this.vorname = vorname;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	public int getPlz() {
		return plz;
	}

	public void setPlz(int plz) {
		this.plz = plz;
	}
	
	

}
