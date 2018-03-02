<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="style/indon.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<style>
#lieferung:not(:checked ) ~.lieferung {
	display: none
}

#abholung:not(:checked ) ~.abholung {
	display: none
}
</style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js">

</script>
<script>
$(document).ready(function(){
    $('#purpose').on('change', function() {
      if ( this.value === '1')
      {
        $("#business").show();
      }
      else
      {
        $("#business").hide();
      }
    });
});
</script>

<title>Spende anbieten</title>
</head>
<body>

	<jsp:include page="Header.jsp"></jsp:include>

	<%@page import="datenbank.Datenbank"%>
	<%@page import="spende.*"%>
	<%@page import="java.sql.*"%>
	<%@page import="java.util.*"%>
	<fieldset>
		<div class="createDon">
			<form id="regForm" method="post" action="Spende_erstellen_process"
				enctype="multipart/form-data">

				<%
					boolean lebensmittel = false;

					Anlaufstelle a = Datenbank.holAnlaufstelle(Integer.parseInt(request.getParameter("anlauf")));
				%>

				<h1>
					<%
						out.print(a.getBezeichnunganlaufstelle());
					%>
				</h1>
				<br /> <input type="text" size="" maxlength="20" name="bezeichnung"
					placeholder="Bezeichnung*" class="boxspende" /> <br />
				<br /> <input type="text" size="" maxlength="30"
					name="beschreibung" placeholder="Beschreibung*" class="boxspende" />
				<br />
				<br /> <select name="zustand" placeholder="Zustand*"
					class="boxspende">
					<option value="all" selected>Wählen Sie einen Zustand</option>
					<option value="all">Neu</option>
					<option value="all">Gebraucht</option>
					<option value="all">Keine Angabe</option>
				</select><br />
				<br /> <select name="kategorie" placeholder="Kategorie*"
					class="boxspende" id="purpose">
					<option value="0" selected>Wählen Sie eine Kategorie</option>
					<%
						if (request.getParameter("anlauf") != null) {
							session.setAttribute("anlauf", a);

							List<Kategorie> kategorie = a.getKategorien();
							for (Kategorie k : kategorie) {
					%>
					<option value="<%=k.getId()%>" ><%=k.getBezeichnung()%>
						<%
							if (k.isStark_gefragt()) {
										out.print("(stark gefragt)");
									}
						%>
					</option>
					<%
						}
						}
					%>

				</select> <br />
				<br />
				
				<div id="business" style="display: none">
					<input name="mhd" placeholder="MHD*" type="date" class="boxspende" />
				</div>
				
				<br /> <input type="number" maxlength="2" name="menge"
					placeholder="Menge*" class="boxspende" /> <br /> <br />

				<h4>Lieferung*:</h4>
				<input type="radio" name="lieferungabholung" id="lieferung"
					value="1" checked class="radiocheck"><br />
				<br />


				<h4>Abholung*:</h4>
				<input type="radio" name="lieferungabholung" id="abholung" value="2"
					class="radiocheck"><br /> <br />

				<h4>Bild:</h4>
				<input type="file" name="photo" size="50" class="boxspende" /><br />
				<br /> <input type="text" maxlength="20" name="name"
					placeholder="Name*" class="boxspende" /> <br />
				<br /> <input type="text" maxlength="20" name="vorname"
					placeholder="Vorname*" class="boxspende" /> <br />
				<br /> <input type="number" maxlength="20" name="telefon"
					placeholder="Telefon*" class="boxspende" /> <br />
				<br />

				<div class="lieferung">
					<input type="email" name="mail" placeholder="E-Mail*"
						class="boxspende" /> <br />
					<br />
				</div>

				<div class="abholung" class="radiocheck">
					<input type="text" name="adresse" placeholder="Straße, Hausnummer*" maxlength="40" class="boxspende" /> <br />
					<br /> <input type="text" maxlength="30" name="ort"
						placeholder="Ort*" class="boxspende" /> <br />
					<br /> <input type="number" maxlength="6" name="plz"
						placeholder="PLZ*" class="boxspende" /> <br />
					<br /> <input type="text" maxlength="15" name="land"
						placeholder="Land*" class="boxspende" /> <br />
					<br />
				</div>
				<h4>Anonym:</h4>
				<input type="checkbox" name="anonym" class="radiocheck"> <br />
				<br />
				<center>
					<input type="submit" value="Spendenangebot senden" class="btn-send" />
				</center>
			</form>
		</div>
	</fieldset>

</body>
</html>