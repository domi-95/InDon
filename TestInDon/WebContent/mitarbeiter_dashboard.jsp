<%@page import="datenbank.Datenbank"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mitarbeiter Dashboard</title>
</head>
<body>	 
<jsp:include page="header_eingeloggt.jsp"></jsp:include>

<%@page import="benutzer.*"%>  
<%@page import="spende.*"%>  
<%@page import="java.util.*"%>  

<%
	
  	Mitarbeiter m = (Mitarbeiter) session.getAttribute("objekt"); //Mitarbeiter Objekt 
  	Anlaufstelle a = Datenbank.holAnlaufstelle(m.getId_ret()); //Anlaufstellen Objekt
  	session.setAttribute("anlaufstelle", a);
  	
  	
  	List<Spende> liste = Datenbank.holeSpenden(a.getId());
  	
  	%><form action="dashboard_process.jsp" method="post"><% 
  	for (int i = 0; i<liste.size(); i++){
  		
  		 %><fieldset> <%
  		out.print (liste.get(i).getId());
  		out.print(liste.get(i).getName()); %><br/> <%
  		out.print(liste.get(i).getBezeichnung_spende()); %><br/> <%
  		out.print(liste.get(i).getZustand()); %><br/> <%
  		if (liste.get(i).getAbholung() == 1){
  			out.print("Die Spende muss abgeholt werden");%><br/> <%
  		}
  		if (liste.get(i).getLieferung() == 1){
  			out.print ("Die Spende wird geliefert vom Spender");%><br/> <%
  		}
  		
  		if( liste.get(i).getAnonym() != 1){
  			out.print(liste.get(i).getVorname()+ " "+ liste.get(i).getName()); %><br/> <%
  		}
  		out.print ("----------------------------------------------------"); %><br/> <%
  		%><input type="submit" name= "submit" value="Interesse bekunden"  /><br/> 
  				<input type="hidden" name="id" value="<%out.print (liste.get(i).getId()); %>"><%
  		 %></fieldset> <%
  	}%>
  	
  	</form>
  
  	<% // rechts oben z.B. in der Leiste soll der Name vom Mitarbeiter stehen, diese holst du mit dem Objekt mitarbeiter m und seinen gettern
  	// genauso könnt ihr mit den gettern von der Spende aus alle Daten holen%>
  	

  

<h2>Sie sind im Mitarbeiter Dashboard</h2>
</body>
</html>