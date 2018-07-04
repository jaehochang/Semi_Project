<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MeetNow : Sign-up Fail</title>
</head>
<body>

회원가입에 실패하였습니다.
3초 후 main 페이지로 이동합니다.

<script>
setInterval(function(){
	location.href="main.jsp";
},3000)

</script>

</body>
</html>