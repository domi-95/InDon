<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="style/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="style/indon.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Success</title>
</head>
<body>
<jsp:include page="Header.jsp"></jsp:include>
<div class="login">
<%
String beschreibung = request.getParameter("");
String bezeichnung = request.getParameter("");
String zustand = request.getParameter("");
// boolean Abholung = request.getParameter(""); NOCH TESTN WIE FORM EIN RADIOBUTTON ZURÜCKGIBT
String bild_url = request.getParameter("");
// DATE STRING FRAGE mhd
 // boolean anonym = request.getParameter(""); NOCH TEST WIE FROM RADIOBUTTON MITGIBT
String vorname = request.getParameter(""); 
String name = request.getParameter(""); 
String adresse = request.getParameter(""); 
int plz = Integer.parseInt(request.getParameter(""));
String ort = request.getParameter(""); 
int ak_id = Integer.parseInt(request.getParameter(""));




%>


<h3>Vielen Dank, dass sie gespendet haben!</h3>
</div>

</body>
</html>