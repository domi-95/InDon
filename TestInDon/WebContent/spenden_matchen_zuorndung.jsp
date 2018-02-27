<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="style/indon.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header_eingeloggt.jsp"></jsp:include>
<jsp:include page="navigationMA.jsp"></jsp:include>

<%@page import="benutzer.*"%>  
<%@page import="spende.*"%>  
<%@page import="java.util.*"%>  
<%@page import="datenbank.Datenbank"%>

<%

Anlaufstelle a = (Anlaufstelle)session.getAttribute("anlaufstelle");
Spende s = Datenbank.holeSpende(Integer.parseInt(request.getParameter("id")));
session.setAttribute("spende", s);
%>

<h1><% out.print (a.getBezeichnunganlaufstelle()); %></h1>

<div class="don">
  	Bezeichnung : <% out.print(s.getBezeichnung_spende()); %> <br/> 
  	Beschreibung: <%out.print (s.getBeschreibung());%> <br/> 
  	Zustand     : <%out.print (s.getZustand());%> <br/> 
  	
  	<img src="DisplayImageServlet?id=<%=s.getId()%>" />
  	<%   
  	
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
  		out.print ("Spender ist anonym");%> <br/> <%
  	}
  	
  	
  	List<Interesse>interesse = Datenbank.holeInteresse(s.getId());
  	%>
</div>	
  	
  	
	  <table>
	  <form action = "zuordnung_process.jsp" method = get>
		<thead>
		<tr>
		<th>Zuordnung</th>
		<th>Benutzername</th>
		<th>Name</th>
		<th>Vorname</th>
		<th>Prioritšt</th>
		
		<th>Anzahl Personen im Haushalt</th>
		<th>Anzahl der bereits erhaltenen Spenden</th>
		<th>Zeitstempel</th>
		</tr>
		</thead>

		<%
	
		for(Interesse i : interesse) {
			Benutzer b = (Benutzer)i.getBeduerftiger();
		%><tr><%	
		%><td><input type = "radio" name = "zuordnung" value = "<%out.print (i.getBeduerftiger().getId());%>"></td><%
		%><td><%out.print (b.getBenutzername());	%></td><%
		%><td><%out.print (i.getBeduerftiger().getVorname());	%></td><%
		%><td><%out.print (i.getBeduerftiger().getNachname());	%></td><%
		%><td><%out.print (i.getPrio());	%></td><%
		
		%><td><%out.print (i.getBeduerftiger().getPersHaushalt());	%></td><%
		%><td><%out.print ("muss noch implementiert werden");	%></td><%
		%><td><%out.print (i.getTimestamp());	%></td><%
		%></tr><%
		}
		%> 
		
	</table>
	<br>
	<center>
	<input type="submit" name= "ordne" value="Daten absenden" class="btn-send" />
	</center>
	</form>
	


</body>
</html>