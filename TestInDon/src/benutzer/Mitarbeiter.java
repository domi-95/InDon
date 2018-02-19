package benutzer;


public class Mitarbeiter extends Rettungsorganisation{
	
	private String name;
	private String vorname;
	
	public Mitarbeiter(int id, String benutzername, String passwort, String bezeichnung, String name, String vorname) {
		super(id, benutzername, passwort, bezeichnung);
		this.name = name;
		this.vorname = vorname;
		
	}

	@Override
	public String toString() {
		return super.toString()+ "Mitarbeiter [name=" + name + ", vorname=" + vorname + "]";
	}

	
	
	


	
	

	
	

	
	
}
