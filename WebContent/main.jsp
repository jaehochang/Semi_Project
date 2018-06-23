<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Page</title>



<link rel="stylesheet" type="text/css" href="css/mypagenav-style.css">
<link rel="stylesheet" type="text/css" href="css/bottom-style.css">
<link rel="stylesheet" type="text/css"
	href="css/mypage-section-style.css">


<!--  Jquery CDN  -->
<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>


<!-- fontawesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
	integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
	crossorigin="anonymous">

<!-- Jquery CDN -->
<script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>


<!-- BootStrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>

	<nav>
		<%@ include file="include/nav/mypageNav.jsp"%>
	</nav>




	<div class="jumbotron" style="background-color: #b548d0">
		<div class="container">

			<video src="./video/MeetNow.mp4" autoplay="autoplay" loop="loop"
				width="100%" height="100%">
				<h1 id="" style="color: white;">무엇을 좋아하시나요?</h1>
				<p style="color: white;">MeetNow로 한 걸음 더 나아가기</p>
				<p>
					<a class="btn btn-primary btn-lg" href="#" role="button">가입하기&raquo;</a>
				</p>
			</video>
		</div>
	</div>

	<div class="container" style="display: inline;">
		<!-- Example row of columns -->
		<div class=row>
			<div class="col-md-4"">
				<h2>Heading1</h2>
			</div>
			<div class="col-md-4">
				<h2>Heading2</h2>
			</div>
			<div class="col-md-4">
				<h2>Heading3</h2>
			</div>
		</div>
		</div>


<!-- footer -->

		<footer>
			<%@ include file="include/bottom.jsp"%>

		</footer>

</body>
</html>