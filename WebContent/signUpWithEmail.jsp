<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
	request.setCharacterEncoding("utf8");
%>
<%
	response.setCharacterEncoding("utf8");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입</title>

<!-- Jquery CDN -->
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!-- BootStrap CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>



	<c:choose>

		<c:when test="${requestScope.id != null}">

			<div class="well">회원가입에 성공하였습니다. 3초 후 메인화면으로 이동합니다.</div>
			<script>
				setInterval(function() {
					location.href = "main.jsp";
				}, 3000)
			</script>



		</c:when>

		<c:when test="${requestScope.id == null}">

			<div class="panel panel-default" style="width:50%; margin:0 auto; position:relative; top:25%;">
				<div class="well panel-body">
					<form action="signUpApply.co" method="post">
						<div class="form-group">
							<label for="name"> 이름</label> <input id=name pattern="[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]+" title="한글만 입력 가능, 영어도 가능하게 해야하나?"  title="한글만 입력 가능, 영어도 가능하게 해야하나?" placeholder="한글만 입력 가능" name=member_name
								type=text class=form-control max=20 required>
						</div>
<!--  pattern="[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]+" title="한글만 입력 가능, 영어도 가능하게 해야하나?" -->

						<div class="form-group">
							<label for="email"> 이메일</label> <input id=email pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" name=member_email placeholder="example@gmail.com"
								type=email class=form-control required max=50>
						</div>


						<div class="form-group">
							<label for="pwd"> 비밀번호</label> <input id=pwd name=pwd
								type=password class=form-control pattern="{2,}" max=20 placeholder="최소 2-20자" required>
<!-- 								(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,} 최소 소문자 1, 대문자 1, 8자 이상 -->
						</div>


						<button class="btn btn-default" style="background-color: #b831d9;">계속</button>

					</form>
				</div>
			</div>
		</c:when>


	</c:choose>

</body>
</html>