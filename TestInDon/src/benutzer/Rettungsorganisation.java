package benutzer;

public class Rettungsorganisation extends Benutzer {

	private String bezeichnung;
	private int id_ret;

	public Rettungsorganisation(int id, String benutzername, String passwort, String bezeichnung, int id_ret) {
		super(id, benutzername, passwort);
		this.bezeichnung = bezeichnung;
		this.id_ret = id_ret;
	}

	public String getBezeichnung() {
		return bezeichnung;
	}

	public int getId_ret() {
		return id_ret;
	}

}
