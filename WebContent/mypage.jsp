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

<!-- Animtion On Sroll CDN -->
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

<!-- google api -->
<meta name="google-signin-client_id"
	content="201245295217-c7jm6q8qk7qf81smd0qfkfp3mlnr33cn.apps.googleusercontent.com">
<meta name="google-signin-scope" content="profile email">
<script src="https://apis.google.com/js/platform.js" async defer></script>


<!-- //밑에 CDN 순서 맞지 않으면 오류 발생// -->
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


<style>
#imgChooser {
	width: 0;
	height: 0;
	opacity: 0;
}
</style>

</head>
<body>
	<!-- nav -->
	<nav>
		<%@ include file="include/nav/mypageNav.jsp"%>
	</nav>

	<!-- 이 줄 밑으로 my page 구현하기 -->


	<div id="profilebox">

		<div id=profilebody class="animated fadeInLeft">

			<div id=boxheader>
				<h1>${requestScope.userName}</h1>

				<div>위치 : ${requestScope.userLocation}</div>
				<div>가입 날짜 : ${requestScope.userJoinDate}</div>

			</div>


			<div id="meetnow">
				<h1>${requestScope.joinedMeetnowCounts}개의모임참여중</h1>
			</div>

			<div id=joinedgroup-list>
				<div id="group-titles">
					<h4>${requestScope.joinedGroupNames}</h4>
				</div>
			</div>

		</div>

		<!-- aside 시작 -->
		<div id=profileaside class="animated fadeInRight">

			<div id=profile-aside-header>
				<img id=user-photo src="${requestScope.userPicture}">

				<form id="userPhotoChangeForm" action=userPhotoChangeForm
					name=userPhotoChangeForm enctype="multipart/form-data">
					
					
			<!-- 지혜야 부탁해 -->

<!-- 					<input id=imgChooser name=file type=file style="display:none;"> -->
<!-- 					<input type=text id=file-url>  -->
<!-- 					<button type=button id=user-photo-change-btn onclick="'javscript:document.getElementById('imgChooser').click(); document.getElementById('imgChooser').value=document.getElementById('file-url').value;"> -->
<!-- 						<i class="fas fa-image"></i> -->
<!-- 					</button> -->


				</form>
			</div>






			<div id=interestbox>
				<h2>관심사</h2>
				<div id=interests>${requestScope.getUserInterests}</div>
			</div>

		</div>


	</div>


	<!-- 	footer -->
	<%@ include file="include/bottom.jsp"%>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="./resources/docs/dist/js/bootstrap.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script
		src="./resources/docs/assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>