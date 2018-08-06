<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h3>Login Page</h3>
	<form:form
		action="${pageContext.request.contextPath }/authenticateTheUser"
		method="POST">

		<!-- Check for login error -->
		<c:if test="${param.error != null }">
			<p style="color: red;">
				Sorry! You entered invalid username or password.
			</p>
		</c:if>

		<table>
			<tr>
				<td>Username</td>
				<td><input type="text" name="username" /></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="password" /></td>
			</tr>
			<tr>
				<td></td>
				<td><input style="width: 100%;" type="submit" value="Login" /></td>
			</tr>
		</table>

	</form:form>

</body>
</html>