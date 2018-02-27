package spende;

public class Kategorie {

	private int id;
	private String bezeichnung;
	private Anlaufstelle anlaufstelle;
	private boolean stark_gefragt;
	private boolean verfuegbar;
	
	

	public Kategorie(int id, String bezeichnung, Anlaufstelle anlaufstelle, boolean stark_gefragt, boolean verfuegbar) {
		super();
		this.id = id;
		this.bezeichnung = bezeichnung;
		this.anlaufstelle = anlaufstelle;
		this.stark_gefragt = stark_gefragt;
		this.verfuegbar = verfuegbar;
	}
	
	


	public Kategorie(int id, String bezeichnung) {
		super();
		this.id = id;
		this.bezeichnung = bezeichnung;
	}




	@Override
	public String toString() {
		return "Kategorie [id=" + id + ", bezeichnung=" + bezeichnung + ", anlaufstelle=" + anlaufstelle
				+ ", stark_gefragt=" + stark_gefragt + ", verfuegbar=" + verfuegbar + "]";
	}




	public int getId() {
		return id;
	}




	public void setId(int id) {
		this.id = id;
	}




	public String getBezeichnung() {
		return bezeichnung;
	}




	public void setBezeichnung(String bezeichnung) {
		this.bezeichnung = bezeichnung;
	}




	public Anlaufstelle getAnlaufstelle() {
		return anlaufstelle;
	}




	public void setAnlaufstelle(Anlaufstelle anlaufstelle) {
		this.anlaufstelle = anlaufstelle;
	}




	public boolean isStark_gefragt() {
		return stark_gefragt;
	}




	public void setStark_gefragt(boolean stark_gefragt) {
		this.stark_gefragt = stark_gefragt;
	}




	public boolean isVerfuegbar() {
		return verfuegbar;
	}




	public void setVerfuegbar(boolean verfuegbar) {
		this.verfuegbar = verfuegbar;
	}

	


	
	
}
