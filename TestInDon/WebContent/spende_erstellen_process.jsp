<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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


if(request.getParameter("lieferungabholung")== "1"){
	int abholung = 1;
}
if(request.getParameter("lieferungabholung")=="2"){
	int lieferung = 1;
}


String bild_url = request.getParameter("");
String mhd = request.getParameter("mhd"); //irgendwie in Date Parsen oder in String speichern

if (request.getParameter("anonym") == "on" ){
	int anonym = 1;  // gib eine 1 oder nichts zurück
	out.print(anonym);
}
else{
	int anonym = 0;
}

 //alle Felder die optional sind und eventuell kein Wert zurückgeben weil das Inputfeld nicht gefüllt ist musst noch eine Verzweigung mit if .. =! null einfügen

if(request.getParameter("vorname")!=""){		 
	String vorname = request.getParameter("vorname");
	out.print("Testausgabe");
	out.print(vorname);
}
if(request.getParameter("name")!=""){		 
	String name = request.getParameter("name");
	out.print(name);
}
if(request.getParameter("adresse")!=""){		 
	String adresse = request.getParameter("adresse");
	out.print(adresse);
}

if(request.getParameter("plz")!=""){	
	int plz = Integer.parseInt(request.getParameter("plz"));
	out.print(plz);
}
if(request.getParameter("ort")!=""){		 
	String ort = request.getParameter("ort"); 
	out.print(ort);
}

	//int ret_id = Integer.parseInt(request.getParameter(""));
	//int kat_id = Integer.parseInt(request.getParameter(""));

out.print(bezeichnung);
out.print(beschreibung);
out.print(zustand);
out.print(kategorie);
out.print(menge);


%>

<%
			String saveFile = new String();
			String contentType = request.getContentType();

			if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
				DataInputStream in = new DataInputStream(request.getInputStream());

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

				saveFile = "C:/Users/Kevin/workspace"+ saveFile;
				
				File ff = new File(saveFile);

				try {
					FileOutputStream fileOut = new FileOutputStream(ff);
					fileOut.write(dataBytes, startPos, (endPos - startPos));
					fileOut.flush();
					fileOut.close();
				} catch (Exception e) {
					out.println(e);
				}
			}
		%>


<h3>Vielen Dank, dass sie gespendet haben!</h3>
</div>

</body>
</html>