<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>InDon</title>
</head>
<body>
	<jsp:include page="Header.jsp"></jsp:include>
	
	<h1>Willkommen bei InDon</h1>
<jsp:include page="spende_erstellen.jsp"></jsp:include>
<!--  <a href="login.jsp"WebContent/WEB-INF/index.jsp>login</a> -->
	
<a href="login.jsp">login</a>|  
<a href="logout.jsp">logout</a>|  
<a href="profile.jsp">profile</a> 
</html>