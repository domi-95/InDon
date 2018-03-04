<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="style/indon.css" />
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
		Spende s = Datenbank.holeSpende(Integer.parseInt(request.getParameter("id")));
		session.setAttribute("spende", s);
	%>
	<h1 class="h1dash">Spendenangebot zuordnen</h1>
	<h1 class="h1dash">
		<%
			out.print(a.getBezeichnunganlaufstelle());
		%>
	</h1>

	<div class="don">
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
		%>




		<%
			if (s.getAbholung() != 0) {
				out.print("Die Spende wird abgeholt");
		%>
		<br /> <br />
		<%
			}

			if (s.getLieferung() != 0) {
				out.print("Die Spende wird geliefert");
		%>
		<br /> <br />
		<%
			}

			// out.print (s.getMhd()); //Ausgabe erst bei Kategorie Lebensmittel muss noch implementiert werden

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
		<%
			List<Interesse> interesse = Datenbank.holeInteresse(s.getId());
		%>



		<table>
			<form action="zuordnung_process.jsp" method=get>
				<thead>
					<tr>
						<th>Zuordnung</th>
						<th>Benutzername</th>
						<th>Name</th>
						<th>Vorname</th>
						<th>Priorität</th>

						<th>Anzahl Personen im Haushalt</th>
						<th>Anzahl der bereits erhaltenen Spenden</th>
						<th>Zeitstempel</th>
						<th>Restmenge</th>
						<th>Menge ausgeben</th>
					</tr>
				</thead>

				<%
					int[] dmenge = new int[s.getRestmenge()];

					for (int i = 0; i <= (dmenge.length - 1); i++) {
						dmenge[i] = i + 1;
					}
				%>

				<%
					for (Interesse i : interesse) {
						Benutzer b = (Benutzer) i.getBeduerftiger();
				%><tr>
					<%
						
					%><td><input type="radio" name="zuordnung"
						value="<%out.print(i.getBeduerftiger().getId());%>"></td>
					<%
						
					%><td>
						<%
							out.print(b.getBenutzername());
						%>
					</td>
					<%
						
					%><td>
						<%
							out.print(i.getBeduerftiger().getVorname());
						%>
					</td>
					<%
						
					%><td>
						<%
							out.print(i.getBeduerftiger().getNachname());
						%>
					</td>
					<%
						
					%><td>
						<%
							out.print(i.getPrio());
						%>
					</td>
					<%
						
					%><td>
						<%
							out.print(i.getBeduerftiger().getPersHaushalt());
						%>
					</td>
					<%
						
					%><td>
						<%
							out.print(i.getBeduerftiger().getErhalteneSpenden());
						%>
					</td>
					<%
						
					%><td>
						<%
							out.print(i.getTimestamp());
						%>
					</td>
					<%
						
					%><td>
						<%
							out.print(s.getRestmenge());
						%>
					</td>
					<%
						
					%><td><select name="erhalteneMenge">
							<%
								for (int j = 0; j <= (dmenge.length - 1); j++) {
							%><option value="<%=dmenge[j]%>"><%=dmenge[j]%></option>
							<%
								}
							%>
					</select></td>
					<%
						
					%>
				</tr>
				<%
					}
				%>
			
		</table>
		<br>
		<center>
			<input type="submit" name="ordne" value="Daten absenden"
				class="btnzu-send" />
		</center>
		</form>
	</div>


</body>
</html>