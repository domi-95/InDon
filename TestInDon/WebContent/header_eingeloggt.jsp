<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="style/indon.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>IHeader</title>
</head>
<body>


	<div class="navbar">
		<div class="navbar-inner">
			<a href="index.jsp" class="brand"> <%@page import="benutzer.*"%>
				<img src="Images\logo.png" width="210" height="55" alt="InDon" /> <!-- This is website logo -->
			</a>

			<div class="nav">
				<div class="elements">
					<a class="buser" href="">
						<%
								Benutzer b = (Benutzer)session.getAttribute("objekt");%> <%
								if (b instanceof Mitarbeiter){
									Mitarbeiter m =(Mitarbeiter)b;
									%>
						<%out.print(m.getName()+" "+m.getVorname()); %> |
						<%out.print(m.getBezeichnung()); %>
						<%
								}
								%> 
								<% if (b instanceof Beduerftiger){
									Beduerftiger bed = (Beduerftiger)b;
									%>
						<%out.print(bed.getNachname()+" "+bed.getVorname()); %>
						<%
								}
								%>
					</a> 
					<a class="logout" href="index.jsp">Logout</a>
				</div>
			</div>
			<!-- End main navigation -->
		</div>
	</div>



</body>
</html>