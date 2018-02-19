package spende;
import java.util.Date;

public class Spende {
	
	private int id;
	private String bezeichnung_spende;
	private String beschreibung;
	private String zustand;
	private int abholung; //boolean
	private int lieferung; //boolean
	private Date mhd;
	private int anonym;	//boolean
	private String name;
	private String vorname;
	private String adresse;
	private int plz;
	
	public Spende(int id, String bezeichnung_spende, String beschreibung, String zustand, int abholung, int lieferung,
			Date mhd, int anonym, String name, String vorname, String adresse, int plz) {
		super();
		this.id = id;
		this.bezeichnung_spende = bezeichnung_spende;
		this.beschreibung = beschreibung;
		this.zustand = zustand;
		this.abholung = abholung;
		this.lieferung = lieferung;
		this.mhd = mhd;
		this.anonym = anonym;
		this.name = name;
		this.vorname = vorname;
		this.adresse = adresse;
		this.plz = plz;
	}


	public static Spende[] spendenmatchen() {
		return null;
	}
	
	

}
