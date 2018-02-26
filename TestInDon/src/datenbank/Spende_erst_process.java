package datenbank;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 1617721599)	// upload file's size up to 16MB
public class Spende_erst_process extends HttpServlet {
	
	// database connection settings
	private String dbURL = "jdbc:mysql://server2.febas.net/InDon";
	private String dbUser = "InDonAdmin";
	private String dbPass = "InDon123";
	
	private String vorname;
	private String name;
	private int abholung = 10;
	
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// gets values of text fields
		String bezeichnung = request.getParameter("bezeichnung");
		String beschreibung = request.getParameter("beschreibung");
		String zustand = request.getParameter("zustand");
		String kategorie = request.getParameter("kategorie");
		String menge = request.getParameter("menge");
		vorname = "Testv";
		name = "TN";
		String adresse = "Adre";
		String ort = "TO";
		String mhd = "hw";
		String mail = "awm";
		int telefon = 0;
		//int abholung = 5;
		abholung = 5;
		int lieferung = 0;
		int anonym = 0;
		int plz = 0;
		int kat_id=0;
		int anl_id=0;
		
		InputStream inputStream = null;	// input stream of the upload file
		
		
		
		
		anonym = 0;
		vorname = request.getParameter("vorname");
		name = request.getParameter("name");
		adresse = request.getParameter("adresse");
		plz = Integer.parseInt(request.getParameter("plz"));
		ort = request.getParameter("ort"); 
		mail = request.getParameter("mail");
		telefon = Integer.parseInt(request.getParameter("telefon"));
		abholung = 10;
		System.out.println("Abholung: " + abholung);
		
		// obtains the upload file part in this multipart request
		Part filePart = request.getPart("photo");
		if (filePart != null) {
			// prints out some information for debugging
			System.out.println(filePart.getName());
			System.out.println(filePart.getSize());
			System.out.println(filePart.getContentType());
			
			// obtains input stream of the upload file
			inputStream = filePart.getInputStream();
		}
		
		Connection conn = null;	// connection to the database
		String message = null;	// message will be sent back to client
		
		try {
			// connects to the database
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
			abholung = 1;
			lieferung = 0;
			// constructs SQL statement
			String sql ="INSERT INTO Spende (beschreibung, bezeichnung_spende, zustand, abholung, lieferung, bild, mhd, anonym, vorname, nachname, adresse, plz, ort, anlaufstelle_id, kategorie_id, verfuegbar, beduerftiger_id) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?, ?, ?)";
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, beschreibung);
			statement.setString(2, bezeichnung);
			statement.setString(3, zustand);
			statement.setInt(4, abholung);
			statement.setInt(5, lieferung);
			
			if (inputStream != null) {
				// fetches input stream of the upload file for the blob column
				statement.setBlob(6, inputStream);
			}
			
			statement.setString(7, mhd);
			statement.setInt(8, anonym);
			statement.setString(9, vorname);
			statement.setString(10, name);
			statement.setString(11, adresse);
			statement.setInt(12, plz);
			statement.setString(13, ort);
			statement.setInt(14, anl_id);
			statement.setInt(15, kat_id);
			
			// sends the statement to the database server
			int row = statement.executeUpdate();
			if (row > 0) {
				message = "Vielen Dank, dass sie gespendet haben!";
			}
		} catch (SQLException ex) {
			message = "ERROR: " + ex.getMessage();
			ex.printStackTrace();
		} finally {
			if (conn != null) {
				// closes the database connection
				try {
					conn.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			}
			// sets the message in request scope
			request.setAttribute("Message", message);
			
			// forwards to the message page
			getServletContext().getRequestDispatcher("/Message.jsp").forward(request, response);
		}
	}
}