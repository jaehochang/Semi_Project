<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
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
</script>

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
						<button class="btn btn-success" data-dismiss="modal"
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


				<button onclick="window.open('signUpPage.jsp')"
					class="btn btn-default">가입하기</button>
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
						<div style="display: block; margin-top: 10px;">
							<input type=checkbox>로그인 상태 유지
						</div>

						<div id=btns style="margin-top: 10px;">
							<button id=loginCheck class="btn btn-default" style=>로그인</button>
						</div>

						<br> 또는 <a id="kakaoLoginBtn"><img
							src="img/kakao.png" height=35px width=35px>카카오톡으로 로그인하기</a>

					</div>
				</form>
			</div>
		</div>


		<!-- 카카오톡 로그인 API  -->

		<div>
			<%@ include file="logInWithKakao.jsp"%>
		</div>

	</div>

	<footer>
		<%@ include file="include/bottom.jsp"%>

	</footer>


</body>
</html>