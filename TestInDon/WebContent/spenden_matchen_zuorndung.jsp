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
  	
  	
  	
  	%>
  	</fieldset>
  	
	  <table>

		<tr>
		<td>Benutzername</td>
		<td>Name</td>
		<td>Vorname</td>
		<td>Priorit�t</td>
		<td>Zeitstempel</td>
		<td>Anzahl Personen im Haushalt</td>
		<td>Anzahl der bereits erhaltenen Spenden</td>
		</tr>
		<% 
		List<Interesse>interesse = Datenbank.holeInteresse(s.getId());

		for(Interesse i : interesse) {
		%><td><%out.print ("muss noch implementiert werden");	%></td><%
		%><td><%out.print (i.getBeduerftiger().getVorname());	%></td><%
		%><td><%out.print (i.getBeduerftiger().getNachname());	%></td><%
		%><td><%out.print ("muss noch implementiert werden");	%></td><%
		%><td><%out.print (i.getTimestamp());	%></td><%
		%><td><%out.print (i.getBeduerftiger().getPersHaushalt());	%></td><%
		%><td><%out.print ("muss noch implementiert werden");	%></td><%
		}
		
		%>
		
		

	</table>

</body>
</html>