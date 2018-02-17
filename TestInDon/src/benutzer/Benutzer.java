package benutzer;

public class Benutzer {
	
	private int id;
	private String benutzername;
	private String passwort;
	
	public Benutzer(int id, String benutzername, String passwort) {
		super();
		this.id = id;
		this.benutzername = benutzername;
		this.passwort = passwort;
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBenutzername() {
		return benutzername;
	}

	public void setBenutzername(String benutzername) {
		this.benutzername = benutzername;
	}

	public String getPasswort() {
		return passwort;
	}

	public void setPasswort(String passwort) {
		this.passwort = passwort;
	}

	@Override
	public String toString() {
		return "Benutzer [id=" + id + ", benutzername=" + benutzername + ", passwort=" + passwort + "]";
	}
	
	

	
	
	
	
	
}
