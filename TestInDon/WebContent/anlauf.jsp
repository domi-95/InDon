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
	<%@page import="spende.*"%>
	<%@page import="java.sql.*"%>
	<%@page import="java.util.*"%>

<form method="post" action="spende_erstellen.jsp">
	<select name="anlauf" onchange="submit()" class="boxspende">
				<option value="all" selected>Wählen Sie eine Anlaufstelle</option>
				<%
				LinkedList<Anlaufstelle> anlaufstellen =(LinkedList<Anlaufstelle>) Datenbank.holeAnlaufstelle();
				
				for(int i = 0;  i<anlaufstellen.size(); i++){
					%>
					<option value="<%=anlaufstellen.get(i).getId()%>"><%=anlaufstellen.get(i).getBezeichnunganlaufstelle()%>
					</option>
					<%
				}
				%>
				
			</select>

</form>

</body>
</html>