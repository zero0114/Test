<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>S_M_D</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="<c:url value='/vendor/bootstrap/css/bootstrap.min.css'/>">

<!-- Custom fonts for this template -->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/vendor/fontawesome-free/css/all.min.css'/>">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Kaushan+Script'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700'
	rel='stylesheet' type='text/css'>

<!-- Custom styles for this template -->
<link rel="stylesheet" href="<c:url value='/css/agency.min.css'/>">

<!-- Bootstrap core JavaScript -->
<script src="<c:url value='/vendor/jquery/jquery.min.js'/>"></script>
<script
	src="<c:url value='/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>


<!-- Plugin JavaScript -->
<script
	src="<c:url value='/vendor/jquery-easing/jquery.easing.min.js'/>"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>

<!-- Contact form JavaScript -->
<script src="<c:url value='/js/jqBootstrapValidation.js'/>"></script>

</head>

<body id="page-top">

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top"
		id="mainNav">
		<div class="container">
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive">
				MENU <i class="fas fa-bars"></i>
			</button>

			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav text-uppercase ml-auto">
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="/">HOME</a></li>

					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="<c:url value='/board/list'/>">BOARD</a></li>
					<c:if test="${empty login}">
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
							data-toggle="modal" data-target="#log-in">LOGIN</a></li>
					</c:if>
					
					<c:if test="${not empty login}">
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
							data-toggle="modal" data-target="#mypage-in">MYPAGE</a></li>
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
							href="/user/logout" onclick="return confirm('로그아웃 하겠습니까?')">LOGOUT</a>
						</li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>
	<br>
	<br>
	<br>

	<!-- Header -->
	<header class="masthead">
		<div class="intro-text"></div>
	</header>

	<%@ include file="../users/login_modal.jsp"%>
	<%@ include file="../users/mypage_modal.jsp"%>