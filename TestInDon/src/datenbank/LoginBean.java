package datenbank;

public class LoginBean {
	private String benutzername,pass;  
	
	public LoginBean (String benutzername, String passwort) {
		this.benutzername = benutzername;
		this.pass = passwort;
	}
	  
	public String getBenutzername() {  
	    return benutzername ;  
	}  
	  
	public void setBenutzername(String benutzername) {  
	    this.benutzername = benutzername;  
	}  
	  
	public String getPass() {  
	    return pass;  
	}  
	  
	public void setPass(String pass) {  
	    this.pass = pass;  
	}  
}
