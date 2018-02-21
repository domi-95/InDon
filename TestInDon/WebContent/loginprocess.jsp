<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Insert title here</title>
</head>

<body>

<jsp:include page="login.jsp"></jsp:include>
<%@page import="datenbank.*"%>  
<%@page import="benutzer.*"%>  
<div class="login">  

<h3>

<%  
 String benutzername = request.getParameter( "benutzername" );
 String passwort = request.getParameter( "passwort" );
 // out.print(benutzername + passwort);
	Benutzer b = LoginDao.validate(benutzername, passwort);
	
	if (b == null){
		out.print("Sorry, invalid Username or Password");		
		}
	session.setAttribute("objekt", b);
	
	if (b instanceof Mitarbeiter){
		response.sendRedirect("Anlaufstelle Dashboard.jsp");
		
	}
	
	if (b instanceof Beduerftiger){
		response.sendRedirect("beduerftigen_dashboard.jsp");
	}
	
	
%> 


</h3>

</div>


</body>

</html>