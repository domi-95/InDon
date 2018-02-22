<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="style/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="style/indon.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Spende anbieten</title>
</head>
<body>
	
	
	<%@page import="datenbank.Datenbank"%>
	<%@page import="java.sql.*"%>
	<fieldset>

		<form id="regForm" method="GET" action="spende_erstellen.jsp">

		<form id="regForm" method="get" action="spende_erstellen_process.jsp" enctype="multipart/form-data">


			Bezeichnung: <input type="text" name="bezeichnung" /> <br />
			Beschreibung: <input type="text" name="beschreibung" /> <br />
			Zustand: <input type="text" name="zustand" /> <br /> 
			Anlaufstellen:<br />
			<select name="anlauf" onchange="submit()">
				<option value="all" selected>Kein Anlaufstelle ausgewählt.</option>
				<%
					ResultSet myRs = Datenbank.holAnlaufstelle();
					while (myRs.next()) {
				%>
				<option value="<%=myRs.getString("id")%>"><%=myRs.getString("bezeichnung")%>
				</option>
				<%
					}
				%>
			</select> <br /> 
			Kategorie: <br />
			<select name="kat">
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
			<div class="radiobutton">
				Lieferung <input type="radio" name="lieferung/abholung" checked> <br/>
				Abholung<input type="radio" name="lieferung/abholung">
				<br /> 
			</div>
			
			<input type="submit" value="Spendenangebot senden" form="regForm" onclick='this.form.action="spende_erstellen_process.jsp";' />
	</fieldset>



</body>
</html>