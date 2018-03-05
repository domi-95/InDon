<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="header_eingeloggt.jsp"></jsp:include>
	<%
	Benutzer b = (Benutzer) session.getAttribute("objekt");

				if (b instanceof Mitarbeiter) {%>
	<jsp:include page="navigationMA.jsp"></jsp:include><%
}%>
	<%@page import="benutzer.*"%>
	<%@page import="spende.*"%>
	<%@page import="java.util.*"%>
	<%@page import="datenbank.Datenbank"%>

<% 
Anlaufstelle a = (Anlaufstelle) session.getAttribute("anlaufstelle");
		Spende s = Datenbank.holeSpende(Integer.parseInt(request.getParameter("id")));
		session.setAttribute("spende", s);
%>

<h1 class="h1dash">Spende einsehen</h1>
	<h1 class="h1dash">
		<%
			out.print(s.getBezeichnung_spende());
		%>
	</h1>


<div class="don">
	<jsp:include page="spende_anzeige.jsp"></jsp:include>
	</div>	

</body>
</html>