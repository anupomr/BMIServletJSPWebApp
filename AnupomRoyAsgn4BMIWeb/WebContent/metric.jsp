<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BMI calculator</title>

</head>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<body>

	<h1>Anupom Roy's BMI calculator</h1>
	<font color="red">${ requestScope.errMsg }</font>
	<form action="${pageContext.request.contextPath}/bmi" method="post">
		<c:choose>
			<c:when test='${sessionScope.unit=="metric"}'>
				<c:set var="height" scope="session" value="meters" />
				<c:set var="weight" scope="session" value="kelograms" />
				<c:set var="unit" scope="session" value="metric" />
			</c:when>
			<c:when test='${sessionScope.unit=="imperial"}'>
				<c:remove var="height" scope="session" />
				<c:remove var="weight" scope="session" />
				<c:remove var="unit" scope="session" />
				<c:set var="height" scope="session" value="inches" />
				<c:set var="weight" scope="session" value="pounds" />
				<c:set var="unit" scope="session" value="American" />
			</c:when>
		</c:choose>
		<p>
			Please select your values in
			<c:out value="${unit }" />
			standard units.
		</p>
		<p>
			Height in
			<c:out value="${height }" />
			:<input name="height" type="text">
		</p>
		<p>
			Weight in
			<c:out value="${weight}" />
			:<input name="weight" type="text">
		</p>

		<input type="submit" value="Calculate BMI">
	</form>
</body>
</html>