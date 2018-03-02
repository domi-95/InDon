<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" type="text/css" href="style/indon.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Krisengebiet auswählen</title>
</head>
<jsp:include page="header_eingeloggt.jsp"></jsp:include>

<body bgcolor="#969EA8">

	<%@page import="datenbank.Datenbank"%>
	<%@page import="java.sql.*"%>
	<%@page import="benutzer.*"%>
	<%@page import="spende.*"%>
	<%@page import="java.util.*"%>
	<div class="login">
		<form method="post" action="mitarbeiter_dashboard.jsp" onchange="submit()">

			<h1>Willkommen bei InDon</h1>

			<select name="anlaufstelle"  class="boxspende">
				<option selected>Wählen Sie eine Anlaufstelle</option>
				<%
					Mitarbeiter m = (Mitarbeiter) session.getAttribute("objekt");

					LinkedList<Anlaufstelle> anlaufstellen = (LinkedList<Anlaufstelle>) Datenbank.holeAnlaufstelle(m.getId_ret());

					for (int i = 0; i < anlaufstellen.size(); i++) {
				%>
				<option value="<%=anlaufstellen.get(i).getId()%>"><%=anlaufstellen.get(i).getBezeichnunganlaufstelle()%></option>
				<%
					}
				%>
			</select>
		</form>
	</div>
</body>
</html>