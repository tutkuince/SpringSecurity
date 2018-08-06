<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>

</head>
<body>
	<div class="auth">
		<div class="auth__header">
			<div class="auth__logo">
				<img height="90"
					src="https://d2eip9sf3oo6c2.cloudfront.net/series/square_covers/000/000/083/full/EGH_VueJS_Final.png"
					alt="">
			</div>
		</div>
		<div class="auth__body">
			<form:form
				action="${pageContext.request.contextPath }/authenticateTheUser"
				method="POST" class="auth__form">
				<div class="auth__form_body">
					<h3 class="auth__form_title">Sign in</h3>
					<div>
						<div class="form-group">
							<label class="text-uppercase small">Username</label> <input
								type="text" class="form-control" placeholder="Enter username">
						</div>
						<div class="form-group">
							<label class="text-uppercase small">Password</label> <input
								type="password" class="form-control" placeholder="Password">
						</div>
					</div>

					<!-- Check for login error -->
					<c:if test="${param.error != null }">
						<p style="color: red;">Sorry! You entered invalid username or
							password.</p>
					</c:if>

				</div>
				<div class="auth__form_actions">
					<input class="btn btn-primary btn-lg btn-block" type="submit"
						value="Login" />
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>