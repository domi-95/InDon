<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="benutzer.*"%>  
<%@page import="spende.*"%>  
<%@page import="java.util.*"%>  
<%@page import="datenbank.Datenbank"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<!-- Diese Spendenanzeige brauch folgende Sessions:
	"objekt" : Für die Zuordnung des Benutzers
	"anlaufstelle" Für die Zuordnung welche Spenden ausgegeben werden
	"value" Inhalt was in den Buttons stehen sollen pro Spenden


 -->

 	
		
		
<%
	Benutzer b = (Benutzer) session.getAttribute("objekt"); //Mitarbeiter Objekt 
  	// Anlaufstelle a = (Anlaufstelle)session.getAttribute("anlaufstelle"); //Anlaufstellen Objekt
  	Anlaufstelle a = (Anlaufstelle)session.getAttribute("anlaufstelle");
  	List<Spende> liste = Datenbank.holeSpenden(a.getId());
  	//session.setAttribute("anlaufstelle", a);
  	
  	%><h3><% out.print (a.getBezeichnunganlaufstelle()); %></h3>
  	
  	<div class="mid">
  	<div class="mid2">
  	<%
  	for(Spende s: liste){
  	%>
  	
  	<div class="polaroid">	
  	<form  action ="<%out.print(session.getAttribute("weiterleitung")); %>" method = "post" class="spendan"> 
  		
	<img src="DisplayImageServlet?id=<%=s.getId()%>" height="200" width="100%"/>
	<div class="container">
	<div class="spendtext">
  	Spendennummer: <% out.print (s.getId()); %> <br/> 
  	Bezeichnung: <% out.print (s.getBezeichnung_spende()); %> <br/> 
   	Beschreibung: <% out.print (s.getBeschreibung());%> <br/> 
   	Zustand: <%out.print (s.getZustand());%> <br/> <%
   	
   	
   	
   	if (s.getAbholung() != 0){
		out.print ("Die Spende wird abgeholt");  %> <br/> <% 		
   	}
   	
  	if (s.getLieferung() != 0){
		out.print ("Die Spende wird geliefert");   	%> <br/> <%	
   	}
  	
  	// out.print (s.getMhd()); //Ausgabe erst bei Kategorie Lebensmittel muss noch implementiert werden

  	if (s.getAnonym() != 1){
  		%>Spender: <%out.print(s.getVorname() + " " + s.getName());%> <br/> <%
  		
  	}
  	else {
  		%> Spender: <%out.print ("anonym");%> <br/> <%
  		}%> <br/> 
  	
  	
 <% 	
  	if (b instanceof Beduerftiger){						//nur wenn man als Beduerftiger angemeldet ist
  	  %>
  	  Wähle eine Priorität<select name = "prio">		
  		<option value = "1">1   </option>
  		<option value = "2">2   </option>
  		<option value = "3">3   </option>
  		</select>
  	  <%
  	}
  %> </div>	
	<center class="interesseb">
  	 	<input type ="submit" name = "interesse" value = "<%out.print(session.getAttribute("inhalt"));%>" >	</center>
  		<input type = "hidden" name = "id" value = "<%out.print(s.getId());%>">
  		
  	</div>
  	</form>
  	
  	</div>
  	
  		<%
  		
  	}
	%>
	</div>
	</div>
  	
  	

	
	
</body>
</html>