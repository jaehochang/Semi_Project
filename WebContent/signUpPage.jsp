<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입</title>

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

			<div class="well">
				<form action="signUpApply.co" method="post">
					<div class="form-group">
						<label for="name"> 이름</label> <input id=name name=member_name type=text
							class=form-control max=20 required>
					</div>


					<div class="form-group">
						<label for="email"> 이메일</label> <input id=email name=member_email
							type=email class=form-control required max=50>
					</div>


					<div class="form-group">
						<label for="pwd"> 비밀번호</label> <input id=pwd name=pwd type=password
							class=form-control max=20 required>
					</div>


					<button class="btn-success">계속</button>

				</form>
			</div>

		</c:when>


	</c:choose>

</body>
</html>