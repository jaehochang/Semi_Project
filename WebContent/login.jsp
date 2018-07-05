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



</head>
<body>

	<nav>
		<%@ include file="include/nav/mypageNav.jsp"%>
	</nav>


	<!-- <div class="panel panel-default">
		<div class="panel-body">
			<div id=loginheader style="border-bottom: 1px sold grey;">
				<h2>로그인</h2>
				<p>아직 등록하지 않으셨나요?</p>
				<a href="signUpPage.jsp">가입하기</a>
			</div>
			<div id=loginbody>
				<form action="login.co" method=post>

					<div class=form-group>
						<label for=member_email>이메일 주소</label> <input class=form-control
							type=text id=member_email name=member_email>
					</div>
					<div class=form-group>
						<label for=pwd>비밀번호</label> <span><a href="#">비밀번호를
								잊으셨나요?</a></span> <input id=pwd type=password max=13 name=pwd
							class=form-control> <input type=checkbox>로그인 상태 유지 
						<button type="button" id="loginbtn"class="btn btn-default">로그인</button>
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

	<script>
		$("#loginbtn").click(function() {
			var id = $("#member_email").val();
			var pw = $("#pwd").val();

			if (id == "" || pw == "") {
				$("#emptyinput").modal();
			}

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