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

if (request.getParameter(" ")!= null ) {
	int abholung = Integer.parseInt(request.getParameter(""));// gib eine 1 oder nichts zurück
}

if (request.getParameter(" ")!= null ) {
	int lieferung = Integer.parseInt(request.getParameter(""));// gib eine 1 oder nichts zurück
}

String bild_url = request.getParameter("");
String mhd = request.getParameter( ""); //irgendwie in Date Parsen oder in String speichern

if (request.getParameter(" ")!= null ){
	int anonym = Integer.parseInt(request.getParameter(""));  // gib eine 1 oder nichts zurück
}

 //alle Felder die optional sind und eventuell kein Wert zurückgeben weil das Inputfeld nicht gefüllt ist musst noch eine Verzweigung mit if .. =! null einfügen

String vorname = request.getParameter(""); 
String name = request.getParameter(""); 
String adresse = request.getParameter(""); 
int plz = Integer.parseInt(request.getParameter(""));
String ort = request.getParameter(""); 
int ret_id = Integer.parseInt(request.getParameter(""));
int kat_id = Integer.parseInt(request.getParameter(""));

%>


<h3>Vielen Dank, dass sie gespendet haben!</h3>
</div>

</body>
</html>