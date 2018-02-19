<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mitarbeiter Dashboard</title>
</head>
<body>
<%@page import="benutzer.*"%>  

<%
 Mitarbeiter m = (Mitarbeiter)session.getAttribute("objekt");
 out.print (m);
 
 
 // mit der Methode datenbank.holeAnlaufstelle (int id_ret) bekommst du ein Anlaufstellen LISTE zurück in dem Anlaufsetllen Objekte drin sind zurück über getter bekommst du dann 
 //die Bezeichnung mit der du das Dropdown ersetllen kannst. Die id_ret des Mitarbeiters bekommst du mit dem mitarbeiter objekt getter
 




%>

<h2>Sie sind im Mitarbeiter Dashboard</h2>
</body>
</html>