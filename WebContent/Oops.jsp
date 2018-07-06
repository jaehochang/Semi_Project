<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Oops!</title>
</head>
<body>

	<c:choose>
		<c:when test="${requestScope.Null==true}">

<div>
			<h1 style="color: red;">Oops!!!</h1>

			<div>Nullpoint 에러가 발생하여 5초 후 초기 화면으로 이동합니다.</div>
</div>
			<script>
				setInterval(function() {
					location.main = "index.jsp";
				}, 5000)
			</script>



		</c:when>
	</c:choose>
</body>
</html>