<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1"><meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sample BMI Calculator JPS page</title>
</head>

 
<body>
<h1>Anupom Roy's Body Mass Index calculator</h1>
<p>Please select the unites  you would like to work with
</p>

<form action="${pageContext.request.contextPath}/bmi" method="get">
Pound and Inches  <input name="unit" type="submit" value="imperial">
<p>
Kilograms and Meters <input name="unit" type="submit" value="metric">
</p>
</form>
</body>
</html>