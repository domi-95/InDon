
public class Rettungsorganisation extends Benutzer {

	private String bezeichnung;

	public Rettungsorganisation(int id, String benutzername, String passwort, String bezeichnung) {
		super(id, benutzername, passwort);
		this.bezeichnung = bezeichnung;
	}


}
