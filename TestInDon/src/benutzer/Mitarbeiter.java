package benutzer;

public class Mitarbeiter extends Rettungsorganisation {

	private String name;
	private String vorname;

	public Mitarbeiter(int id, String benutzername, String passwort, String bezeichnung, int id_ret, String name,
			String vorname) {
		super(id, benutzername, passwort, bezeichnung, id_ret);
		this.name = name;
		this.vorname = vorname;
	}

	public int holeId_ret() {
		return super.getId_ret();
	}

	public String getName() {
		return name;
	}

	public String getVorname() {
		return vorname;
	}

}
