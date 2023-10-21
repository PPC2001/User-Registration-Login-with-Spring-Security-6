<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet">
<title>Insert title here</title>

<style>
#errMsg {
	color: red;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark">
		<div class="text-center w-100">
			<h2 class="text-white">Welcome to Policy Management System</h2>
		</div>
	</nav>
	<br />
	<br />
	<div class="container mt-5">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-header">
						<h2 class="text-center">LOGIN</h2>
					</div>
					<div class="text-center">
						<h3 id="errMsg">${userVO.errMessage}</h3>
					</div>
					<div class="card-body">
						<form:form method="post" action="/api/login"
							modelAttribute="userVO" class="form-horizontal" id="userVO">
							<div class="form-group mb-3">
								<label class="control-label">Username</label>
								<form:input path="userName" class="form-control" id="userName"
									placeholder="Enter Username" />
								<div class="has-error" id="usernameError">
									<form:errors path="userName" />
								</div>
							</div>
							<div class="form-group mb-3">
								<label class="control-label"> Password</label>
								<form:password path="password" class="form-control"
									id="password" placeholder="Enter password" />
								<div class="has-error" id="passwordError">
									<form:errors path="password" />
								</div>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary"
									onclick="return validateUser();">Submit</button>
								<br> <br> <span> Not registered ? <a
									href="/api/register">Register/Signup here</a>
								</span>
							</div>
						</form:form>
					</div>
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
		src="${pageContext.request.contextPath}/resources/js/login.js"></script>
</body>
</html>