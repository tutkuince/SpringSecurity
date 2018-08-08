<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
body {
	background: #eee !important;
	width: 50%;
	height: auto;
	margin: 0 auto;
}

.wrapper {
	margin-top: 80px;
	margin-bottom: 80px;
}

.form-signin {
	max-width: 380px;
	padding: 15px 35px 45px;
	margin: 0 auto;
	background-color: #fff;
	border: 1px solid rgba(0, 0, 0, 0.1);
}

.
form-signin-heading, .checkbox {
	margin-bottom: 30px;
}

.checkbox {
	font-weight: normal;
}

.form-control {
	position: relative;
	font-size: 16px;
	height: auto;
	padding: 10px;
	@
	include
	box-sizing(border-box);
	&:
	focus
	{
	z-index
	:
	2;
}

}
input[type="text"] {
	margin-bottom: -1px;
	border-bottom-left-radius: 0;
	border-bottom-right-radius: 0;
}

input[type="password"] {
	margin-bottom: 20px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}
}
</style>

</head>
<body>
	<div class="wrapper">

		<!-- 
			With <form> tag: Token was not sent
			Spring MVC form:form does this automagically but we did not use form:form
		 -->

		<!-- 
		 	Manually adding tokens;
		 	
		 	<input type="hidden"
		 		   name="${_csrf.parameterName}"
		 		   value="${_csrf.token}" />
		 
		  -->

		<form:form
			action="${pageContext.request.contextPath }/authenticateTheUser"
			method="POST" class="form-signin">

			<h2 class="form-signin-heading">Sign In</h2>
			<!-- Check for login error -->

			<c:if test="${param.error != null }">
				<div class="alert alert-danger col-xs-offset-1 col-xs-10">
					Invalid username and password</div>
			</c:if>

			<!-- Check for logout -->
			<c:if test="${param.logout != null }">
				<div class="alert alert-danger col-xs-offset-1 col-xs-10">You
					have been logged out.</div>
			</c:if>

			<input type="text" class="form-control" name="username"
				placeholder="Username" />
			<input type="password" class="form-control" name="password"
				placeholder="Password" />
			<button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>

		</form:form>
	</div>
</body>
</html>