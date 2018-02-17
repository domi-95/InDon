<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="indon.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
	<jsp:include page="Header.jsp"></jsp:include>
	<div class="login">
		<h1>Anmelden</h1>
		<div class="formarea">
			<form action="loginprocess.jsp" method="post">
			<br />
			<br /> 
			<p class="formnames">Benutzername</p>

			<input type="text" name="benutzername" />
			<br />
			<br /> 
			<br/>
			<p class="formnames">Passwort</p>

			<input type="password" name="passwort" />
			<br />
			<br />
			
			<input type="submit" value="login" />
			</form>
		</div>
	</div>

</body>
</html>