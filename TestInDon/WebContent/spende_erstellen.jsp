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
	<jsp:include page="Header.jsp"></jsp:include>
	
	<%@page import="datenbank.Datenbank"%>
	<%@page import="spende.*"%>
	<%@page import="java.sql.*"%>
	<%@page import="java.util.*"%>
	<fieldset>
	<form id="regForm" method="post" action="Spende_erstellen_process" enctype="multipart/form-data">
	
			<%
			
			
			boolean lebensmittel = false;
			
			
			Anlaufstelle a = Datenbank.holAnlaufstelle(Integer.parseInt(request.getParameter("anlauf")));
			%>
			
			<h1><%out.print(a.getBezeichnunganlaufstelle()); %></h1><br />

			Bezeichnung*: <input type="text" name="bezeichnung" /> <br /><br />
			Beschreibung*: <input type="text" name="beschreibung" /> <br /><br />
			Zustand*: <input type="text" name="zustand" /> <br /><br />
			Kategorie*: <select name="kategorie">
			<option value="all" selected>Wählen Sie eine Kategorie</option>
				<%
					if (request.getParameter("anlauf") != null) {
						session.setAttribute("anlauf", a);
						
						List<Kategorie> kategorie = a.getKategorien();
						for (Kategorie k : kategorie) {
							if(k.getId() == 1){
								lebensmittel = true;
							}
				%>
				<option value = "<%=k.getId()%>"><%=k.getBezeichnung()%> <%if(k.isStark_gefragt()){out.print("(stark gefragt)");}%></option>
				<%
					}
					}
				%>

			</select> <br /><br />
			<% if(lebensmittel){ %>
			MHD*: <input type="text" name="mhd" /> <br />
			<%} %>
			<br /> 
			Menge: <input type="text" name="menge" /> <br /> <br />
			
			Lieferung*:<br/>
			<input type="radio" name="lieferungabholung" id="lieferung" value="1" checked >
			
			
			Abholung*:<br/>
			<input type="radio" name="lieferungabholung" id="abholung" value="2">
			 <br /> 
			
			Bild: <input type="file" name="photo" size="50"/>
			
			Name*: <input type="text" name="name" /> <br /><br />
			Vorname*: <input type="text" name="vorname" /> <br /><br />
			
			<div class="lieferung">
				E-Mail*: <input type="text" name="mail" /> <br /><br />
				Telefon: <input type="text" name="telefon" /> <br /><br />
				
			
			</div>
			
			<div class="abholung">
				Straße, Hausnummer*: <input type="text" name="adresse" /> <br /><br />
				Ort*: <input type="text" name="ort" /> <br /><br />
				PLZ*: <input type="text" name="plz" /> <br /><br />
				Land*: <input type="text" name="land" /> <br /><br />
			</div>
			Anonym:
			<input type="checkbox" name="anonym"> 
			<br/>
			<br/>
			<input type="submit" value="Spendenangebot senden"/>
			</form>
	</fieldset>




</body>
</html>