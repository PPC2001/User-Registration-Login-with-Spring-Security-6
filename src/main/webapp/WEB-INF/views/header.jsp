<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<style>
* {
	margin: 0%;
	padding: 0%;
	box-sizing: border-box;
}

body {
	font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI',
		Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue',
		sans-serif;
}

.menu-bar {
	background: #1766b2;
	text-align: center;
	position: fixed;
	top: 80px;
	left: 0;
	right: 0;
	z-index: 1000;
	height: 60px;
	/* Set the height to 80 pixels */
}

.menu-bar ul {
	display: inline-flex;
	list-style-type: none;
	color: #f8f9fa;
}

.menu-bar ul li {
	max-width: 300px;
	/* white-space: nowrap; */
	/* overflow: hidden; */
	/* text-overflow: ellipsis; */
	margin: 15px;
	padding: 1px;
}

.menu-bar ul li a {
	text-decoration: none;
	color: #f8f9fa;
}

.active, .menu-bar ul li:hover {
	border-radius: 3px;
}

.sub-menu-1 {
	display: none;
}

.menu-bar ul li:hover .sub-menu-1 {
	display: block;
	position: absolute;
	background: #1766b2;
	margin-top: 0px;
	margin-left: -1px;
}

.menu-bar ul li:hover .sub-menu-1 ul {
	display: block;
	margin: 5px;
}

.menu-bar ul li:hover .sub-menu-1 ul li {
	width: 150px;
	padding: 10px;
	border-bottom: 1px dotted #fff;
	background: transparent;
	border-radius: 0;
	text-align: left;
}

.menu-bar ul li:hover .sub-menu-1 ul li:last-child {
	border-bottom: none;
}

.menu-bar ul li:hover .sub-menu-1 ul li a:hover {
	color: wheat;
}

.fa-angle-right {
	float: right;
}

.sub-menu-2 {
	display: none;
}

.hover-me:hover .sub-menu-2 {
	display: block;
	position: absolute;
	margin-top: -72px;
	margin-left: 160px;
	background-color: #1766b2;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div class="header">
		<div
			class="container d-flex justify-content-end align-items-center p-2">
			<div class="mr-auto">
				<span>Welcome, ${userVO.userName} </span>
			</div>
			<a href="/api/login" class="btn btn-danger">Logout</a>
		</div>
	</div>
	<div class="menu-bar">
		<ul>
			<li class="active"><a href="#"><i class="fa fa-home"
					aria-hidden="true"></i> Home</a></li>
			<li><a href="#">Application and Underwriting</a>
				<div class="sub-menu-1">
					<ul>
						<li class="hover-me"><a href="">Application Submission</a><i
							class="fa fa-angle-right" aria-hidden="true"></i>
							<div class="sub-menu-2">
								<ul>
									<li><a href="">sub-menu-2-1</a></li>
									<li><a href="">sub-menu-2-2 </a></li>
								</ul>
							</div></li>
						<li class="hover-me"><a href="">Underwriting Process</a><i
							class="fa fa-angle-right" aria-hidden="true"></i>
							<div class="sub-menu-2">
								<ul>
									<li><a href="">sub-menu-2-1</a></li>
									<li><a href="">sub-menu-2-2 </a></li>
								</ul>
							</div></li>
					</ul>
				</div></li>
			<li><a href="#"> Policy Issuance and Delivery</a>
				<div class="sub-menu-1">
					<ul>
						<li class="hover-me"><a href="">Policy Approval</a><i
							class="fa fa-angle-right" aria-hidden="true"></i>
							<div class="sub-menu-2">
								<ul>
									<li><a href="">sub-menu-2-1</a></li>
									<li><a href="">sub-menu-2-2 </a></li>
								</ul>
							</div></li>
						<li><a href="">Policy Document Delivery </a></li>
					</ul>
				</div></li>
			<li><a href="#"> Policy Inforce</a>
				<div class="sub-menu-1">
					<ul>
						<li><a href="">Premium Payments</a></li>
						<li><a href="">Continuous Coverage</a></li>
					</ul>
				</div></li>
			<li><a href="#"> Policyholder Updates</a>
				<div class="sub-menu-1">
					<ul>
						<li class="hover-me"><a href="">Beneficiary and Rider
								Changes </a><i class="fa fa-angle-right" aria-hidden="true"></i>
							<div class="sub-menu-2">
								<ul>
									<li><a href="">sub-menu-2-1</a></li>
									<li><a href="">sub-menu-2-2 </a></li>
								</ul>
							</div></li>
					</ul>
				</div></li>
			<li><a href="#"> Claims and Maturity</a>
				<div class="sub-menu-1">
					<ul>
						<li><a href="">Death Claims</a></li>
						<li><a href="">Maturity Claims</a></li>
					</ul>
				</div></li>
			<li><a href="#"> Policy Adjustments</a>
				<div class="sub-menu-1">
					<ul>
						<li><a href="">Changes, Loans, and Surrenders</a></li>
					</ul>
				</div></li>
			<li><a href="#"> Renewal and Conversion</a>
				<div class="sub-menu-1">
					<ul>
						<li><a href="">Policy Renewal</a></li>
						<li><a href="">Term Policy Conversion</a></li>
					</ul>
				</div></li>
		</ul>
	</div>



</body>
</html>