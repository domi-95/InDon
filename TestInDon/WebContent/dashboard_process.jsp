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
	<%
	
		Benutzer b = (Benutzer) session.getAttribute("objekt");
	
		if (Datenbank.speichereInteresse((b.getId()), Integer.parseInt(request.getParameter("id"))))
		{
			out.print("Vielen Danke, ihr Interesse wurde efolgreich bekundet"); //ggf. noch mit Click-Dummy Text abgleichen
		}
		
		else {
			out.print ("Sie haben schonmal das Interesse an dieser Spende bekundet!"); //ggf. noch zurück button um wieder zum dashboard zu kommen
		}
	%>
</body>
</html>