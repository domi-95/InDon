<%@page import="datenbank.Datenbank"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mitarbeiter Dashboard</title>
</head>
<body>	 
<jsp:include page="header_eingeloggt.jsp"></jsp:include>

<%@page import="benutzer.*"%>  
<%@page import="spende.*"%>  

<%
  	Mitarbeiter m = (Mitarbeiter) session.getAttribute("objekt"); //Mitarbeiter Objekt 
  	Anlaufstelle a = Datenbank.holAnlaufstelle(m.getId_ret()); //Anlaufstellen Objekt
  	List<Spende> liste = Datenbank.holeSpenden(a.getId());
  	
  	
  	
  	session.setAttribute("anlaufstelle", a);
  	
  	out.print(m);
  	out.print (a.getBezeichnunganlaufstelle());

  	// mit der Methode datenbank.holeAnlaufstelle (int id_ret) bekommst du ein Anlaufstellen LISTE zur�ck in dem Anlaufsetllen Objekte drin sind zur�ck �ber getter bekommst du dann 
  	//die Bezeichnung mit der du das Dropdown ersetllen kannst. Die id_ret des Mitarbeiters bekommst du mit dem mitarbeiter objekt getter
  %>

<h2>Sie sind im Mitarbeiter Dashboard</h2>
</body>
</html>