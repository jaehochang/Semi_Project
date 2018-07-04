<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE>
<html>
<head>

<meta name="google-signin-client_id"
	content="877251563587-9mm7utso3vmg921b183stb0anidpr2n6.apps.googleusercontent.com">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Page</title>

<link rel="stylesheet" type="text/css" href="css/mypagenav-style.css">
<link rel="stylesheet" type="text/css" href="css/bottom-style.css">
<link rel="stylesheet" type="text/css"
	href="css/mypage-section-style.css">
<link rel="stylesheet" type="text/css" href="css/animate.css">


<!-- google api -->
<meta name="google-signin-client_id"
	content="201245295217-c7jm6q8qk7qf81smd0qfkfp3mlnr33cn.apps.googleusercontent.com">
<meta name="google-signin-scope" content="profile email">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<!-- google api -->





<!-- 밑에 CDN 순서 맞지 않으면 오류 발생 -->


<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


<!-- Jquery CDN -->
<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>


<!-- fontawesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
	integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
	crossorigin="anonymous">

<!-- 위에 CDN 순서 맞지 않으면 오류 발생 -->


</head>
<body>

	<nav>
		<%@ include file="include/nav/mypageNav.jsp"%>
	</nav>
	<!-- 이 줄 밑으로 my page 구현하기 -->


	<div id="profilebox">

		<div id=profilebody class="animated fadeInLeft">
			<div id=boxheader>
				<h1>${requestScope.userName}</h1>
			</div>

			<div>위치 : ${requestScope.userLocation}</div>
			<div>가입 날짜 : ${requestScope.userJoinDate}</div>
			<!-- 			<div class=container id=snsBts> -->
			<!-- 				SNS : -->
			<!-- 				<div class="fa-2x"> -->
			<!-- 					<a href="http://www.facebook.com"> <i class="fab fa-facebook"></i> -->
			<!-- 					</a> <a href="http://www.instagram.com"> <i -->
			<!-- 						class="fab fa-instagram"></i> -->
			<!-- 					</a> -->
			<!-- 				<div class=container>이력 추가</div> -->

			<div id="meetnow">
				<h1>2 Meetup의 멤버</h1>
				<!-- 				<a href="#">가입한 그룹 숨기기</a> -->
			</div>

			<div id=joinedgroup-list>
				<img src="${requestScope.photoURL}" width=250px height=150px style="border-radius:50px;">
				<div id="flushbottom">
					<h4>4조 B4A3</h4>
				</div>
				<div id="grouproll">회원</div>
			</div>
			<div id="docsectionsmall">안부 인사를 게시하려 하시나요? 대화를 시작해보시는건 어떤가요?</div>
		</div>
	<!-- 		</div> -->
	<!-- </div> -->

	<!-- aside 시작 -->
	<div id=profileaside class="animated fadeInRight">
		<img src="${requestScope.userPicture}"
			style="height: 150px; width: 200px; display: block; margin: 0 auto;">
		<button style="border-radius:50px; margin:0 auto;">
			<i class="fas fa-image" ></i> 이미지 바꾸기
		</button>

		<div id=interestbox>
			<h2>관심사</h2>
<!-- 			<a href="#">프로필에서 관심사 숨기기</a> <a href="#">편집</a> -->
		</div>
		<div id=interests>${requestScope.getUserInterests }</div>
	</div>


</div>
	

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