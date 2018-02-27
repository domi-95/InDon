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
	<%@page import="benutzer.*"%>
	<%@page import="datenbank.*"%>
	<%@page import="spende.*"%>
	<%@page import="java.sql.*"%>
	<%@page import="java.util.Date"%>
	<jsp:include page="header_eingeloggt.jsp"></jsp:include>
	
	<div class="login"><h4>
	
	<% Benutzer b = (Benutzer) session.getAttribute("objekt");
		
		if (b instanceof Mitarbeiter ){
			Datenbank.setSpendeNV(Integer.parseInt(request.getParameter("id")));
			out.print ("Vielen Dank, die Spende wurde für die Rettungsorganisation angefordert..");
		}
		
		else {
			
		
		
	  	Date date = new Date();
	   	String time = new Timestamp(date.getTime()).toString();
	
		if (Datenbank.speichereInteresse((b.getId()), Integer.parseInt(request.getParameter("id")), Integer.parseInt(request.getParameter("prio")), time))
		{
			out.print("Vielen Dank, ihr Interesse wurde efolgreich bekundet"); //ggf. noch mit Click-Dummy Text abgleichen
		}
		
		else {
			out.print ("Sie haben schonmal  Interesse an dieser Spende bekundet!"); //ggf. noch zurück button um wieder zum dashboard zu kommen
		}
		}
	%>
	</h4></div>
</body>
</html>