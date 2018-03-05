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

	<img src="DisplayImageServlet?id=<%=s.getId()%>" class="donImg" height="200px"/>
		<table>
		<tr>
		<td>Bezeichnung :
		<%
 	out.print(s.getBezeichnung_spende());
 %></td></tr>
		<tr><td> Beschreibung:
		<%
 	out.print(s.getBeschreibung());
 %></td></tr>
		 <tr><td>Zustand :
		<%
 	out.print(s.getZustand());
 %></td></tr>
	
		<%
			if (s.getKategorie().getId() == 1) {
		%>
		<tr><td>MHD :
		<%
			out.print(s.getMhd());
		%></td></tr>
		<br /> <br />
		<%
			}
			if (s.getAbholung() != 0) { %><tr><td><%
				out.print("Die Spende wird abgeholt");
				%></td></tr><tr><td>
				Telefon: <%  out.print (s.getTelefon());
				%></td></tr><tr><td>
				Adresse: <% out.print (s.getAdresse());
				%> </td></tr><tr><td>
				Ort: <% out.print (s.getOrt());
				%></td></tr><tr><td>
				PLZ: <% out.print (s.getPlz());
		%></td></tr>
		
		<%
			}

			if (s.getLieferung() != 0) { %><tr><td><%
				out.print("Die Spende wird geliefert");
				%></td></tr><tr><td>
				Telefon: <%  out.print (s.getTelefon());
				%></td></tr><tr><td>
				Email: <% out.print (s.getEmail());
		%></td></tr>
		
		<%
			}
			
			if (s.getAnonym() == 0) {%><tr><td><%
				%>
				Name: <% 	out.print(s.getVorname() + " " + s.getName());
		%>
		</td></tr>
		<%
			} else {
				%><tr><td><%	out.print("Spender ist anonym");
		%>
		</td></tr>
		<%
			}
		%><tr><td>
		Menge gesamt:
		<%
			out.print(s.getMenge());
		%>
		</td></tr>
	</table>
</body>
</html>