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
	<%@page import="datenbank.*"%>
	<%@page import="spende.*"%>
	<%@page import="java.sql.*"%>
	<%@page import="java.util.Date"%>
	<%
	
		Spende s = (Spende)session.getAttribute("spende");
		
		
	
		if (Datenbank.speichereZuordnung(s.getId(), Integer.parseInt(request.getParameter("zuordnung"))))
		{
			out.print("Vielen Dank, für das zu ordnen der Spende " +s.getBezeichnung_spende()+" an den Beduerftigen mit der ID "+request.getParameter("zuordnung")+""); 
		}
		
		else {
			out.print ("Es ist ein Fehler aufgetreten, bitte versuchen Sie es später nochmal!");
			}
	%>
</body>
</html>