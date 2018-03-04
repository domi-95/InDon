<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="header_eingeloggt.jsp"></jsp:include>
	<jsp:include page="navigationMA.jsp"></jsp:include>

	<%@page import="benutzer.*"%>
	<%@page import="spende.*"%>
	<%@page import="java.util.*"%>
	<%@page import="datenbank.Datenbank"%>

<% 
Anlaufstelle a = (Anlaufstelle) session.getAttribute("anlaufstelle");
		Spende s = Datenbank.holeSpende(Integer.parseInt(request.getParameter("einsehen")));
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
				%>Telefon: <%  out.print (s.getTelefon());
				%>Adresse: <% out.print (s.getAdresse());
				%>Adresse: <% out.print (s.getOrt());
				%>PLZ: <% out.print (s.getPlz());
		%>
		<br /> <br />
		<%
			}

			if (s.getLieferung() != 0) {
				out.print("Die Spende wird geliefert");
				%>Telefon: <%  out.print (s.getTelefon());
				%>Email: <% out.print (s.getEmail());
		%>
		<br /> <br />
		<%
			}
			
			if (s.getKategorie().getId() == 1){
			%>Name: <%  out.print (s.getMhd()); //Ausgabe erst bei Kategorie Lebensmittel muss noch implementiert werden
			}
			if (s.getAnonym() != 1) {
				out.print(s.getVorname() + " " + s.getName());
		%>
		<br /> <br />
		<%
			} else {
				out.print("Spender ist anonym");
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