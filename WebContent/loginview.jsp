<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="en">
<head>

<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">



<title>meet now</title>


<link rel="icon" href="./resources/docs/favicon.ico">
<link rel="stylesheet" type="text/css"
	href="css/loginview-group-style.css">


<!-- SJ 꺼 -->
<link rel="stylesheet" type="text/css" href="css/mypagenav-style.css">
<link rel="stylesheet" type="text/css" href="css/bottom-style.css">
<link rel="stylesheet" type="text/css"
	href="css/mypage-section-style.css">
<!-- SJ 꺼 -->

<link href="./resources/docs/examples/jumbotron/jumbotron.css"
	rel="stylesheet">
<script src="./resources/docs/assets/js/ie-emulation-modes-warning.js"></script>

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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


</head>
<script>
	$(document).ready(function() {
		
		navigator.geolocation.getCurrentPosition(function(position) {
			 pos = {
				lat : position.coords.latitude,
				lng : position.coords.longitude

			};
			alert("나의 위도 : " + pos.lat + " 나의 경도 : " + pos.lng);
		});

		$("#search-bt").click(function() {

			alert("검색");
		})
		$("#five_km").click(function() {

			alert("5km 입니다.");
			$("#distance-default").html("5km <span class=caret></span>");
			var val = pos.lat + ":" +pos.lng;
			var dist = 5;
			$.ajax({
				url : "five_km.group",
				type : "get",
				data : {
					value : val,
					distance : dist
				},
				success : function(result) {
					console.log(result.result);
					alert(result.result);
					
				},
				error : function() {
					
					console.log("에러 발생!");
				},
				complete : function() {
					console.log("성공이건 실패건 어찌되었든 ajax 종료");
				}

			});
		})
		$("#ten_km").click(function() {
			alert("10km 입니다.");
			$("#distance-default").html("10km <span class=caret></span>");
		})
		$("#fifteen_km").click(function() {
			alert("15km 입니다.");
			$("#distance-default").html("15km <span class=caret></span>");
		})
		$("#all_km").click(function() {
			alert("모든거리 입니다.");
			$("#distance-default").html("모든거리 <span class=caret></span>");
		})
	})
</script>

<body>

		<%@ include file="include/nav/mypageNav.jsp"%>

	<div class="jumbotron" style="background-color: #d07de8">
		<div class="container">
			<h1 style="text-align: center; color: white;">MeetNow 찾기</h1>
			<p>MeetNow로 한 걸음 더 나아가기</p>
			<p>
				<a class="btn btn-primary btn-lg" href="#" role="button">가입하기&raquo;</a>
			</p>
		</div>
	</div>

	<div id="search">
		<div class="col-xs-4">
			<input type="text" class="form-control" id="search-input"
				placeholder="전체 MeetUp 이벤트">
			<button type="button" class="btn btn-default" aria-label="Left Align"
				id="search-bt">
				<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
			</button>
		</div>
		<h5 id="location-text">내</h5>
		<div class="btn-group" id="location-km">
			<button type="button" class="btn btn-default dropdown-toggle"
				data-toggle="dropdown" aria-expanded="false" id="distance-default">
				5km <span class="caret"></span>
			</button>
			<ul class="dropdown-menu" role="menu">
				<li><a href="#" id="five_km">5km</a></li>
				<li><a href="#" id="ten_km">10km</a></li>
				<li><a href="#" id="fifteen_km">15km</a></li>
				<li><a href="#" id="all_km">모든거리</a></li>
			</ul>
		</div>


		<div class="btn-group"
			style="position: absolute; bottom: 15px; left: 450px;">
			<button type="button" class="btn btn-default dropdown-toggle"
				data-toggle="dropdown" aria-expanded="false" id="location-default">
				서울,KR <span class="caret"></span>
			</button>
			<ul class="dropdown-menu" role="menu" id="dropdown-location">
				<li><input type=text></li>
			</ul>
		</div>

		<script>
			$('#dropdown-location').click(function(e) {
				e.stopPropagation();
			});
		</script>

		<h5 id="location-text2">의</h5>

		<div class="btn-group" role="group" id="search-check"
			style="position: absolute; bottom: 15px; left: 750px;">
			<button type="button" class="btn btn-default">그룹들</button>
			<button type="button" class="btn btn-default">달력</button>
		</div>
	</div>

	<div class="myMeetNow">
		<p>내 MeetNow</p>




		<div class="row" id="myMeet_row">
			<c:forEach var="item" items="${myGroupList }">
				
				<div class="col-md-3" style="padding: 10px;">
					<a href="groupMain.group?group_seq=${item.group_seq}&page=info">
					<div class="over-img">
						<img src="files/${item.system_name }" class="img_size">
					</div>
					<h4 class="group_title">${item.group_name }</h4>
					
					<c:forEach var="item2" items="${memberCount }">
						<c:if test="${item.group_seq eq item2.group_seq }">
							<h5 class="group_count">${item2.count}명의회원</h5>
						</c:if>
					</c:forEach>
					</a>
				</div>
				
			</c:forEach>
		</div>

	</div>


	<div id="recoMeetnow">
		<p>추천 MeetNow</p>
		<div class="row">
		
		<c:forEach var="item" items="${groupList }">
		
			<div class="col-md-4">
				<a href="groupMain.group?group_seq=${item.group_seq}&page=info">
				<div class="img_div">
				<div class="over-img">
					<img src="files/${item.group_picture }" class="img_size">
				</div>
				</div>
				<h4 class="group_title">${item.group_name }</h4>
			</div>
			
		</c:forEach>
		</div>

	</div>
	
	<div id="moreGroup">
		<button type="button" class="btn btn-default btn-lg btn-block" style="height:30px; padding:0px;">더보기</button>
	</div>



		<%@ include file="include/bottom.jsp"%>




</body>
</html>