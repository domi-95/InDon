<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>test</title>

<style>



#show:not(:checked) ~ .test { display: none }
#show:not(:checked) ~ h1 { display: none }
#lieferung:not(:checked) ~ .lieferung { display: none }
#abholung:not(:checked) ~ .abholung { display: none }
</style>

</head>
<body>

<input type="radio" name = "show" id="show" /> <label for="show">Show</label>
<input type="radio" name = "show" id="noshow" /> <label for="show">NO</label>

<input type="radio" name="lieferung/abholung" id="lieferung" checked>
Lieferung <input type="radio" name="lieferung/abholung" id="abholung">
Abholung <br /> 

<h1>Why use jQuery when you can use CSS?</h1>
<aside>Checkbox is the correct UI element for this, BTW.</aside>


<div class="lieferung">
				Test Lieferung
			
			</div>
			
<div class="abholung">
				Test Abholung
			</div>

</body>
</html>