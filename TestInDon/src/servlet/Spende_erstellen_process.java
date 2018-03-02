package servlet;

import java.awt.AlphaComposite;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import datenbank.ConnectionProvider;
import spende.Anlaufstelle;

import javax.servlet.http.HttpSession;

@WebServlet("/Spende_erstellen_process")
@MultipartConfig(maxFileSize = 1617721599) // upload file's size up to 16MB
public class Spende_erstellen_process extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Anlaufstelle a = (Anlaufstelle) session.getAttribute("anlauf");

		// gets values of text fields
		String bezeichnung = request.getParameter("bezeichnung");
		String beschreibung = request.getParameter("beschreibung");
		String zustand = request.getParameter("zustand");
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
		int menge = 0;
		int kat_id = Integer.parseInt(request.getParameter("kategorie"));
		int bed_id = 0;
		int verfuegbar = 0;
		int anl_id = a.getId();
		int restmenge = 0;

		InputStream inputStream = null; // input stream of the upload file
		InputStream is = null;

		if ("on".equals(request.getParameter("anonym"))) {
			anonym = 1;
		} else {
			anonym = 0;
		}

		vorname = request.getParameter("vorname");
		name = request.getParameter("name");
		adresse = request.getParameter("adresse");

		if ("".equals(request.getParameter("plz"))) {
			plz = 0;
		} else {
			plz = Integer.parseInt(request.getParameter("plz"));
		}
		if ("".equals(request.getParameter("menge"))) {
			menge = 0;
		} else {
			menge = Integer.parseInt(request.getParameter("menge"));
			restmenge = menge;
		}

		ort = request.getParameter("ort");
		mail = request.getParameter("mail");

		if ("".equals(request.getParameter("telefon"))) {
			telefon = "";
		} else {
			telefon = request.getParameter("telefon");
		}

		if ("2".equals(request.getParameter("lieferungabholung"))) {
			abholung = 1;
		}
		if ("1".equals(request.getParameter("lieferungabholung"))) {
			lieferung = 1;
		}

		// bezieht das Bild aus dem multipart request
		Part filePart = request.getPart("photo");
		if (filePart != null) {
			// prints out some information for debugging
			System.out.println(filePart.getName());
			System.out.println(filePart.getSize());
			System.out.println(filePart.getContentType());

			// bezieht den input stream vom bild

			inputStream = filePart.getInputStream();

		}
		if(filePart.getSize() > 6300) {
		try {

	        Image image = ImageIO.read(inputStream);

	        BufferedImage bi = this.createResizedCopy(image, 200, 200, true);
	       // ImageIO.write(bi, "jpg", new File("C:\\ImagenesAlmacen\\QR\\olaKeAse.jpg"));
	        ByteArrayOutputStream baos = new ByteArrayOutputStream();
	        ImageIO.write(bi, "jpg", baos);
	        is = new ByteArrayInputStream(baos.toByteArray());

	    } catch (IOException e) {
	        System.out.println("Error");
	    }
		}
		else {
			is = inputStream;
		}
		

		Connection conn = null; // datenbank connection
		String message = null;

		try {
			conn = ConnectionProvider.getCon();

			int count = 0;

			// konstrutiere SQL statement
			String sql = "INSERT INTO spende (beschreibung, bezeichnung_spende, zustand, abholung, lieferung, bild, mhd, anonym, vorname, nachname, adresse, plz, ort, anlaufstelle_id, kategorie_id, verfuegbar, beduerftiger_id, menge, email, telefon, restmenge) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement statement = conn.prepareStatement(sql);

			if ("".equals(beschreibung)) {

			} else {
				statement.setString(1, beschreibung);
				count++;
			}

			if ("".equals(bezeichnung)) {

			} else {
				statement.setString(2, bezeichnung);
				count++;
			}

			if ("".equals(zustand)) {

			} else {
				statement.setString(3, zustand);
				count++;
			}

			statement.setInt(4, abholung);
			statement.setInt(5, lieferung);

			if (inputStream != null) {
				// fetche den input stream vom bild in ein blob column
				statement.setBlob(6, is);
			}
			statement.setString(7, mhd);
			statement.setInt(8, anonym);

			if ("".equals(vorname)) {

			} else {
				statement.setString(9, vorname);
				count++;
			}

			if ("".equals(name)) {

			} else {
				statement.setString(10, name);
				count++;
			}

			if ("1".equals(request.getParameter("lieferungabholung"))) {
				count++;
			}

			if ("2".equals(request.getParameter("lieferungabholung"))) {
				if ("".equals(adresse) || plz == 0 || "".equals(ort)) {

				} else {
					count++;
				}
			}
			statement.setString(11, adresse);
			statement.setInt(12, plz);
			statement.setString(13, ort);
			if (anl_id != 0) {
				statement.setInt(14, anl_id);
			}
			if (kat_id != 0) {
				statement.setInt(15, kat_id);
				count++;
			}
			statement.setInt(16, verfuegbar);
			statement.setInt(17, bed_id);
			if (menge != 0) {
				statement.setInt(18, menge);	
				count++;
			}
			statement.setString(19, mail);
			statement.setString(20, telefon);
			if (restmenge != 0) {
				statement.setInt(21, restmenge);
				count++;
			}

			// executet das statement
			if (count == 9) {
				int row = statement.executeUpdate();
				if (row > 0) {
					message = "Vielen Dank, dass sie gespendet haben!";
				}
			}
				else {
					message = "Bitte füllen Sie alle Pflichtfelder!";
				}
			
		} catch (SQLException ex) {
			message = "ERROR: " + ex.getMessage();
			ex.printStackTrace();
		} 
//			finally {
//			if (conn != null) {
//				// schlie�t die db connection
//				try {
//					conn.close();
//				} catch (SQLException ex) {
//					ex.printStackTrace();
//				}
//			}
			// sets the message in request scope
			// setzt die message in den request scope
			request.setAttribute("Message", message);

			// zur message page
			getServletContext().getRequestDispatcher("/Message.jsp").forward(request, response);
		//}
			
			

		
	}
	BufferedImage createResizedCopy(Image originalImage, int scaledWidth, int scaledHeight, boolean preserveAlpha){
	    int imageType = preserveAlpha ? BufferedImage.TYPE_INT_RGB : BufferedImage.TYPE_INT_ARGB;
	    BufferedImage scaledBI = new BufferedImage(scaledWidth, scaledHeight, imageType);
	    Graphics2D g = scaledBI.createGraphics();
	    if (preserveAlpha) {
	        g.setComposite(AlphaComposite.Src);
	    }
	    g.drawImage(originalImage, 0, 0, scaledWidth, scaledHeight, null);
	    g.dispose();
	    return scaledBI;
	}
	

}
