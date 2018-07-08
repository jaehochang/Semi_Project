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


</head>
<body>



	<c:choose>

		<c:when test="${requestScope.isIdBlocked eq true }">
			<script>
				alert("넌 블럭 ㅋ ㅃㅃ");
				location.href = "Oops.jsp";
			</script>
		</c:when>



		<c:when test="${requestScope.kakaoIdAlreadyExist==true}">



			<!-- Modal  -->
			<div id="kakaoIdExist" class="modal fade">
				<div class="modal-dialog modal-confirm">
					<div class="modal-content">
						<div class="modal-header">
							<div class="icon-box">
								<i class="material-icons">&#xE876;</i>
							</div>
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
						</div>
						<div class="modal-body text-center">
							<h1>Awesome!</h1>
							<p>로그인 성공!</p>

							<button class="btn btn-success btn-block" data-dismiss="modal"
								data-dismiss="modal" style="background-color: grey;"
								style="background-color:grey;"
								onclick="$(this).modal('toggle');">둘러보기</button>

						</div>
					</div>
				</div>
			</div>

			<script type="text/javascript">
				$("#kakaoIdExist").modal('show');
			</script>


		</c:when>


		<c:when test="${requestScope.loginSuccess==true}">


			<div id="loginSuccessModal" class="modal fade">
				<div class="modal-dialog modal-confirm">
					<div class="modal-content">
						<div class="modal-header">
							<div class="icon-box">
								<i class="material-icons">&#xE876;</i>

							</div>
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
						</div>
						<div class="modal-body text-center">
							<h1>성공!</h1>
							<p>로그인에 성공하였습니다.</p>
							<button class="btn btn-success btn-block" data-dismiss="modal"
								style="background-color: grey;"
								onclick="window.location.href='index.jsp'">둘러보기</button>
						</div>
					</div>
				</div>
			</div>

			<script type="text/javascript">
				$("#loginSuccessModal").modal('show');
			</script>


		</c:when>


		<c:when test="${requestScope.signUpSuccess==true}">


			<div id="loginSuccessModal" class="modal fade">
				<div class="modal-dialog modal-confirm">
					<div class="modal-content">
						<div class="modal-header">
							<div class="icon-box">
								<i class="material-icons">&#xE876;</i>

							</div>
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
						</div>
						<div class="modal-body text-center">
							<h1>성공!</h1>
							<p>회원가입에 성공하였습니다.</p>
							<button class="btn btn-success btn-block" data-dismiss="modal"
								onclick="window.location.href='index.jsp'">둘러보기</button>
						</div>
					</div>
				</div>
			</div>

			<script type="text/javascript">
				$("#loginSuccessModal").modal('show');
			</script>


		</c:when>



		<c:when test="${requestScope.emailExist==true}">
			<!-- 		회원가입 아이디 중복  -->



			<!-- Modal  -->
			<div id="signUpFailModal" class="modal fade">
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
							<p>회원정보가 갖고 있는 이메일로 이미 가입된 계정이 존재합니다.</p>

							<!-- 						<button class="btn btn-success btn-block" data-dismiss="modal" -->
							<!-- 							onclick="window.location.href='signUpPlusWithKakao.jsp'">다른 이메일 사용</button> -->

							<button class="btn btn-success btn-block" data-dismiss="modal"
								onclick="$(this).modal('toggle');">다시 로그인</button>

						</div>
					</div>
				</div>
			</div>

			<script type="text/javascript">
				$("#signUpFailModal").modal('show');
			</script>


		</c:when>


		<c:when test="${requestScope.loginResult==false}">





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
							<button type="button" class="btn btn-success btn-block"
								data-dismiss="modal" onclick="$(this).modal('toggle');">다시
								로그인</button>

						</div>
					</div>
				</div>
			</div>

			<script type="text/javascript">
				$("#loginFailModal").modal('show');
			</script>



		</c:when>
	</c:choose>

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
				<form action="login.co" method=post id="login_submit">

					<div class="form-group animated fadeIn">
						<label for=member_email>이메일 주소</label> <input class=form-control
							type=email id=member_email
							pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$"
							title="이메일 형태로 입력하셔야 합니다." placeholder="example@gmail.com"
							required name=member_email max=50 width=auto>
					</div>
					<div class="form-group animated fadeIn">
						<label for=pwd>비밀번호</label> <input id=pwd type=password max=13
							name=pwd class=form-control required width=auto>
						<div style="display: block; margin-top: 10px;"></div>
					</div>

					<div id=btns style="margin-top: 10px;">
						<button id=loginCheck data-toggle="modal"
							class="btn btn-default btn-block" style="font-size: 15px;">로그인</button>
						<button id=emailFind class="btn btn-default btn-block"
							style="font-size: 15px;">이메일 찾기</button>
						<button id=pwFind class="btn btn-default btn-block"
							style="font-size: 15px;">비밀번호 찾기</button>

					</div>
				</form>

				<br>
				<p style="text-align: center">또는 SNS로 로그인하세요.</p>

				<div id=snsLoginBtns style="margin: 0 auto; width: 100%;">




					<div>
						<%@ include file="signUpWithKakao.jsp"%>
						<%@ include file="signUpWithFaceBook.jsp"%>
						<%@ include file="signUpWithGoogle.jsp"%>

					</div>
				</div>
			</div>
		</div>



		<!-- 블락된 아이디 모달 -->
		<div class="modal fade" id="blockid">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">로그인 정지</h4>
					</div>
					<div class="modal-body" style="text-align: center;">
						<p>신고로 인해 정지된 아이디입니다.</p>
						<p id="modaltext"></p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>

		<script>
// 			$("#loginCheck").click(
// 					function(e) {
// 						var id = $("#member_email").val();
// 						var pw = $("#pwd").val();
// 						console.log(id);
// 						console.log(pw)

// 						$.ajax({
// 							url : "logincheck.co",
// 							type : "post",
// 							data : {
// 								id : id,
// 								pw : pw
// 							},
// 							success : function(resp) {
// 								//boolean이 true일때 로그인 안되는 모달창
// 								//boolean이 false일때 로그인 성공
// 								console.log("성공")
// 								console.log(resp.result);
// 								console.log(resp.expiredate);
// 								if (resp.result) {
// 									alert("신고당한 아이디임" + resp.expiredate
// 											+ "부터 쓸수있음");

// 									$("#blockid").modal();
// 									$("#modaltext").text(
// 											"이 계정은" + resp.expiredate
// 													+ " 이후부터 사용이 가능합니다.");
// 									return false;
// 								} else {
// 									document.getElementById("login_submit")
// 											.submit();
// 								}
// 							},
// 							error : function(status) {
// 								console.log("에러발생");
// 								console.log(status);
// 							}
// 						})
// 					})
		</script>

		<!-- SNS 로그인 API  -->
		<div>
			<%@ include file="logInWithKakao.jsp"%>
			<%@ include file="signUpWithFaceBook.jsp"%>
			<%@ include file="signUpWithGoogle.jsp"%>

		</div>

	</div>

	<!-- footer -->

	<footer>
		<%@ include file="include/bottom.jsp"%>
</body>
</html>