<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="datenbank.Datenbank"%>  
<%@page import="java.sql.*"%>  
<fieldset>

<form action="spenden_erstellen_process.jsp" >
Bezeichnung  <input type="text" name="bezeichnung" />	<br />
Beschreibung:  <input type="text" name="beschreibung" />	<br />
Zustand:  <input type="text" name="zustand" />	<br />

 <!-- Also Domi mit der Methode Datenbank.holeAnlaufstelle() bekommst du ein Resultset mit dem alle Anlaufstellen sind.
 Wenn jetzt eine Anlaufstelle gewählt wird soll die Seite erneut aufgerufen werden und über die POST Methode musst du der Methode
 Datenbank.holeKategorien (int ID_DER_ANLAUFSTELLE) mitgeben welche Anlaufstelle im Dropdown gewählt wurde. Im Dropdown sollen jedoch nur
 die Bezeichnungen stehen. Die Methode Datenbank.holeKategorien gibt dir dann ein Resultset mit allen korrospondierden Kategorien zu der
 gewählten Anlaufstelle aus. Musst dir noch ein paar Testdaten in PHPMYADMIN machen Anlaufstelle und Kategorie hat eine m:n Beziehung 
 die Kompositionstabelle ist anlaufstelle_kategorie die musst du mit pflegen. Außerdem musst du zusätzlich im ResulSet das du zurück bekommst
 für die Kategorien prüfen ob die Spalte "stark_gefragt" eine 1 hat dann muss das im Dropdown gekennzeichnet werden (ist aber zweitrangig nur nice to have)
 mit dem ResultSet kannst du die Bezeichnung mit Resultsetobjekt.getString("k.bezeichnung") und stark gefragt mit ("ak.stark_gefragt") holen. 
 
 Nächste Steps wären:
 - Bild hinzufügen und schauen wie wir das in die DB bekommen
 - Methode in DB Klasse implementieren um die Spende in der DB zu speichern
 - spenden_erstellen_process anpassen-->

Anlaufstellen:  <select name="item">
<%  
ResultSet myRs = Datenbank.holeAnlaufstelle();
	while(myRs.next())	{ %>
	<option><%= myRs.getString("bezeichnung")%></option>
<% 
 } 
%>
  </select>	<br />
Menge:  <input type="text" name="menge" />	<br />
Bild: 									<br />
<input type="radio" name="lieferung/abholung" checked> Lieferung        
<input type="radio" name="lieferung/abholung"> Abholung <br/>


<input type="submit" value="Spendenangebot senden">
</fieldset>
</form>
</body>
</html>