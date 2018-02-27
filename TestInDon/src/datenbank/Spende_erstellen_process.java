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

import spende.Anlaufstelle;

import javax.servlet.http.HttpSession;


@WebServlet("/Spende_erstellen_process_neu")
@MultipartConfig(maxFileSize = 1617721599)	// upload file's size up to 16MB
public class Spende_erstellen_process extends HttpServlet {
	//private static final long serialVersionUID = 1L;
	
	// database connection settings
		private String dbURL = "jdbc:mysql://server2.febas.net/InDon";
		private String dbUser = "InDonAdmin";
		private String dbPass = "InDon123";
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Anlaufstelle a = (Anlaufstelle)session.getAttribute("anlauf");
		int anl_id = a.getId();
		boolean tooBig = false;
		// gets values of text fields
				String bezeichnung = request.getParameter("bezeichnung");
				String beschreibung = request.getParameter("beschreibung");
				String zustand = request.getParameter("zustand");
				String kategorie = request.getParameter("kategorie");
				String vorname = "";
				String name = "";
				String adresse = "";
				String ort = "";
				String mhd = "";
				String mail = "";
				String telefon = "";
				int abholung = 0;
				int lieferung = 0;
				int anonym = 0;
				int plz = 0;
				int menge = Integer.parseInt(request.getParameter("menge"));
				int kat_id= Integer.parseInt(request.getParameter("kategorie"));
				int bed_id=0;
				int verfuegbar = 0;
				
				InputStream inputStream = null;	// input stream of the upload file
				
				
				if("on".equals(request.getParameter("anonym"))) {
					anonym = 1;
				}
				else {
					anonym = 0;
				}

				vorname = request.getParameter("vorname");
				name = request.getParameter("name");
				adresse = request.getParameter("adresse");
				
				if("".equals(request.getParameter("plz"))) {
					plz = 0;
				}
				else {
					plz = Integer.parseInt(request.getParameter("plz"));
				}
				
				ort = request.getParameter("ort"); 
				mail = request.getParameter("mail");
				
				if("".equals(request.getParameter("telefon"))) {
					telefon = "";
				}
				else {
					telefon = request.getParameter("telefon");
				}
				
				if("2".equals(request.getParameter("lieferungabholung"))){
					abholung = 1;
				}
				if("1".equals(request.getParameter("lieferungabholung"))){
					lieferung = 1;
				}
				
				
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

					int count = 0;
					
					// constructs SQL statement
					String sql = "INSERT INTO spende (beschreibung, bezeichnung_spende, zustand, abholung, lieferung, bild, mhd, anonym, vorname, nachname, adresse, plz, ort, anlaufstelle_id, kategorie_id, verfuegbar, beduerftiger_id, menge, email, telefon) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
					PreparedStatement statement = conn.prepareStatement(sql);
					
					if("".equals(beschreibung)) {
						
					}
					else {
						statement.setString(1, beschreibung);
						count++;
					}
					
					if("".equals(bezeichnung)) {
						
					}
					else {
						statement.setString(2, bezeichnung);
						count++;
					}
					
					if("".equals(zustand)) {
						
					}else {
						statement.setString(3, zustand);
						count++;
					}
					
					statement.setInt(4, abholung);
					statement.setInt(5, lieferung);
					
					if (inputStream != null) {
						// fetches input stream of the upload file for the blob column
						statement.setBlob(6, inputStream);
					}
					
//					if("".equals(mhd)) {
//						
//					}
//					else {
//						statement.setString(7, mhd);
//						count++;
//					}
					statement.setString(7, mhd);
					statement.setInt(8, anonym);
					
					if("".equals(vorname)) {
						
					}
					else {
						statement.setString(9, vorname);
						count++;
					}
					
					if("".equals(name)) {
						
					}
					else {
						statement.setString(10, name);
						count++;
					}
					
					if("1".equals(request.getParameter("lieferungabholung"))){
						count++;
					}
					System.out.println("Abholung: " + abholung);
					if("2".equals(request.getParameter("lieferungabholung"))){
						if("".equals(adresse)|| plz==0 || "".equals(ort)) {
							
						}
						else {
							count++;
						}
					}
					statement.setString(11, adresse);
					statement.setInt(12, plz);
					statement.setString(13, ort);
					statement.setInt(14, anl_id);
					statement.setInt(15, kat_id);
					statement.setInt(16, verfuegbar);
					statement.setInt(17, bed_id);
					statement.setInt(18, menge);
					statement.setString(19, mail);
					statement.setString(20, telefon);
					
					
					// sends the statement to the database server
					if(count==6) {
					int row = statement.executeUpdate();
					if (row > 0) {
						message = "Vielen Dank, dass sie gespendet haben!";
					}
					
					else {
						message = "Bitte füllen Sie alle Pflichtfelder!";
					}
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
