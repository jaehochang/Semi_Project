<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

<!-- 구글맵 스타일 -->
<style>
/* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
#map {
	width: 400px;
	height: 300px;
}
/* Optional: Makes the sample page fill the window. */
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

#description {
	font-family: Roboto;
	font-size: 15px;
	font-weight: 300;
}

#infowindow-content .title {
	font-weight: bold;
}

#infowindow-content {
	display: none;
}

#map #infowindow-content {
	display: inline;
}

.pac-card {
	margin: 10px 10px 0 0;
	border-radius: 2px 0 0 2px;
	box-sizing: border-box;
	-moz-box-sizing: border-box;
	outline: none;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
	background-color: #fff;
	font-family: Roboto;
}

#pac-container {
	padding-bottom: 12px;
	margin-right: 12px;
}

.pac-controls {
	display: inline-block;
	padding: 5px 11px;
}

.pac-controls label {
	font-family: Roboto;
	font-size: 13px;
	font-weight: 300;
}

#pac-input {
	background-color: #fff;
	font-family: Roboto;
	font-size: 15px;
	font-weight: 300;
	padding: 0 11px 0 13px;
	text-overflow: ellipsis;
	width: 400px;
	height: 40px;
	margin: 10px 0;
}

#pac-input:focus {
	border-color: #4d90fe;
}

#title {
	color: #fff;
	background-color: #4d90fe;
	font-size: 25px;
	font-weight: 500;
	padding: 6px 12px;
}

#target {
	width: 345px;
}
</style>
<!-- 구글맵 스타일 -->

<title>Insert title here</title>
<style>
#wrapper {
	height: 2200px;
	background-color: #f4f6f7;
}

#wrapper-sub1 {
	width: 1050px;
	margin: 0 auto;
}

#wrapper-sub2 {
	background-color: white;
	margin: 50px auto;
	width: 1000px;
}

#wrapper-sub2-title {
	margin: 0 auto;
	width: 600px;
	height: 200px;
}

#wrapper-sub3 {
	background-color: white;
	margin: 50px auto;
	width: 1000px;
}

#wrapper-sub3-title {
	margin: 0 auto;
	width: 600px;
	height: 500px;
}

#wrapper-sub4 {
	background-color: white;
	margin: 50px auto;
	width: 1000px;
}

#wrapper-sub4-title {
	border: 1px solid black;
	width: 600px;
	height: 500px;
	margin: 0 auto;
}

#wrapper-sub4-title div {
	margin: 0 auto;
}

#wrapper-sub5 {
	background-color: white;
	margin: 50px auto;
	width: 1000px;
}

#wrapper-sub5-title {
	margin: 0 auto;
	width: 600px;
	height: 500px;
}

textarea {
	resize: none;
}

p {
	margin: 0;
	padding: 0;
}
</style>
<script>
	var textCountLimit_sub2 = 2000;
	var textCountLimit_sub5 = 2000;
	$(document).ready(function() {
		$("#map").hide();
		$('textarea[name=sub2_textarea]').keyup(function(){
			var textLength = $(this).val().length;
			$("#textCount").text(textLength);
			if(textLength > textCountLimit_sub2){
				$(this).val($(this).val().substr(0,textCountLimit_sub2));
			}
		})
		
		$('textarea[name=sub5_textarea]').keyup(function(){
			var textLength = $(this).val().length;
			$("#textCount_sub5").text(textLength);
			if(textLength > textCountLimit_sub5){
				$(this).val($(this).val().substr(0,textCountLimit_sub5));
			}
		})
	})
</script>
</head>
<body>
<form action="newmeeting.meet" method="post" id="msubmit" name="msubmit">
	<nav>
		<%@ include file="include/nav/mypageNav.jsp"%>
	</nav>
	<div id="wrapper">
		<div id="wrapper-sub1">
			<h2>Meetup 일정 만들기</h2>
			<p style="margin: 0px; padding: 0px">
			<h4 style="margin: 0px; padding: 0px">4조 B4A3</h4>
			</p>
		</div>
		<div id="wrapper-sub2">
			<div id="wrapper-sub2-title">
				<p>
				<h4>Meetup 제목</h4>
				</p>
				<p>짧고 명료하게 설명해야 합니다.</p>
				<textarea rows="3" cols="80" id="sub2_textarea" name="sub2_textarea"></textarea>
				<span id="textCount">0</span>/2000
				<div id="sub2_field"></div>

			</div>
		</div>

		<div id="wrapper-sub3">
			<div id="wrapper-sub3-title">
				<p>
				<h4>날짜</h4>
				</p>
			</div>
		</div>
		<div id="wrapper-sub4">
			<div id="wrapper-sub4-title">
				<p>
				<h4>장소</h4>
				</p>
				<div>장소정하기</div>
				<div style="border: 1px solid red">
					<input id="pac-input" class="controls" type="text"
						placeholder="Search Box">
					<button type="button" id="submit" class="btn btn-default"
						style="height: 40px;">
						<span class="glyphicon glyphicon-search"></span>
					</button>
					<div id="sub4_field"></div>
					<div id="map" style="margin-left: 0px;"></div>
				</div>
				<div id="loc"></div>
				<div id="latlng"></div>
			</div>
		</div>

		<div id="wrapper-sub5">
			<div id="wrapper-sub5-title">
				<p>
				<h4>이벤트 내용</h4>
				</p>
				<span>대표사진</span>
				<p>이 Meetup을 가장 잘 나타내는 사진을 선택합니다.
				<div style="width: 600px; height: 200px;">
					<img src="img/10.jpg" style="width: 100%; height: 100%;">
				</div>
				<p style="margin-top: 30px;">설명 참석자에게 이벤트 목표, 준비물, 찾는 방법, 기타 필요한
					사항을 설명해주세요.</p>
				<textarea rows="6" cols="88" id="sub5_textarea"name="sub5_textarea"></textarea>
					<span id="textCount_sub5">0</span>/2000
				<div id="sub5_field"></div>
			</div>
		</div>
	</div>
	<div
		style="background-color: #f4f6f7; text-align: center; margin-top: -150px;">
		<button id="confirm" type="button" class="btn btn-default btn-lg">meetup
			게재하기</button>
	</div>
	<input type="hidden" >

	<script>
	var loc;
	var latlng;
	var sub2_textarea;
	var sub5_textarea;
			$('#submit').click(function() {
				var val = $('#pac-input').val();
				if (val == "") {
					$("#pac-input").css("border", "red 1px solid");
					$("#sub2-field").show();
					$("#sub2_field").css("color", "red");
					$("#map").hide();
				} else {
					$("#map").show();
					$("#sub4_field").hide();
					$("#pac-input").css("border", "black 1px solid");
					console.log(val);
				}
			})

			$("#confirm").click(function(){ 
				sub2_textarea = $("#sub2_textarea").val();
				sub5_textarea = $("#sub5_textarea").val();
				
				if(sub2_textarea == ""){
					$("#sub2_field").text("필수 필드입니다.");
					$("#sub2_field").css("color", "red");
					$("#sub2_textarea").css("border", "red 1px solid");
				} 
				
				if(sub5_textarea == ""){
					$("#sub5_field").text("필수 필드입니다.");
					$("#sub5_field").css("color", "red");
					$("#sub5_textarea").css("border", "red 1px solid");
				}
				
				if(sub2_textarea != "" && sub5_textarea != ""){
					alert("가즈아");
					alert(loc);
					alert(latlng);
					send();
				}
			})
			 
	<!-- 구글맵 스크립트 -->
		function initMap() {
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 15,
				center : {
					lat : 37.2664,
					lng : 126.9994
				},
				mapTypeId : 'roadmap'
			});

			var input = document.getElementById('pac-input');
			var searchBox = new google.maps.places.SearchBox(input);

			var geocoder = new google.maps.Geocoder();

			document.getElementById('submit').addEventListener('click',
					function() {
						geocodeAddress(geocoder, map);
					});
		}

		function geocodeAddress(geocoder, resultsMap) {
			var address = document.getElementById('pac-input').value;
			geocoder
					.geocode(
							{
								'address' : address
							},
							function(results, status) {
								if (status === 'OK') {
									resultsMap
											.setCenter(results[0].geometry.location);
									var marker = new google.maps.Marker({
										map : resultsMap,
										position : results[0].geometry.location
									});
									loc=address;
									latlng=marker.position;
									console.log("loc:"+loc);
									console.log("latlng:"+latlng);
								} else {
									alert('Geocode was not successful for the following reason: '
											+ status);
								}
							});
		}
		
		 function send(){
			document.msubmit.loc.value = loc;
			document.msubmit.latlng.value = latlng;
					} 
		
	</script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAqOC53EXTtReEkmhrJ4iY3zXOAotGVGWA&libraries=places&callback=initMap">
		
	</script>
	
	<input type="hidden" name= "loc" value="">
	<input type="hidden" name= "latlng" value="">  
</form>
<script>
	function meetingsubmit(){
		document.getElementById("msubmit").submit();
	}
</script>
</body>
</html>