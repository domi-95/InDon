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
	<div>
		<form action="loginprocess.jsp" method="post">
			<img src="C:\Users\gaert\Desktop\InDOn\indon.png" alt="InDon">
	</div>
	<br />
	<br /> Benutzername
	<br />
	<br />
	<input type="text" name="benutzername" />
	<br />
	<br /> Password
	<br />
	<br />
	<input type="password" name="password" />
	<br />
	<br />
	<input type="submit" value="login" />
	<jsp:include page="index.jsp"></jsp:include>

	</form>

</body>
</html>