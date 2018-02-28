package spende;

import benutzer.Beduerftiger;

public class Interesse {
	Spende spende;
	Beduerftiger beduerftiger;
	int prio;
	String timestamp;

	public Interesse(Spende spende, Beduerftiger beduerftiger, int prio, String timestamp) {
		super();
		this.spende = spende;
		this.beduerftiger = beduerftiger;
		this.prio = prio;
		this.timestamp = timestamp;
	}

	public Spende getSpende() {
		return spende;
	}

	public Beduerftiger getBeduerftiger() {
		return beduerftiger;
	}

	public String getTimestamp() {
		return timestamp;
	}

	public int getPrio() {
		return prio;
	}

}
