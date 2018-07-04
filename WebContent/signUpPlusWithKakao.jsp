<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MeetNow : 카카오톡 추가 정보 가입</title>
</head>
<body>

	<form action="signUpWithKakao.co" name=sendKakaoIdToController>
		<input value="${requestScope.kakao_id }" readonly type=hidden>
		<input name=kakao_email> <input
			value="${requestScope.kakao_nickname }" readonly> <input
			value="${requestScope.kakao_photo }" readonly> <input
			value="${requestScope.kakao_nickname }" readonly>
	</form>
</body>
</html>