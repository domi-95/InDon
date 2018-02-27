
<%@page import="datenbank.Datenbank"%>
<%@page import="datenbank.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


	<%@ page import="java.sql.*"%>
	<%@page import="spende.*"%>
	<%@page import="java.util.*"%>
	<%@ page import="java.io.*"%>

	 <%/*
	List<Spende> spende = Datenbank.holeSpenden(1);
	Spende spendee = Datenbank.holeSpende(2);
	
	byte[] imgData = null;
	Blob image = null;
	try {
		image = spendee.getBild();
		imgData = image.getBytes(1, (int) image.length());
		
		// gibt das Bild aus
		response.setContentType("image/gif");
		OutputStream o = response.getOutputStream();
		o.write(imgData);
		o.flush();
		o.close();
	} catch (Exception e) {
		out.println("Unable To Display image");
		out.println("Image Display Error=" + e.getMessage());
		return;
	}*/
	
	Anlaufstelle a = (Anlaufstelle)session.getAttribute("anlaufstelle");
  	List<Spende> liste = Datenbank.holeSpenden(1);
  	
  	for(Spende s: liste){
  		byte[] imgData = null;
		Blob image = null;
  		
  		
  		try {
  			image = s.getBild();
  			imgData = image.getBytes(1, (int) image.length());
  			
  			// gibt das Bild aus
  			response.setContentType("image/gif");
  			OutputStream o = response.getOutputStream();
  			o.write(imgData);
  			o.flush();
  			o.close();
  		} catch (Exception e) {
  			out.println("Unable To Display image");
  			out.println("Image Display Error=" + e.getMessage());
  			return;
  		} 
  		%><h1>Test</h1><%
  	}
	
	%> 
	
	
	


</body>
</html>