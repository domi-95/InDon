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


<%
	Mitarbeiter m = (Mitarbeiter) session.getAttribute("objekt"); //Mitarbeiter Objekt 
  	// Anlaufstelle a = (Anlaufstelle)session.getAttribute("anlaufstelle"); //Anlaufstellen Objekt
  	Anlaufstelle a = (Anlaufstelle)session.getAttribute("anlaufstelle");
  	List<Spende> liste = Datenbank.holeSpenden(a.getId());
  	//session.setAttribute("anlaufstelle", a);
  	
  	%><h1><% out.print (a.getBezeichnunganlaufstelle()); %></h1><%
  	
  	
  	for(Spende s: liste){
  	%><form  action ="<%out.print(session.getAttribute("weiterleitung")); %>" method = "post"><%
  		%> 	<fieldset>	<%
  	
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
  	
  	
  	%> 	<input type ="submit" name = "interesse" value = "<%out.print(session.getAttribute("inhalt"));%>">		
  		<input type = "hidden" name = "id" value = "<%out.print(s.getId());%>">
  		 </fieldset>	
  		  </form><%
  }
  	
  	%>
</body>
</html>