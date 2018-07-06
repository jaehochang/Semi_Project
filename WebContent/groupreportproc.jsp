<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>

<!--SJ 꺼 -->
<link rel="stylesheet" type="text/css" href="css/mypagenav-style.css ">
<link rel="stylesheet" type="text/css" href="css/bottom-style.css ">
<link rel="stylesheet" type="text/css"
	href="css/mypage-section-style.css ">
<!--SJ 꺼 -->
<style>
#wrapper {
	margin-top: 50px;
}

#wrapper div {
	border: 1px black;
	width: 450px;
	margin: 0 auto;
}

textarea {
	resize: vertical;
}

#etc {
	font-size: 15px;
}

label {
	font-size: 20px;
}

span {
	font-size: 17px;
}
</style>

</head>
<body>
	<nav>
		<%@ include file="include/nav/mypageNav.jsp"%>
	</nav>

	<form action="greportcomplete.group" method="post">
		<div id="wrapper">
			<div>
				<div style="text-align: center; font-size: 25px;">요약</div>
				<div>
					<label>신고 중 : </label>&nbsp;&nbsp; <span>${gdto.group_name }</span>
					<p></p>
				</div>
				<div>
					<label>이유 : </label>&nbsp;&nbsp;<span>${report_reason }</span>
					<p></p>
				</div>
				<div>
					<span id="etc"><b>그 밖에 우리가 알아야 할 것이 있나요?</b></span>
					<p></p>
				</div>
				<textarea rows="13" cols="60" id="etctext" name="etc_reason"></textarea>
				<p align="center">
					<button id="reportbtn" class="btn btn-default">신고하기</button>
				</p>
			</div>
		</div>
		<input type="hidden" name="group_seq" value="${gdto.group_seq}">
		<input type="hidden" name="group_name" value="${gdto.group_name }">
		<input type="hidden" name="report_reason" value="${report_reason }">
	</form>
</body>
</html>