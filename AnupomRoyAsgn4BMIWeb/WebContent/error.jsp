<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Error !!!</title>
</head>
<body>
	<h1>Anupom Roy's BMI calculation cannot process</h1>
	<p>The cause in an input error : ${ requestScope.exception}</p>
	<a href="${pageContext.request.contextPath}">Start Over</a>
</body>
</html>