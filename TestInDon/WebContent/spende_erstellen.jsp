<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

<style>


#lieferung:not(:checked) ~ .lieferung { display: none }
#abholung:not(:checked) ~ .abholung { display: none }
</style>

</head>
<body>
	<%@page import="datenbank.Datenbank"%>
	<%@page import="java.sql.*"%>
	
	<fieldset>
		<form id="regForm" method="GET" action="spende_erstellen_process.jsp" enctype="multipart/form-data">

			Bezeichnung <input type="text" name="bezeichnung" /> <br />
			Beschreibung: <input type="text" name="beschreibung" /> <br />
			Zustand: <input type="text" name="zustand" /> <br />
			Mindeshaltbarkeitsdatum: <input type="date" name="mhd" /> <br />
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

			</select> <br /> Menge: <input type="text" name="menge" /> <br /> 
			Bild: <input type="file" name="bild" value"" width="100" /><br />
			<input type="radio" name="lieferungabholung" id="lieferung" value="1" checked >
			Lieferung <input type="radio" name="lieferungabholung" id="abholung" value="2">
			Abholung <br /> 
			
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




</body>
</html>