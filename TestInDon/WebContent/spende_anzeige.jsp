<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@page import="benutzer.*"%>
	<%@page import="spende.*"%>
	<%@page import="java.util.*"%>
	<%@page import="datenbank.Datenbank"%>

<% 
Anlaufstelle a = (Anlaufstelle) session.getAttribute("anlaufstelle");
		Spende s = Datenbank.holeSpende(Integer.parseInt(request.getParameter("id")));
		session.setAttribute("spende", s);
%>

	<img src="DisplayImageServlet?id=<%=s.getId()%>" class="donImg" /> <br />
		Bezeichnung :
		<%
 	out.print(s.getBezeichnung_spende());
 %>
		<br /> <br /> Beschreibung:
		<%
 	out.print(s.getBeschreibung());
 %>
		<br /> <br /> Zustand :
		<%
 	out.print(s.getZustand());
 %>
		<br /> <br />
		<%
			if (s.getKategorie().getId() == 1) {
		%>
		MHD :
		<%
			out.print(s.getMhd());
		%>
		<br /> <br />
		<%
			}
			if (s.getAbholung() != 0) {
				out.print("Die Spende wird abgeholt");
				%><br/> <br/>
				Telefon: <%  out.print (s.getTelefon());
				%><br/> <br/>
				Adresse: <% out.print (s.getAdresse());
				%> <br/> <br/>
				Ort: <% out.print (s.getOrt());
				%><br/> <br/>
				PLZ: <% out.print (s.getPlz());
		%>
		<br /> <br />
		<%
			}

			if (s.getLieferung() != 0) {
				out.print("Die Spende wird geliefert");
				%><br/> <br/>
				Telefon: <%  out.print (s.getTelefon());
				%><br/> <br/>
				Email: <% out.print (s.getEmail());
		%>
		
		<%
			}
			
			if (s.getAnonym() == 0) {
				%><br/> <br/>
				Name: <% 	out.print(s.getVorname() + " " + s.getName());
		%>
		<br /> <br />
		<%
			} else {
				%><br/> <br/>	<%	out.print("Spender ist anonym");
		%>
		<br /> <br />
		<%
			}
		%>
		Menge gesamt:
		<%
			out.print(s.getMenge());
		%>
		<br /> <br />
	

</body>
</html>