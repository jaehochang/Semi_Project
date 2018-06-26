<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MeetNow 찾기</title>

<link rel="stylesheet" type="text/css" href="css/mypagenav-style.css">
<link rel="stylesheet" type="text/css" href="css/bottom-style.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">

<!--  Jquery CDN  -->
<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>


<!-- fontawesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
	integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
	crossorigin="anonymous">

<!-- BootStrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">


<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 달력 제이쿼리 라이브러리  -->
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<style>
.meetnowlist {
	border: 1px solid black;
}

section {
	width: 60%;
}

section ul li {
	border: solid 1px grey;
}

aside {
	height: 400px;
	width: 40%;
	border: 1px solid black;
	width: 35%;
	top: 0px;
}

section, aside {
	display: inline-block;
	left: 10%;
}
</style>

<script>
	$(document).ready(function() {
		$( "#datepicker" ).datepicker({
			dateFormat:"yy-mm-dd",
			onSelect: findEvents
		});
		
		function findEvents (date) {  
			$.ajax({
				url:"calenSearch.bo",
				type:"get",
				data:{val:date},	 
				success:function(response){
					console.log("AJAX Request 성공 ");
					$("#response").text(response);
				},
				error:function(){
					console.log("에러");
				},
				complte:function(){
					console.log("ajax complte");
				}
			});
		}
		
	});
</script>


</head>

<body>

	<nav>
		<%@ include file="include/nav/mypageNav.jsp"%>
	</nav>

	<header style="background-color: #b831d9; text-align: center;">

		<h2>Meetnow 찾기</h2>
		<h3>%%% 개의 모임이 근처에 있습니다!</h3>

	</header>


	<section class=well>
		<label>2018년 6월 23일 토요일</label>
		<ul>
			<li><span> 7:00</span>

				<h4>축구</h4>
				<h2>서울 한강변에서 빔 켜고 축구보기</h2> <span>722 명 참석 예정</span></li>


			<li><span> 7:00</span>

				<h4>축구</h4>
				<h2>서울 한강변에서 빔 켜고 축구보기</h2> <span>722 명 참석 예정</span></li>
			<li><span> 7:00</span>

				<h4>축구</h4>
				<h2>서울 한강변에서 빔 켜고 축구보기</h2> <span>722 명 참석 예정</span></li>

		</ul>



	</section>

	<aside class=well>
		<div id="datepicker"></div>	
	</aside>

	<footer>
		<%@ include file="include/bottom.jsp"%>
	</footer>


</body>
</html>