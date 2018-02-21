package benutzer;

public class Rettungsorganisation extends Benutzer {

	private String bezeichnung;
	private int id_ret;





	public Rettungsorganisation(int id, String benutzername, String passwort, String bezeichnung, int id_ret) {
		super(id, benutzername, passwort);
		this.bezeichnung = bezeichnung;
		this.id_ret = id_ret;
	}





	@Override
	public String toString() {
		return super.toString() + "Rettungsorganisation [bezeichnung=" + bezeichnung + "]"  ;
	}





	public String getBezeichnung() {
		return bezeichnung;
	}





	public void setBezeichnung(String bezeichnung) {
		this.bezeichnung = bezeichnung;
	}





	public int getId_ret() {
		return id_ret;
	}





	public void setId_ret(int id_ret) {
		this.id_ret = id_ret;
	}
	
	

}
