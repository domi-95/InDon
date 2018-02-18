<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Krisengebiet auswählen</title>
</head>
<body>
	<%@page import="datenbank.Datenbank"%>
	<%@page import="java.sql.*"%>

<form method="GET" action="spende_erstellen.jsp">
	<select name="anlauf" onchange="submit()">
				<option value="all" selected>Wählen Sie eine Anlaufstelle</option>
				<%
					ResultSet myRs = Datenbank.holeAnlaufstelle();
					while (myRs.next()) {
				%>
				<option value="<%=myRs.getString("id")%>"><%=myRs.getString("bezeichnung")%>
				</option>
				<%
					}
				%>
			</select>

</form>

</body>
</html>