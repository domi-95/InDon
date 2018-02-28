package spende;
import java.util.LinkedList;
import java.util.List;

import datenbank.Datenbank;


public class Anlaufstelle {
	
	private int id;
	private String bezeichnunganlaufstelle;
	private String adresse;
	private String ort;
	private int plz;
	private List<Kategorie>kategorien = new LinkedList<Kategorie>();
	

	public Anlaufstelle(int id, String bezeichnunganlaufstelle, String adresse, String ort, int plz) {
		super();
		this.id = id;
		this.bezeichnunganlaufstelle = bezeichnunganlaufstelle;
		this.adresse = adresse;
		this.ort = ort;
		this.plz = plz;
	}

	public String getBezeichnunganlaufstelle() {
		return bezeichnunganlaufstelle;
	}


	public String getAdresse() {
		return adresse;
	}


	public String getOrt() {
		return ort;
	}


	public int getPlz() {
		return plz;
	}


	public int getId() {
		return id;
	}


	public List<Kategorie> getKategorien() {
		this.kategorien = Datenbank.holeKategorien(this);
		return kategorien;
	}


	
	
	
	
	

}
