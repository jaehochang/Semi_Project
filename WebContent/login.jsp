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
<!-- google api -->

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MeetNow 로그인</title>

<link rel="stylesheet" type="text/css" href="css/bottom-style.css">
<link rel="stylesheet" type="text/css" href="css/mypagenav-style.css">
<link rel="stylesheet" type="text/css"
	href="css/login-failure-modal.css">


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

	$(function(){
		$('nav a').click(function(){
		var speed=200;
		var i=$(this).index();
		$('.page.current').animate(){
			opacity:0, marginTop:80},speed,function(){
				$(this).removeClass('current');
			});
		});
		}
	})
	</script>



<style>
#snsLoginBtns {
	display: block;
	margin: 0 auto;
	text-align: center;
}

html {
	overflow-y: scroll;
}

.page {
	display: none;
	opacity: 0;
}

.page.current {
	display: block;
	opacity: 1;
}

.button {
	/*[ Position ]*/
	margin: 0 10px 50px 10px;
	/* 	float:left; */
	/* 	left: 200px; */
	/* 	top:90px; */
	/* [ Botton ] */
	position: relative;
	height: 70px;
	width: 70px;
	cursor: pointer;
	line-height: 47px;
	background-color: #f1f1f1;
	text-align: center;
	font-size: 30px;
	display: inline-block;
	text-shadow: 0px -1px 1px rgba(255, 255, 255, 0.5);
	color: #444;
	/* Transitions */
	-moz-transition: .1s ease-out;
	-webkit-transition: .1s ease-out;
	-o-transition: .1s ease-out;
	-ms-transition: .1s ease-out;
	-khtml-transition: .1s ease-out;
	transition: .1s ease-out;
	/* Shadows */
	box-shadow: inset 0 0 5px 0 rgba(255, 255, 255, 0.5);
	-moz-box-shadow: inset 0 0 5px 0 rgba(255, 255, 255, 0.5);
	-ms-box-shadow: inset 0 0 5px 0 rgba(255, 255, 255, 0.5);
	-webkit-box-shadow: inset 0 0 5px 0 rgba(255, 255, 255, 0.5);
	-khtml-box-shadow: inset 0 0 5px 0 rgba(255, 255, 255, 0.5);
	-o-box-shadow: inset 0 0 5px 0 rgba(255, 255, 255, 0.5);
	/* Borders */
	border-width: 1px;
	border-style: solid;
	border-left-color: #777;
	border-right-color: #777;
	border-top-color: #999;
	border-bottom: 4px solid #555;
	/* {{ No selectable }} */
	user-select: none;
	-moz-user-select: none;
	-webkit-user-select: none;
	-o-user-select: none;
	-ms-user-select: none;
	-khtml-user-select: none;
	/*[{- Border radius -}]*/
	border-radius: 5px;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	-ms-border-radius: 5px;
	-khtml-border-radius: 5px;
	-o-border-radius: 5px;
	/* Gradient */
	background-image: -moz-linear-gradient(top, transparent, rgba(0, 0, 0, 0.2));
	background-image: -webkit-linear-gradient(top, transparent, rgba(0, 0, 0, 0.2));
	background-image: -o-linear-gradient(top, transparent, rgba(0, 0, 0, 0.2));
	background-image: -khtml-linear-gradient(top, transparent, rgba(0, 0, 0, 0.2));
	background-image: -ms-linear-gradient(top, transparent, rgba(0, 0, 0, 0.2));
	background-image: linear-gradient(top, transparent, rgba(0, 0, 0, 0.2));
}

.button:hover {
	color: #333;
	/*{Gradient}*/
	background-image: -moz-linear-gradient(top, transparent, rgba(0, 0, 0, 0.17));
	background-image: -webkit-linear-gradient(top, transparent, rgba(0, 0, 0, 0.17));
	background-image: -ms-linear-gradient(top, transparent, rgba(0, 0, 0, 0.17));
	background-image: -khtml-linear-gradient(top, transparent, rgba(0, 0, 0, 0.17));
	background-image: -o-linear-gradient(top, transparent, rgba(0, 0, 0, 0.17));
	background-image: linear-gradient(top, transparent, rgba(0, 0, 0, 0.17));
}

.button:active {
	margin-top: 4px;
	color: #777;
	border: 1px solid #999;
	/*{Shadow}*/
	box-shadow: inset 0 0 5px 0 #333;
	-moz-box-shadow: inset 0 0 5px 0 #333;
	-webkit-box-shadow: inset 0 1px 2px 0 #333, 0 1px 1px 0 #fff;
}

.button-shadow {
	box-shadow: 3px 3px 3px grey;
}

.text-shadow-negra {
	text-shadow: -1px -1px 0 rgba(0, 0, 0, 0.2);
}

.text-blanco {
	color: #F2F2F2;
}

.text-blanco:hover {
	color: #3f3035;
}

.text-blanco:active {
	color: #3f3035;
}

.text-blanco-fb {
	color: #F2F2F2;
}

.text-blanco-fb:hover {
	color: #dfe3ee;
}

.text-blanco-fb:active {
	color: #dfe3ee;
}

.blue {
	background-color: #659AE0;
	border-bottom-color: #436796;
	border-left-color: #5981AF;
	border-right-color: #5981AF;
	border-top-color: #719CCE;
}

.red {
	background-color: #C46A6A;
	border-bottom-color: #A05D5D;
	border-left-color: #AF5757;
	border-right-color: #AF5757;
	border-top-color: #C66767;
}

.green {
	background-color: #82C43A;
	border-color: #578720;
}

.yellow {
	background-color: #EFEC40;
	border-color: #9B9800;
}

.brown {
	background-color: #594343;
	border-bottom-color: #423F1B;
	border-right-color: #3F3D28;
	border-left-color: #3F3D28;
	border-top-color: #7C6262;
}

.black {
	background-color: #555;
	border-bottom-color: #444;
	border-left-color: #666;
	border-right-color: #666;
	border-top-color: #777;
}

.orange {
	background-color: #FAA407;
	border-bottom-color: #BA7500;
	border-left-color: #DB8A00;
	border-right-color: #DB8A00;
	border-top-color: #E89200;
}
</style>
</head>
<body>

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
						<p>아이디 혹은 비밀번호가 올바르지 않습니다. 확인해주세요!</p>
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
				<p>아직 등록하지 않으셨나요?</p>
				<button type="button" class="button button-shadow"
					data-toggle="modal" data-target='#idTypeQuestions'
					style="width: 90px; font-size: 15px;">가입하기</button>
			</div>
			<div id=loginbody style="border-bottom: 1px solid #ddd;">
				<form action="login.co" method=post>

					<div class=form-group>
						<label for=member_email>이메일 주소</label> <input class=form-control
							type=email id=member_email
							pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$"
							title="이메일 형태로 입력하셔야 합니다." placeholder="example@gmail.com"
							required name=member_email max=50>
					</div>
					<div class=form-group>
						<label for=pwd>비밀번호</label>
						<div>
							<a href="#">비밀번호를 잊으셨나요?</a>
						</div>

						<input id=pwd type=password max=13 name=pwd class=form-control
							required>
						<div style="display: block; margin-top: 10px;"></div>
					</div>
				</form>

				<div id=btns style="margin-top: 10px;">
					<button id=loginCheck class="button button-shadow"
						style="font-size: 15px;">로그인</button>
				</div>

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