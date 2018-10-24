<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Calculated BMI</title>
</head>
<body>
	<h1>
		Anupom calculates a BMI of:
		<fmt:formatNumber type="number" maxFractionDigits="1"> 
	${requestScope.urBMI}
	</fmt:formatNumber>
	</h1>
	<p>
		For a person with <b>height ${requestScope.hight}
			${sessionScope.height}</b> and <b>weight ${requestScope.weight} </b>${sessionScope.weight}.
	</p>
	<h3>What does my BMI value mean?</h3>
	<p>${requestScope.description}</p>

	<a
		href="${pageContext.request.contextPath}/bmi?unit=${sessionScope.unit}">Try
		again</a>(same unit) or
	<a href="${pageContext.request.contextPath}">Start Over</a> to change
	units.
</body>
</html>