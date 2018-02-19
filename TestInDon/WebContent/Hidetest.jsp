<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>test</title>

<style>

input[type="radio"]:not(:checked) ~ .p { display: none }

<!-- #show:not(:checked) ~ p { display: none }
#show:not(:checked) ~ h1 { display: none }-->
</style>

</head>
<body>

<div>
<input type="radio" id="show"  /> <label for="show">Show</label>
<input type="radio" id="show" /> <label for="show">Show</label>
</div>
<p>Why use jQuery when you can use CSS?</p>
<aside>Checkbox is the correct UI element for this, BTW.</aside>

<input type="radio" id="show" /> <label for="show">Show</label>
<h1>Why use jQuery when you can use CSS?</1>
<aside>Checkbox is the correct UI element for this, BTW.</aside>

		<input type="radio" name="lieferung/abholung" checked>
Lieferung <input type="radio" name="lieferung/abholung">
Abholung <br /> 


</body>
</html>