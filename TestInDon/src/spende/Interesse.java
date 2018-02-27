package spende;
import benutzer.Beduerftiger;

public class Interesse {

	//int b_id;
	//int s_id;
	Spende spende;
	Beduerftiger beduerftiger;
	String timestamp;
	
	public Interesse(Spende spende, Beduerftiger beduerftiger, String timestamp) {
		this.spende = spende;
		this.beduerftiger = beduerftiger;
		this.timestamp = timestamp;
	}

	public Spende getSpende() {
		return spende;
	}

	public void setSpende(Spende spende) {
		this.spende = spende;
	}

	public Beduerftiger getBeduerftiger() {
		return beduerftiger;
	}

	public void setBeduerftiger(Beduerftiger beduerftiger) {
		this.beduerftiger = beduerftiger;
	}

	public String getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}
	
	

}