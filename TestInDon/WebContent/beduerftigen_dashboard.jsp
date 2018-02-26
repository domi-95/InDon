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
<jsp:include page="header_eingeloggt.jsp"></jsp:include>
<h2>Sie sind im Beduerftigen Dashboard</h2>

<%
 Benutzer b = (Benutzer)session.getAttribute("objekt");
 Beduerftiger bd = (Beduerftiger)b;
//out.print (bd);
 
	 session.setAttribute("inhalt", "Interesse bekunden");
	 session.setAttribute("weiterleitung", "dashboard_process.jsp");
	 session.setAttribute("anlaufstelle", bd.getAnlaufstelle());
%>

<jsp:include page="spenden_anzeigen_anlaufstelle.jsp"></jsp:include> 


<%





%>
</body>
</html>