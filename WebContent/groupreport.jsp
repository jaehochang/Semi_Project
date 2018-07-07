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
	margin: 0 auto;
	width: 600px;
	border: 1px solid black"
}

#wrapper div div {
	margin-bottom: 20px;
	font-size: 20px;
}
p {
margin-top: 20px;
}
</style>
</head>
<body>
	<nav>
		<%@ include file="include/nav/mypageNav.jsp"%>
	</nav>
		<form action="groupreportproc.group" method="get" id="grproc">
			<div id="wrapper">
				<div>
					<div style="font-size: 30px;">
						<b>왜 이 Meetnow 그룹을 신고하셨나요?</b>
					</div>
					<div>
						<input type="radio" id="r1" name="report_select" value="지적 재산권 침해"><label
							for="r1">지적 재산권 침해</label>
					</div>
					<div>
						<input type="radio" id="r2" name="report_select"value="해당 사진은 음란, 난폭, 유해한 내용을 담고 있습니다."><label
							for="r2" >해당 사진은 음란, 난폭, 유해한 내용을 담고 있습니다.</label>
					</div>
					<div>
						<input type="radio" id="r3" name="report_select"value="밋업 설명이 증오적이거나 서정적 입니다."><label
							for="r3" >밋업 설명이 증오적이거나 서정적 입니다.</label>
					</div>
					<div>
						<input type="radio" id="r4" name="report_select"value="초점이 커뮤니티가 아닌 다른 것에 있습니다."><label
							for="r4">초점이 커뮤니티가 아닌 다른 것에 있습니다.</label>
					</div>
					<div>
						<input type="radio" id="r5" name="report_select"value="미팅이 정확하게 설명되지 않았습니다."><label
							for="r5">미팅이 정확하게 설명되지 않았습니다.</label>
					</div>
					<div>
						<input type="radio" id="r6" name="report_select" value="이 미팅은 유해한 내용을 포함하고 있습니다."><label
							for="r6">이 미팅은 유해한 내용을 포함하고 있습니다.</label>
					</div>
					<div>
						<input type="radio" id="r7" name="report_select"value="미팅이 성행위를 묘사 또는 부추기고 있습니다."><label
							for="r7">미팅이 성행위를 묘사 또는 부추기고 있습니다.</label>
					</div>
					<div>
						<input type="radio" id="r8" name="report_select" value="밋업은 허가된 서비를 제공합니다.(의료, 심리, 금융, 법률)"><label
							for="r8">밋업은 허가된 서비를 제공합니다.(의료, 심리, 금융, 법률)</label>
					</div>
					<div>
						<input type="radio" id="r9" name="report_select" value="해당 그룹이 Meetup에 속하지 않은것 같아요."><label
							for="r9">해당 그룹이 Meetup에 속하지 않은것 같아요.</label>
					</div>
					<p align="center">
						<button type="button" class="btn btn-default" id="nextbtn">다음</button>
					</p>
				</div>
			</div>
			<input type="hidden" name="group_seq" value="${group_seq }" >
			<input type="hidden" name="member_email" value="">
		</form>
	<script>
		$('#nextbtn').click(function() {
			// getter
			var radioVal = $('input[name="report_select"]:checked').val();
			alert(radioVal);
			document.getElementById("grproc").submit();
		});
	</script>
</body>
</html>