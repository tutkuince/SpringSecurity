<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Inc Company Home Page</title>
</head>
<body>
	<h2>Company Home Page</h2>
	<hr />

	Welcome to the Inc company home page!

	<hr />

	<!-- Display user name and role -->
	User:
	<security:authentication property="principal.username" />
	<br />
	<br /> Role(s):
	<security:authentication property="principal.authorities" />

	<hr />

	<!-- Hiding information for invalid users with (security:authorize) -->
	<security:authorize access="hasRole('MANAGER')">
		<!-- Add a link to point to leaders . .  this is for the manager -->
		<p>
			<a href="${pageContext.request.contextPath }/leaders">LeaderShip
				Meeting</a> (Only for Manager peeps)
		</p>
	</security:authorize>

	<!-- Hiding information for invalid users with (security:authorize) -->
	<security:authorize access="hasRole('ADMIN')">
		<!-- Add a link to point to systems . .  this is for the admins -->
		<p>
			<a href="${pageContext.request.contextPath }/systems">IT Systems
				Meeting</a> (Only for Admin peeps)
		</p>
	</security:authorize>


	<!-- Add a logout button -->
	<form:form action="${pageContext.request.contextPath}/logout"
		method="POST">

		<input type="submit" value="Logout" />

	</form:form>
</body>
</html>