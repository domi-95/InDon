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



	public int getId() {
		return id;
	}


	public String getBezeichnung() {
		return bezeichnung;
	}


	public Anlaufstelle getAnlaufstelle() {
		return anlaufstelle;
	}


	public boolean isStark_gefragt() {
		return stark_gefragt;
	}



	public boolean isVerfuegbar() {
		return verfuegbar;
	}





	
	
}
