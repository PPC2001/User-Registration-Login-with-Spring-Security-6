<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet">
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark">
		<div class="text-center w-100">
			<h2 class="text-white">Welcome to Policy Management System</h2>
		</div>
	</nav>
	<br />
	<br />
	<br />
	<div class="container">
		<div class="row col-md-8 offset-md-2">
			<div class="card">
				<div class="card-header">
					<h2 class="text-center">Registration</h2>
				</div>
				<div class="card-body">
					<form:form modelAttribute="userVO" id="userVO">
						<div class="form-group mb-3">
							<label class="form-label">Username</label>
							<form:input path="userName" class="form-control" id="userName"
								placeholder="Enter Username" />
							<div class="has-error" id="usernameError">
								<form:errors path="userName" />
							</div>
						</div>
						<div class="form-group mb-3">
							<label class="form-label">Mobile No</label>
							<form:input path="mobileNo" class="form-control" id="mobileNo"
								placeholder="Enter Mobile no" maxlength="10" />
							<div class="has-error" id="mobileNoError">
								<form:errors path="mobileNo" />
							</div>
						</div>
						<div class="form-group mb-3">
							<label class="form-label">Email</label>
							<form:input path="email" class="form-control" id="email"
								placeholder="Enter email address" />
							<div class="has-error" id="emailError">
								<form:errors path="email" />
							</div>
						</div>
						<div class="form-group mb-3">
							<label class="form-label">Password</label>
							<form:password path="password" class="form-control" id="password"
								placeholder="Enter password" />
							<div class="has-error" id="passwordError">
								<form:errors path="password" />
							</div>
						</div>
						<div class="text-center">
							<!-- keep the button type to button only, not submit -->
							<button class="btn btn-primary" type="button"
								onclick="return registerUser();">Register</button>
							<br> <br> <span>Already registered? <a
								href="/api/login">Login here</a></span>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/register.js"></script>
</body>
</html>