<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@page import="benutzer.*"%>
	<%@page import="spende.*"%>
	<%@page import="java.util.*"%>
	<%@page import="datenbank.Datenbank"%>
	<%@ page import="java.sql.*"%>
	<%@ page import="java.io.*"%>

	<!-- Diese Spendenanzeige brauch folgende Sessions:
	"objekt" : F�r die Zuordnung des Benutzers
	"anlaufstelle" F�r die Zuordnung welche Spenden ausgegeben werden
	"value" Inhalt was in den Buttons stehen sollen pro Spenden


 -->

	<%
		Benutzer b = (Benutzer) session.getAttribute("objekt"); //Mitarbeiter Objekt 
		// Anlaufstelle a = (Anlaufstelle)session.getAttribute("anlaufstelle"); //Anlaufstellen Objekt
		Anlaufstelle a = (Anlaufstelle) session.getAttribute("anlaufstelle");
		List<Spende> liste = new LinkedList<Spende>();
		String wo = (String) session.getAttribute("wo");

		if (wo.equals("matchen")) {
			liste = Datenbank.holeSpendenMInteressen(a.getId());
		} else {
			liste = Datenbank.holeSpenden(a.getId());
		}

		//session.setAttribute("anlaufstelle", a);
	%><h3>
		<%
			out.print(a.getBezeichnunganlaufstelle());
		%>
	</h3>

	<div class="mid">
		<div class="mid2">
			<%
				for (Spende s : liste) {
			%>

			<div class="polaroid">
				<form
					action="<%out.print(session.getAttribute("weiterleitung"));%>"
					method="post" class="spendan">

					<img src="DisplayImageServlet?id=<%=s.getId()%>" height="200px"
						width="100%" />
					<div class="container">
						<div class="spendtext">
							<br />
							<table class="spendetable">
								<tr>
									<td>SpendenNr:</td>
									<td>
										<%
											out.print(s.getId());
										%>
									
									<td />
								</tr>
								<tr>
									<td>Bezeichnung:</td>
									<td>
										<%
											out.print(s.getBezeichnung_spende());
										%>
									</td>
								</tr>
								<tr>
									<td height="40px">Beschreibung:</td>
									<td height="40px">
										<%
											out.print(s.getBeschreibung());
										%>
									</td>
								</tr>
								<tr>
									<td>Zustand:</td>
									<td>
										<%
											out.print(s.getZustand());
										%>
									</td>
								</tr>


								<tr>
									<td>
										<%
											if (s.getAnonym() != 1) {
										%>Spender:
									</td>
									<td>
										<%
											out.print(s.getVorname() + " " + s.getName());
										%>
									</td>
									<td>
										<%
											} else {
										%> Spender:
									</td>
									<td>
										<%
											out.print("anonym");
										%>
									</td>
								</tr>
								<%
									}
								%>

								<tr>
									<td colspan="2" class="tdcenter">
										<%
											if (s.getAbholung() != 0) {
													out.print("Die Spende wird abgeholt");
										%>
									</td>
								</tr>
								<tr>
									<td colspan="2" class="tdcenter">
										<%
											}
										%> <%
 			if (s.getLieferung() != 0) {
 			out.print("Die Spende wird geliefert");
 %>
									</td>
								</tr>
								<%
									//out.print (s.getMhd()); //Ausgabe erst bei spenden_matchen_zuordnung
										}
								%>
								<tr>
									<td>Restmenge:</td>
									<td>
										<%
											out.print(s.getRestmenge());
										%>
									</td>
								</tr>


								<tr>
									<td colspan="2" class="tdcenter">
										<%
											if (b instanceof Beduerftiger) { //nur wenn man als Beduerftiger angemeldet ist
										%>W�hle eine Priorit�t: <select name="prio">
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
									</select> <%
  	}
  	else{%> <br /> <%	}
  %>
									</td>
								</tr>
							</table>
							<br /> <br />
						</div>

						<input type="submit" name="interesse"
							value="<%out.print(session.getAttribute("inhalt"));%>">
						<input type="hidden" name="id" value="<%out.print(s.getId());%>">

					</div>
				</form>

			</div>

			<%
  		
  	}
	%>
		</div>
	</div>





</body>
</html>