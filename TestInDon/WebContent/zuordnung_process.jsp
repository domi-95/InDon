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
	<%@page import="benutzer.*"%>
	<%@page import="datenbank.*"%>
	<%@page import="spende.*"%>
	<%@page import="java.sql.*"%>
	<%@page import="java.util.Date"%>
	<div class="login"><h3><%
	
		Spende s = (Spende)session.getAttribute("spende");
		
		
	
		if (Datenbank.speichereZuordnung(s, Integer.parseInt(request.getParameter("zuordnung")), Integer.parseInt(request.getParameter(""))))
		{
			out.print("Vielen Dank, für das zuordnen der Spende " +s.getBezeichnung_spende()+" mit der ID "+s.getId()+"an den Beduerftigen mit der ID "+request.getParameter("zuordnung")+""); 
		}
		
		else {
			out.print ("Es ist ein Fehler aufgetreten, bitte versuchen Sie es später nochmal!");
			}
	%></h3></div>
</body>
</html>