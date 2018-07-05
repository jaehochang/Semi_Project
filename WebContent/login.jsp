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
</script>


<style>
#snsLoginBtns {
	display: block;
}

#snsLoginBtns a {
	border: 1px solid black;
	text-decoration: none;
	color: black;
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


				<button type="button" class="btn btn-default" data-toggle="modal"
					data-target='#idTypeQuestions'>가입하기</button>
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

						<br> 또는

						<div id=snsLoginBtns>
							<div>
								<a id="kakaoLoginBtn"><img src="img/kakao.png" height=35px
									width=35px>카카오톡으로 로그인하기</a>
							</div>
							<div>
								<a id=fbLoginBtn href="javascript:signIn()"><img
									src="img/facebook.png" height=35px width=35px>페이스북으로
									로그인하기</a>
							</div>
							<div>
								<button type=button onclick="google_login_in()">구글로
									로그인하기</button>

							</div>
						</div>

					</div>
				</form>
			</div>
		</div>
	</div> -->
	<div class="panel panel-default">
		<div class="panel-body">
			<div id=loginheader style="border-bottom: 1px sold grey;">
				<h2>로그인</h2>
				<p>아직 등록하지 않으셨나요?</p>
				<a href="signUpPage.jsp">가입하기</a>
			</div>
			<div id=loginbody>
				<form action="login.co" method=post id="lsubmit">

					<div class=form-group>
						<label for=member_email>이메일 주소</label> <input class=form-control
							type=text id=member_email name=member_email>
					</div>
					<div class=form-group>
						<label for=pwd>비밀번호</label> <span><a href="#">비밀번호를
								잊으셨나요?</a></span> <input id=pwd type=password max=13 name=pwd
							class=form-control> <input type=checkbox>로그인 상태
						유지
						<button type="button" id="loginbtn" class="btn btn-default">로그인</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- 아이디 비밀번호입력칸 공백일때 뜨는 모달창 -->
	<div class="modal fade" id="emptyinput">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">로그인</h4>
				</div>
				<div class="modal-body" style="text-align: center;">
					<p>아이디와 비밀번호를 입력해주세요.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="loginblock">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">로그인</h4>
				</div>
				<div class="modal-body" style="text-align: center;">
					<p>아이디와 비밀번호를 입력해주세요.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="blockid">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">정지당한 아이디입니다.</h4>
				</div>
				<div class="modal-body" style="text-align: center;">
					<p id="modaltext">신고로 인해 정지당한 아이디입니다.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

		<!-- SNS 로그인 API  -->
	<script>
		$("#loginbtn").click(function() {
			var id = $("#member_email").val();
			var pw = $("#pwd").val();

		<div>
			<%@ include file="logInWithKakao.jsp"%>
			<%@ include file="signUpWithFaceBook.jsp"%>
			<%@ include file="signUpWithGoogle.jsp"%>
			if (id == "" || pw == "") {
				$("#emptyinput").modal();
			}

		</div>

	</div>

	<!-- footer -->
			$.ajax({
				url : "logincheck.co",
				type : "post",
				data : {
					id : id,
					pw : pw
				},
				success : function(resp) {
					//boolean이 true일때 로그인 안되는 모달창
					//boolean이 false일때 로그인 성공
// 					var bool = resp.bool;
					console.log("성공")
					console.log(resp.id);
					console.log(resp.pw);
					console.log(resp.bool);
					console.log(resp.bdate)
					if(resp.bool){
						$("#blockid").modal();
						$("#modaltext").text("사용까지"+resp.bdate+"일 남았습니다.");
					}else{
						location.href="CIHLogin.co?member_email="+resp.id;
					}
				},
				error : function() {
					console.log("에러발생");
				}
			})
		})
	</script>



	<footer>
		<%@ include file="include/bottom.jsp"%>

	</footer>


</body>
</html>