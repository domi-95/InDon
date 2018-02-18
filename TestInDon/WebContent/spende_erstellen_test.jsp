<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="datenbank.Datenbank"%>  
<%@page import="java.sql.*"%>  

<form action="spende_erstellen_test.jsp" method="GET"> 
 Anlaufstellen:	<select name="modelS" onChange="submit();">
<!--	 <option value="all" selected>Show All</option>
	 <option value="3 Dr">3 Dr</option>
	 <option value="5 Dr">5 Dr</option>
	 <option value="Cabriolet">Cabriolet</option> -->
	 
  
	<option value="all" selected>Wählen Sie eine Anlaufstelle</option>
<%  
ResultSet myRs = Datenbank.holeAnlaufstelle();
	while(myRs.next())	{ %>
	<option value="<%= myRs.getString("id")%>"><%= myRs.getString("bezeichnung")%> </option>
<% 
 } 
%>
</select>

Kategorie:  <select name="item2">
<%  
int id = Integer.parseInt(getParameter( "modelS" ));
ResultSet myRsK = Datenbank.holeKategorien();
	while(myRsK.next())	{ %>
	<option><%= myRsK.getString("bezeichnung")%></option>
<% 
 } 
%>
  </select>	<br />

</form>


</body>
</html>