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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">

</head>
<body>

	<nav>
		<%@ include file="include/nav/mypageNav.jsp"%>
	</nav>
	<!-- 이 줄 밑으로 my page 구현하기 -->


	<section id="profilebox">

		<div class="panel panel-default" id=profilebody>
			<div class=container id=boxheader>
				<h2>Youn SeungJin</h2>
			</div>

			<div class=container>위치 : 서울</div>
			<div class=container>가입 날짜 : 2018년 6월 21일(목)</div>
			<div class=container id=snsBts>
				SNS :
				<div class="fa-2x">

					<a href="http://www.facebook.com"> <i class="fab fa-facebook"></i>
					</a> <a href="http://www.instagram.com"> <i
						class="fab fa-instagram"></i>
					</a>


				</div>


				<div class=container>이력 추가</div>
			</div>

			<div class="container" id="meetnow">
				<h1>2 Meetup의 멤버</h1>
				<a href="#">가입한 그룹 숨기기</a>
			</div>


			<div class="container" id="joinedgroup-list">

				<img>
				<div class=container id="flushbottom">
					<h4>4조 B4A3</h4>
				</div>
				<div class=container id="grouproll">회원</div>
			</div>


			<div class=container id="docsectionsmall">안부 인사를 게시하려 하시나요? 대화를
				시작해보시는건 어떤가요?</div>

		</div>


		<!-- aside 시작 -->
		<div class="panel panel-default" id=profileaside>
			<img src="xbox.png"
				style="height: 100px; width: 100px; display: inline-block;"> <span>change
				your photo</span>
		</div>


	</section>


	<!-- 	footer -->
	<footer>
		<%@ include file="include/bottom.jsp"%>
	</footer>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="./resources/docs/dist/js/bootstrap.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script
		src="./resources/docs/assets/js/ie10-viewport-bug-workaround.js"></script>

</body>
</html>