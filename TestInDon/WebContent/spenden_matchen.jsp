<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header_eingeloggt.jsp"></jsp:include>
	<jsp:include page="navigationMA.jsp"></jsp:include>
	<%
		session.setAttribute("inhalt", "Spende zuordnen");
		session.setAttribute("wo", "matchen");
	%>
	<%
		session.setAttribute("weiterleitung", "spenden_matchen_zuorndung.jsp");
	%>
	<h3>Spendenangebote zuordnen</h3>
	<jsp:include page="spenden_anzeigen_anlaufstelle.jsp"></jsp:include>

</body>
</html>