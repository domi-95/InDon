package spende;

public class Kategorie {

	private int id;
	private String bezeichnung;
	
	public Kategorie(int id, String bezeichnung) {
		this.id = id;
		this.bezeichnung = bezeichnung;
	}

	@Override
	public String toString() {
		return "Kategorie [id=" + id + ", bezeichnung=" + bezeichnung + "]";
	}
	
	
}
