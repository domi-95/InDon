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
	//Mitarbeiter m = (Mitarbeiter) session.getAttribute("objekt"); //Mitarbeiter Objekt 
  	// Anlaufstelle a = (Anlaufstelle)session.getAttribute("anlaufstelle"); //Anlaufstellen Objekt
  	Anlaufstelle a = (Anlaufstelle)session.getAttribute("anlaufstelle");
  	List<Spende> liste = Datenbank.holeSpenden(a.getId());
  	//session.setAttribute("anlaufstelle", a);
  	

  	
  	
  	%><h3><% out.print (a.getBezeichnunganlaufstelle()); %></h3><%
 	
  	
  	for(Spende s: liste){
  	%><form  action ="<%out.print(session.getAttribute("weiterleitung")); %>" method = "post"><%
  		%> 	
  

  <% 
  /* 	byte[] imgData = null;
	Blob image = null;
	try {
		image = s.getBild();
		imgData = image.getBytes(1, (int) image.length());
		
		// gibt das Bild aus
		response.setContentType("image/gif");
		OutputStream o = response.getOutputStream();
		o.write(imgData);
		o.flush();
		o.close();
	} catch (Exception e) {
		out.println("Unable To Display image");
		out.println("Image Display Error=" + e.getMessage());
		return;
	} */
  
	%> 
  
  
  	Spendennummer:<% out.print (s.getId()); %> <br/> <%
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
  	}%>
  	
  	
  	
  	 	<input type ="submit" name = "interesse" value = "<%out.print(session.getAttribute("inhalt"));%>">		
  		<input type = "hidden" name = "id" value = "<%out.print(s.getId());%>">
  		
  		  </form><%
  }
  	
  	%>
</body>
</html>