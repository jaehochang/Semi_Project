<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>

<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="./resources/docs/favicon.ico">
<link rel="stylesheet" type="text/css" href="css/mypagenav-style.css">
<link rel="stylesheet" type="text/css" href="css/bottom-style.css">

<link rel="stylesheet" type="text/css" href="css/main-card-style.css">
<link rel="stylesheet" type="text/css" href="css/main-calender-style.css">
<link rel="stylesheet" type="text/css" href="css/main-carousel-style.css">

<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>



<title>meet now</title>


<link href="./resources/docs/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="./resources/docs/examples/jumbotron/jumbotron.css" rel="stylesheet">
<script src="./resources/docs/assets/js/ie-emulation-modes-warning.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">


<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- fontawesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
	integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
	crossorigin="anonymous">



</head>
<script>
	$(document).ready(function() {

		$("#login").click(function() {
			$(location).attr("href", "LoginController.co");

		});
		$("#logout").click(function() {

			$(location).attr("href", "LogoutController.co");
		});
		
		$('#media').carousel({
		    pause: true,
		    interval: false,
		  });

	});
</script>



<body>
	<header>
		<%@ include file="include/nav/mypageNav.jsp"%>
	</header>

	<div class="jumbotron" style="background-color: #b548d0">
		<div class="container">

			<!-- 		<video src="./video/MeetNow.mp4" autoplay="autoplay" loop="loop" width="100%" height="100%"> -->
			<h1 id="" style="color: white;">무엇을 좋아하시나요?</h1>
			<p style="color: white;">MeetNow로 한 걸음 더 나아가기</p>
			<p>
				<a class="btn btn-primary btn-lg" href="#" role="button">가입하기&raquo;</a>
			</p>
			<!-- 		</video> -->
		</div>
	</div>

            

<div class="container">
		<h2 style="color:#5f4c70;"><b>주변의 인기 Meet Up</b></h2></br>
		<c:forEach var="items" items="${result}">
			<div class="col">
				<div class="col-md-4">
					<div class="card">
						<time datetime="2014-09-20" class="icon">
							<strong>6월</strong> <span>20</span>
						</time>
						<a class="img-card" href=""><img src="files/1.jpg"> </a>
						<div class="card-content">
							<br />
							<div class="">${items.attend_date}</div>
							<h2 class="card-title">
								<a href="http://www.fostrap.com/"> ${items.board_title} </a>
							</h2>
							<p class="img-member">
								<img class="pull-left" src="./image/manse.jpeg" alt="Focus Lab">
							</p>
							<div class="">주최자 : ${items.group_leader}</div>
							<div class="">주최그룹 : ${items.group_name}</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>


<div class="col">
			<div class="col-xs-12 col-sm-4">
				<div class="card">
					<a class="img-card" href="http://www.fostrap.com/"> <img
						src="./image/Tulips.jpg" />
					</a> <br />
					<div class="card-content">
						<h4 class="card-title">
							<a href="http://www.fostrap.com/"> Your title card </a>
						</h4>
						<div class="">Your description card!!</div>
					</div>
					<div class="card-read-more">
						<a class="btn btn-link btn-block" href="http://www.fostrap.com/">
							Read More </a>
					</div>
				</div>
			</div>
		</div>
	</div>

		<h2 class="interest-title">분류별 탐색</h2></br>
		




		



	<footer>
		<%@ include file="include/bottom.jsp"%>



	</footer>
</body>

</html>
