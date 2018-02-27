<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<fieldset>	
<%@page import="benutzer.*"%>  
<%@page import="spende.*"%>  
<%@page import="java.util.*"%>  
<%@page import="datenbank.Datenbank"%>

<%

Anlaufstelle a = (Anlaufstelle)session.getAttribute("anlaufstelle");
Spende s = Datenbank.holeSpende(Integer.parseInt(request.getParameter("id")));
session.setAttribute("spende", s);


%><h1><% out.print (a.getBezeichnunganlaufstelle()); %></h1><%
  	
  	out.print (s.getBezeichnung_spende()); %> <br/> <%
   	out.print (s.getBeschreibung());%> <br/> <%
   	out.print (s.getZustand());%> <br/> <%
   	
   	if (s.getAbholung() != 0){
		out.print ("Die Spende wird abgeholt");  %> <br/> <% 		
   	}
   	
  	if (s.getLieferung() != 0){
		out.print ("Die Spende wird geliefert");   	%> <br/> <%	
   	}
  	
  	// out.print (s.getMhd()); //Ausgabe erst bei Kategorie Lebensmittel muss noch implementiert werden

  	if (s.getAnonym() != 1){
  		out.print(s.getVorname() + " " + s.getName());%> <br/> <%
  		
  	}
  	else {
  		out.print ("Spende ist anonym");%> <br/> <%
  	}
  	
  	
  	List<Interesse>interesse = Datenbank.holeInteresse(s.getId());
  	%>
  	</fieldset>
  	
	  <table >
		<thead>
		<tr>
		<th>Zuordnung</th>
		<th>Benutzername</th>
		<th>Name</th>
		<th>Vorname</th>
		<th>Priorität</th>
		<th>Zeitstempel</th>
		<th>Anzahl Personen im Haushalt</th>
		<th>Anzahl der bereits erhaltenen Spenden</th>
		</tr>
		</thead>
		<%
		
		
	%><form action = "zuordnung_process.jsp" method = get>
	<table><%
	
		for(Interesse i : interesse) {
			
		%><tr><%	
		%><td><input type = "radio" name = "zuordnung" value = "<%out.print (i.getBeduerftiger().getId());%>"></td><%
		%><td><%out.print ("muss noch implementiert werden");	%></td><%
		%><td><%out.print (i.getBeduerftiger().getVorname());	%></td><%
		%><td><%out.print (i.getBeduerftiger().getNachname());	%></td><%
		%><td><%out.print ("muss noch implementiert werden");	%></td><%
		%><td><%out.print (i.getTimestamp());	%></td><%
		%><td><%out.print (i.getBeduerftiger().getPersHaushalt());	%></td><%
		%><td><%out.print ("muss noch implementiert werden");	%></td><%
		%></tr><%
		}
		%> 
		<input type = "submit" name = "ordne">
	
	</table>
	</form>


</body>
</html>