package benutzer;

public class Beduerftiger extends Benutzer{
	
	private String vorname;
	private String nachname;
	
	
	public Beduerftiger(int id, String benutzername, String passwort, String vorname, String nachname) {
		super(id, benutzername, passwort);
		this.vorname = vorname;
		this.nachname = nachname;
	}
	
	
	
	
	

}
