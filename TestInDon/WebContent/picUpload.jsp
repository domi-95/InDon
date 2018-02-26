<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>File Upload:</h3>
      Select a file to upload: <br />
      <form>
  <p>Geben Sie Ihre Zahlungsweise an:</p>
  <fieldset>
    <input type="radio" id="mc" name="Zahlmethode" value="Mastercard">
    <label for="mc"> Mastercard</label> 
    <input type="radio" id="vi" name="Zahlmethode" value="Visa">
    <label for="vi"> Visa</label>
    <input type="radio" id="ae" name="Zahlmethode" value="AmericanExpress">
    <label for="ae"> American Express</label> 
  </fieldset>
</form>

<form action="test.php" method="post">
 
<p>Unterkunft:<br>
<input type="radio" name="uk" value="EZ BR" checked> EZ Frühstück<br>
<input type="radio" name="uk" value="DZ BR"> DZ Frühstück<br>
<input type="radio" name="uk" value="EZ HP"> EZ Halbpension<br>
<input type="radio" name="uk" value="DZ HP"> DZ Halbpension<br>
<input type="radio" name="uk" value="EZ VP"> EZ Vollpension<br>
<input type="radio" name="uk" value="DZ VP"> DZ Vollpension
</p>
 
<p>Optionen:<br>
<input type="checkbox" name="opt[]" value="parken"> Parkplatz<br>
<input type="checkbox" name="opt[]" value="internet"> Internet<br>
<input type="checkbox" name="opt[]" value="sauna"> Sauna<br>
<input type="checkbox" name="opt[]" value="vegkost"> Vegetarisch<br>
<input type="checkbox" name="opt[]" value="raucher"> Raucher<br>
</p>
 
<p>Interner Vermerk:<br>
<input type="checkbox" name="tourist"> Tourist<br>
</p>
 
<input type="submit" value="senden">
 
</form>

</body>
</html>