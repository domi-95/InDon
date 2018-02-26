package benutzer;

public class Benutzer {

	private int id;
	private String benutzername;
	private String passwort;

	public Benutzer(int id, String benutzername, String passwort) {
		this.id = id;
		this.benutzername = benutzername;
		this.passwort = passwort;
	}

	public int getId() {
		return id;
	}

}
