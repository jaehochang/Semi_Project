<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<!-- google api -->
<meta name="google-signin-scope" content="profile email">
<script src="https://apis.google.com/js/platform.js" async defer></script>

<meta name="google-signin-client_id"
	content="29772503024-a0vbpecnn40g77lm6r1coi2sg7c1rmr5.apps.googleusercontent.com">


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MeetNow 로그인</title>


<link rel="stylesheet" type="text/css" href="css/bottom-style.css">
<link rel="stylesheet" type="text/css" href="css/mypagenav-style.css">
<link rel="stylesheet" type="text/css" href="css/login-style.css">
<link rel="stylesheet" type="text/css" href="css/login-failure-modal.css">
<link rel="stylesheet" type="text/css" href="css/button-style.css">

<!-- Animated  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">

<!-- Modal Icon -->
<link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">


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

<!-- fontawesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
	integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
	crossorigin="anonymous">

<!-- 카카오톡 -->
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

<!-- 페이스북 -->
<script language="javascript"
	src="http://connect.facebook.net/ko_KR/all.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#loginFailModal").modal('show');

	})
</script>

</head>
<body>

	<c:if test="${requestScope.emailExist==true}">

		<!-- Login Failure Modal -->
		<div id="loginFailModal" class="modal fade">
			<div class="modal-dialog modal-confirm">
				<div class="modal-content">
					<div class="modal-header">
						<div class="icon-box">
							<i class="material-icons">&#xE5CD;</i>
						</div>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body text-center">
						<h1>실패!</h1>
						<p>이미 중복된 이메일이 존재합니다!</p>
						<button class="button button-shadow" data-dismiss="modal"
							onclick="window.location.href='getEmailAddress.jsp'">이메일 찾기</button>

					</div>
				</div>
			</div>
		</div>

	</c:if>



	<c:if test="${requestScope.loginResult==false}">

		<!-- Login Failure Modal -->
		<div id="loginFailModal" class="modal fade">
			<div class="modal-dialog modal-confirm">
				<div class="modal-content">
					<div class="modal-header">
						<div class="icon-box">
							<i class="material-icons">&#xE5CD;</i>
						</div>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body text-center">
						<h1>실패!</h1>
						<p>회원정보가 올바르지 않습니다!</p>
						<button class="button button-shadow" data-dismiss="modal"
							onclick="window.close()">다시 로그인</button>

					</div>
				</div>
			</div>
		</div>

	</c:if>

	<nav>
		<%@ include file="include/nav/mypageNav.jsp"%>
	</nav>

	<div class="panel panel-default" style="width: 100%; margin: 0;">
		<div class="panel-body" style="width: 50%; margin: 0 auto;">
			<div id=loginheader style="margin-bottom: 15px;">
				<h2>로그인</h2>
			</div>
			<div id=loginbody class="panel-body"
				style="border-bottom: 1px solid #ddd;">
				<form action="login.co" method=post>

					<div class="form-group animated fadeIn">
						<label for=member_email>이메일 주소</label> <input class=form-control
							type=email id=member_email
							pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$"
							title="이메일 형태로 입력하셔야 합니다." placeholder="example@gmail.com"
							required name=member_email max=50 width=auto>
					</div>
					<div class="form-group animated fadeIn">
						<label for=pwd>비밀번호</label>
						<div>
							<a href="#">비밀번호를 잊으셨나요?</a>
						</div>

						<input id=pwd type=password max=13 name=pwd class=form-control
							required width=auto>
						<div style="display: block; margin-top: 10px;"></div>
					</div>

					<div id=btns style="margin-top: 10px;">
						<button id=loginCheck class="button button-shadow"
							style="font-size: 15px;">로그인</button>
					</div>
				</form>

				<br>
				<p style="text-align: center">또는 SNS로 로그인하세요.</p>

				<div id=snsLoginBtns style="margin: 0 auto; width: 100%;">
					<button id="kakaoLoginBtn"
						class="button button-shadow yellow text-blanco text-shadow-negra">🗨</button>
					<button id=fbLoginBtn
							class="button blue button-shadow text-blanco-fb text-shadow-negra"
						onclick="javascript:signIn()">f</button>
					<button id=ggLoginBtn class="button button-shadow"
						onclick="javascript:google_login_in()">G</button>
				</div>
			</div>
		</div>
	</div>




	<!-- SNS 로그인 API  -->

	<div>
		<%@ include file="logInWithKakao.jsp"%>
		<%@ include file="signUpWithFaceBook.jsp"%>
		<%@ include file="signUpWithGoogle.jsp"%>

	</div>


	<!-- footer -->
	<footer>
		<%@ include file="include/bottom.jsp"%>

	</footer>


</body>
</html>