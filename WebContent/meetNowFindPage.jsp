<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MeetNow 찾기</title>

<link rel="stylesheet" type="text/css" href="css/mypagenav-style.css">
<link rel="stylesheet" type="text/css" href="css/bottom-style.css">



<!-- Jquery CDN -->
<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>

<!-- BootStrap CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>



<style>
.meetnowlist {
	border: 1px solid black;
}

section {
	width: 60%;
}

aside {
	height: 400px;
	width: 40%;
	border: 1px solid black;
	width: 35%;
	top: 0px;
}

section, aside {
	display: inline-block;
}
</style>


</head>

<body>

	<nav>
		<%@ include file="include/nav/mypageNav.jsp"%>
	</nav>

	<header style="background-color: #b831d9; text-align: center;">

		<h2>Meetnow 찾기</h2>
		<h3>%%% 개의 모임이 근처에 있습니다!</h3>

	</header>


	<section class=well>
		<label>2018년 6월 23일 토요일</label>
		<ul>
			<li><div class="container meetnowlist">
					<div class=container id=when>
						<span> 7:00</span>

					</div>
					<div class=container id=meetnowinfo>
						<h4>축구</h4>
						<h2>서울 한강변에서 빔 켜고 축구보기</h2>
						<span>722 명 참석 예정</span>
					</div>
				</div></li>


			<li>

				<div class="container meetnowlist">
					<div class=container id=when>
						<span> 12:00</span>

					</div>
					<div class=container id=meetnowinfo>
						<h4>축구</h4>
						<h2>서울 한강변에서 빔 켜고 축구보기</h2>
						<span>722 명 참석 예정</span>
					</div>
			</li>


			<li>


				<div class="container meetnowlist">
					<div class=container id=when>
						<span> 14:00</span>

					</div>
					<div class=container id=meetnowinfo>
						<h4>축구</h4>
						<h2>서울 한강변에서 빔 켜고 축구보기</h2>
						<span>722 명 참석 예정</span>
					</div>
			</li>


		</ul>




	</section>

	<aside class=well></aside>

	<footer>
		<%@ include file="include/bottom.jsp"%>
	</footer>


</body>
</html>