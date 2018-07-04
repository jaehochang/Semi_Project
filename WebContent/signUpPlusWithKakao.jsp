
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
<link rel="stylesheet" type="text/css"
	href="css/login-failure-modal.css">
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
<script src="https://develop+ers.kakao.com/sdk/js/kakao.min.js"></script>

<!-- 페이스북 -->
<script language="javascript"
	src="http://connect.facebook.net/ko_KR/all.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#loginFailModal").modal('show');

		$("#modal-close").click(function() {
			$("#loginFailModal").modal('toggle');
		})
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
						<button id="modal-close" class="button button-shadow"
							data-dismiss="modal" onclick="">다른 이메일 사용하기</button>

					</div>
				</div>
			</div>
		</div>

	</c:if>



	<form action="signUpWithKakao.co" name=sendKakaoIdToController>
		<input name=kakao_id value="<%=request.getParameter("kakao_id")%>"
			readonly type=hidden> <label for=email>아이디를 입력해야
			회원가입이 완료됩니다.</label> <input id=email name=kakao_email placeholder="수신용 이메일"
			type=email required> <input name=kakao_nickname value=""
			placeholder="이름" required> <input type=hidden
			name=kakao_photo value="<%=request.getParameter("kakao_photo")%>"
			readonly>
		<button>계속</button>
	</form>

	<script>
		window.onload = function() {

			var SignUpTryingKakaoEmail = document.getElementById("email").value;
			document.getElementById("email").onkeyup = function() {
				$.ajax({
					url : "isThisEmailExist.co",
					data : {
						"SignUpTryingKakaoEmail" : SignUpTryingKakaoEmail
					},
					success : function(response) {
						console.log(response);
						console.log(response.result);

					}
				})
			}
		}
	</script>

</body>
</html>