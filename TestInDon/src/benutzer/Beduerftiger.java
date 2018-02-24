package benutzer;

public class Beduerftiger extends Benutzer{
	
	private String vorname;
	private String nachname;
	private int persHaushalt;
	
	
	public Beduerftiger(int id, String benutzername, String passwort, String vorname, String nachname) {
		super(id, benutzername, passwort);
		this.vorname = vorname;
		this.nachname = nachname;
	}


	public String getVorname() {
		return vorname;
	}



	public String getNachname() {
		return nachname;
	}

	
	
	
	
	

}
