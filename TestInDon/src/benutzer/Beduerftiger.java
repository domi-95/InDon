package benutzer;

import spende.Anlaufstelle;

public class Beduerftiger extends Benutzer {

	private String vorname;
	private String nachname;
	private Anlaufstelle anlaufstelle;
	private int persHaushalt;

	public Beduerftiger(int id, String benutzername, String passwort, String vorname, String nachname) {
		super(id, benutzername, passwort);
		this.vorname = vorname;
		this.nachname = nachname;
	}

	public Beduerftiger(int id, String benutzername, String passwort, String vorname, String nachname,
			Anlaufstelle anlaufstelle, int persHaushalt) {
		super(id, benutzername, passwort);
		this.vorname = vorname;
		this.nachname = nachname;
		this.anlaufstelle = anlaufstelle;
		this.persHaushalt = persHaushalt;
	}

	public Beduerftiger(int id, String benutzername, String passwort, String vorname, String nachname,
			int persHaushalt) {
		super(id, benutzername, passwort);
		this.vorname = vorname;
		this.nachname = nachname;
		this.persHaushalt = persHaushalt;
	}

	public String getVorname() {
		return vorname;
	}

	public String getNachname() {
		return nachname;
	}

	public int getPersHaushalt() {
		return persHaushalt;
	}

	public Anlaufstelle getAnlaufstelle() {
		return anlaufstelle;
	}

	public void setAnlaufstelle(Anlaufstelle anlaufstelle) {
		this.anlaufstelle = anlaufstelle;
	}
	

}
