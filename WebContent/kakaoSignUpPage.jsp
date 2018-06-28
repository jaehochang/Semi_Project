<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>카카오톡으로 회원가입 하기</title>
</head>
<body>

	<c:choose>
		<c:when test="${requestScope.result}">


			<div class="well">회원가입에 성공하였습니다. 3초 후 메인화면으로 이동합니다.</div>
			<script>
				setInterval(function() {
					location.href = "main.jsp";
				}, 3000)
			</script>



		</c:when>
		<c:otherwise>

			<form action="signUpWithSnsEmail.co" method="post">
				<input class="form-control" type=text name=kakao_id value="${requestScope.kakaoSecretNumId}">
				<input class="form-control" placeholder="프로필 저장용 이메일" type="email"
					name=email> <input class="form-control" placeholder="이름"
					name=name>
					
				<button>계속</button>
			</form>
 
		</c:otherwise>

	</c:choose>




</body>
</html>