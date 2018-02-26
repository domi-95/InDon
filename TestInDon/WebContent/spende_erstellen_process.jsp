<%@page import="java.io.*"%>
<%@page import= "javax.servlet.*"%>
<%@page import="datenbank.Datenbank"%>
<%@page import="datenbank.ConnectionProvider" %>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType ="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="style/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="style/indon.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Success</title>
</head>
<body>
<jsp:include page="Header.jsp"></jsp:include>
<div class="login">
<%
String bezeichnung = request.getParameter("bezeichnung");
String beschreibung = request.getParameter("beschreibung");
String zustand = request.getParameter("zustand");
String kategorie = request.getParameter("kategorie");
String menge = request.getParameter("menge");
String vorname =null;
String name = null;
String adresse = null;
String ort = null;
int abholung = 0;
int lieferung = 0;
int anonym = 0;
int plz = 0;

if(request.getParameter("lieferungabholung")== "1"){
	abholung = 1;
}

if(request.getParameter("lieferungabholung")=="2"){
	lieferung = 1;
}

String mhd = request.getParameter("mhd"); //irgendwie in Date Parsen oder in String speichern

if (request.getParameter("anonym") == "on" ){
	anonym = 1;  // gib eine 1 oder nichts zurück
	out.print(anonym);
}
else{
	anonym = 0;
}

 //alle Felder die optional sind und eventuell kein Wert zurückgeben weil das Inputfeld nicht gefüllt ist musst noch eine Verzweigung mit if .. =! null einfügen

if(request.getParameter("vorname")!=""){		 
	vorname = request.getParameter("vorname");
	out.print("Testausgabe");
	out.print(vorname);
}
if(request.getParameter("name")!=""){		 
	name = request.getParameter("name");
	out.print(name);
}
if(request.getParameter("adresse")!=""){		 
	adresse = request.getParameter("adresse");
	out.print(adresse);
}

if(request.getParameter("plz")!=""){	
	plz = Integer.parseInt(request.getParameter("plz"));
	//String plz = request.getParameter("plz");
	out.print(plz);
}
if(request.getParameter("ort")!=""){		 
	ort = request.getParameter("ort"); 
	out.print(ort);
}

	//int ret_id = Integer.parseInt(request.getParameter(""));
	//int kat_id = Integer.parseInt(request.getParameter(""));

out.print(bezeichnung);
out.print(beschreibung);
out.print(zustand);
out.print(kategorie);
out.print(menge);
	//Datenbank.speichereSpende(beschreibung, bezeichnung, zustand, abholung, lieferung, bild_url, mhd, anonym, vorname, name , adresse, plz, ort, 1, 1);

%>

<%
InputStream in = null;
Blob pic = null;
Connection con = ConnectionProvider.getCon();
		try{
			
			String saveFile = new String();
			String contentType = request.getContentType();
			Part filePart = request.getPart("photo");
			
			in = filePart.getInputStream();
			
				if (filePart != null) {
		            // prints out some information for debugging
		            System.out.println(filePart.getName());
		            System.out.println(filePart.getSize());
		            System.out.println(filePart.getContentType());
		             
		            // obtains input stream of the upload file
		            
		        }
				if (in != null) {
	                // fetches input stream of the upload file for the blob colum
	               // statement.setBlob(3, in);
					String sql ="INSERT INTO Spende (beschreibung, bezeichnung_spende, zustand, abholung, lieferung, bild, mhd, anonym, vorname, nachname, adresse, plz, ort, anlaufstelle_id, kategorie_id)" + "VALUES ('"+ beschreibung+"','" + bezeichnung + "', '" + zustand + "', "+abholung+","+lieferung+", ?, '"+mhd+"',"+anonym+", '" + vorname + "' , '" + name + "', '" + adresse + "', " + plz + ", '" + ort + "',"+"1"+","+"1"+")";
					PreparedStatement statement = con.prepareStatement(sql);
					
					statement.setBlob(1, in);
					statement.executeUpdate();	
	            }
	
			/*
			if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
				in = filePart.getInputStream();

				
				int formDataLength = request.getContentLength();
				byte dataBytes[] = new byte[formDataLength];
				int byteRead = 0;
				int totalBytesRead = 0;

				while (totalBytesRead < formDataLength) {
					byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
					totalBytesRead += byteRead;
				}

				String file = new String(dataBytes);

				saveFile = file.substring(file.indexOf("filename=\"") + 10);
				saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
				saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));
				int lastIndex = contentType.lastIndexOf("=");

				String boundary = contentType.substring(lastIndex + 1, contentType.length());

				int pos;

				pos = file.indexOf("filename=\"");
				pos = file.indexOf("\n", pos) + 1;
				pos = file.indexOf("\n", pos) + 1;
				pos = file.indexOf("\n", pos) + 1;

				int boundaryLocation = file.indexOf(boundary, pos) - 4;

				int startPos = ((file.substring(0, pos)).getBytes()).length;
				int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;

				saveFile = "/Users/Domi/Downloads/"+ saveFile;
				
				File ff = new File(saveFile);

					try {
						FileOutputStream fileOut = new FileOutputStream(ff);
						fileOut.write(dataBytes, startPos, (endPos - startPos));
						fileOut.flush();
						fileOut.close();
					} catch (Exception e) {
						out.println(e);
					}*/
			
		}
				catch (Exception e) {
					System.out.println("FEHLER beim speichern des Bild ");
					e.printStackTrace();
				}

				//Datenbank.speichereSpende(beschreibung, bezeichnung, zustand, abholung, lieferung, pic, mhd, anonym, vorname, name , adresse, plz, ort, 1, 1);
		%>
		
		



<h3>Vielen Dank, dass sie gespendet haben!</h3>
</div>

</body>
</html>