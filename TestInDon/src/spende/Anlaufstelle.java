package spende;
import benutzer.Rettungsorganisation;

public class Anlaufstelle {
	
	private int id;
	private String bezeichnunganlaufstelle;
	private String adresse;
	private String ort;
	private int plz;
	

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

	public void setBezeichnunganlaufstelle(String bezeichnunganlaufstelle) {
		this.bezeichnunganlaufstelle = bezeichnunganlaufstelle;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	public String getOrt() {
		return ort;
	}

	public void setOrt(String ort) {
		this.ort = ort;
	}

	public int getPlz() {
		return plz;
	}

	public void setPlz(int plz) {
		this.plz = plz;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}


	
	
	
	
	

}
