<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="style/indon.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header_eingeloggt.jsp"></jsp:include>
	<jsp:include page="navigationMA.jsp"></jsp:include>
	<%@page import="benutzer.*"%>
	<%@page import="datenbank.*"%>
	<%@page import="spende.*"%>
	<%@page import="java.sql.*"%>
	<%@page import="java.util.Date"%>
	<div class="login">
		<h3 class="h3message">
			<%
				Spende s = (Spende) session.getAttribute("spende");

				if (Datenbank.speichereZuordnung(s, Integer.parseInt(request.getParameter("zuordnung")),
						Integer.parseInt(request.getParameter("erhalteneMenge")))) {
					out.print("Vielen Dank, für das zuordnen der Spende " + s.getBezeichnung_spende() + " mit der ID "
							+ s.getId() + " an den Beduerftigen mit der ID " + request.getParameter("zuordnung")
							+ " mit der Menge " + request.getParameter("erhalteneMenge") + " ");
				}

				else {
					out.print("Es ist ein Fehler aufgetreten, bitte versuchen Sie es später nochmal!");
				}
			%>
		</h3>
	</div>
</body>
</html>