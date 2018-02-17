import benutzer.Rettungsorganisation;

public class Anlaufstelle extends Rettungsorganisation{
	
	private String bezeichnunganlaufstelle;
	private String adresse;
	private String ort;
	private int plz;
	
	public Anlaufstelle(int id, String benutzername, String passwort, String bezeichnung,
			String bezeichnunganlaufstelle, String adresse, String ort, int plz) {
		super(id, benutzername, passwort, bezeichnung);
		this.bezeichnunganlaufstelle = bezeichnunganlaufstelle;
		this.adresse = adresse;
		this.ort = ort;
		this.plz = plz;
	}
	
	

}
