<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="style/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="style/indon.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<style>


#lieferung:not(:checked) ~ .lieferung { display: none }
#abholung:not(:checked) ~ .abholung { display: none }
</style>

<title>Spende anbieten</title>
</head>
<body>
	
	
	<%@page import="datenbank.Datenbank"%>
	<%@page import="java.sql.*"%>
	<fieldset>
	<form id="regForm" method="GET" action="spende_erstellen_process.jsp">

			Bezeichnung <input type="text" name="bezeichnung" /> <br />
			Beschreibung: <input type="text" name="beschreibung" /> <br />
			Zustand: <input type="text" name="zustand" /> <br />
			Kategorie: <select name="kategorie">
				<%
					if (request.getParameter("anlauf") != null) {
						int id = Integer.parseInt(request.getParameter("anlauf"));
						ResultSet myRsK = Datenbank.holeKategorien(id);
						while (myRsK.next()) {
				%>
				<option><%=myRsK.getString("bezeichnung")%></option>
				<%
					}
					}
				%>

			</select> <br /> Menge: <input type="text" name="menge" /> <br /> Bild: <br />
			<input type="radio" name="lieferungabholung" id="lieferung" value="1" checked >
			Lieferung <input type="radio" name="lieferungabholung" id="abholung" value="2">
			Abholung <br /> 
			<!-- Bild: <input type="file" name="photo" size="50"/> -->
			Bild: <input type="file" name="photo" />
			
			<div class="lieferung">
				E-Mail: <input type="text" name="mail" /> <br />
				Telefon: <input type="text" name="telefon" /> <br />
				Name: <input type="text" name="name" /> <br />
				Vorname: <input type="text" name="vorname" /> <br />
			
			</div>
			
			<div class="abholung">
				Name: <input type="text" name="name" /> <br />
				Vorname: <input type="text" name="vorname" /> <br />
				Straße, Hausnummer: <input type="text" name="adresse" /> <br />
				Ort: <input type="text" name="ort" /> <br />
				PLZ: <input type="text" name="plz" /> <br />
				Land: <input type="text" name="land" /> <br />
			</div>
			<input type="checkbox" name="anonym"> Anonym
			<br/>
			<br/>
			<input type="submit" value="Spendenangebot senden" form="regForm" />
	</fieldset>
	</form id = "regForm">



</body>
</html>