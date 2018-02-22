<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="style/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="style/indon.css" />

<!--  <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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

			
			

			<p class="formnames"></p>
			<div class="form-input">


			<input type="text" name="benutzername"
			placeholder ="Enter Username" >
			</div>
			<br />
			<br /> 
			
			<div class= "form-input2">
			<input type="password" name="passwort" 
			placeholder ="Enter Password">
			</div>
			<br />
			<br />
			<input type="submit" name= "submit" value="Login" class="btn-login" />
			</form>
		</div>
	</div>

</body>
</html>