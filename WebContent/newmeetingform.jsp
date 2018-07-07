<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<!-- 찬연 스크립트 -->

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/css/bootstrap-material-design.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/css/ripples.min.css" />
<link href='http://fonts.googleapis.com/css?family=Roboto:400,500'
	rel='stylesheet' type='text/css'>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.3.min.js"
	integrity="sha256-aaODHAgvwQW1bFOGXMeX+pC4PZIPsvn2h1sArYOhgXQ="
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/js/ripples.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/js/material.min.js"></script>
<script type="text/javascript"
	src="https://rawgit.com/FezVrasta/bootstrap-material-design/master/dist/js/material.min.js"></script>
<script type="text/javascript"
	src="http://momentjs.com/downloads/moment-with-locales.min.js"></script>
<link rel="stylesheet" href="css/bootstrap-material-datetimepicker.css" />
<script type="text/javascript"
	src="js/bootstrap-material-datetimepicker.js"></script>

<!-- 찬연 스크립트 끝-->


<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
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
(function(i, s, o, g, r, a, m) {
    i['GoogleAnalyticsObject'] = r;
    i[r] = i[r] || function() {
       (i[r].q = i[r].q || []).push(arguments)
       }, i[r].l = 1 * new Date();
       a = s.createElement(o),
       m = s.getElementsByTagName(o)[0];
       a.async = 1;
       a.src = g;
       m.parentNode.insertBefore(a, m)
    })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');
    ga('create', 'UA-60343429-1', 'auto');
    ga('send', 'pageview');
    
    /* 여기는 무슨 설명인지 안쓰여 있길래 설명할수가 없는점 양해부탁드립니다  */

    
    /* 글자수 카운터 */
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
	<form action="newmeeting.meet" method="post" id="msubmit"
		name="msubmit">
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
					<textarea rows="3" cols="80" id="sub2_textarea"
						name="sub2_textarea"></textarea>
					<span id="textCount">0</span>/2000
					<div id="sub2_field"></div>

				</div>
			</div>

			<div id="wrapper-sub3">
				<div id="wrapper-sub3-title">
					<p>
					<h4>날짜</h4>
					</p>
					<!-- <form id="insert" method="get" action="timesector.do"> -->
					<div class="container well"
						style="margin: 0 auto; width: 400px; height: 350px; border: 1px solid black;">
						<div class="row">
							<div class="col-md-6"></div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<div class="row">
									<div class="col-md-12">
										<div class="form-control-wrapper">
											<br>
											<br>
											<br> <label style="color: black;">시작 시간</label>&nbsp;&nbsp;
											<input type="text" id="date-start"
												class="form-control floating-label" id="start"
												placeholder="Start Date" name="start">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<div class="form-control-wrapper">
											<label style="color: black;">끝나는 시간</label>&nbsp;&nbsp;<input
												type="text" id="date-end"
												class="form-control floating-label" id="end"
												placeholder="End Date" name="end">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<br>
					<div id="sub3_field"
						style="margin: 0 auto; border: 1px solid black; width: 400px;">필수 필드입니다.</div>
					<!-- 						<button id="input" type="button">inputtest</button> -->
					<!-- 					</form> -->


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
					<input type="hidden" id="loc" name="loc" value="">
					<input type="hidden" id="latlng" name="latlng" value="">
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
						<img src="img/10.jpg" style="width: 100%; height: 100%;" id="meetimg" name="meetimg">
					</div>
					<p style="margin-top: 30px;">설명 참석자에게 이벤트 목표, 준비물, 찾는 방법, 기타
						필요한 사항을 설명해주세요.</p>
					<textarea rows="6" cols="88" id="sub5_textarea"
						name="sub5_textarea"></textarea>
					<span id="textCount_sub5">0</span>/2000
					<div id="sub5_field"></div>
				</div>
			</div>
		</div>
		<div
			style="background-color: #f4f6f7; text-align: center; margin-top: -150px;">
			<button id="confirm" class="btn btn-default btn-lg">meetup
				게재하기</button>
		</div>
		<input type="hidden" name="group_seq" value="${group_seq }">
</form>
	<script>	
		var loc;
		var latlng;
		var sub2_textarea;
		var sub5_textarea;
		var starttime;
		var endtime;
		var val;
		
		/* 구글맵 검색 클릭 */
			$('#submit').click(function() {
				val = $('#pac-input').val();
				if (val == "") {
					$("#pac-input").css("border", "red 1px solid");
					$("#sub2-field").show();
					$("#sub2_field").css("color", "red");
					$("#map").hide();
				} else {
					$("#map").show();
					$("#sub4_field").hide();
					$("#pac-input").css("border", "black 1px solid");
					$("#loc").text(loc);
					$("#latlng").text(latlng);
					console.log("location:"+val);
					mapvalue();
				}
			})
			
			$("#confirm").click(function(){ 
				sub2_textarea = $("#sub2_textarea").val();
				sub5_textarea = $("#sub5_textarea").val();
				starttime = $("#start").val();
				endtime=$("#end").val();
				
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
					alert("location:"+loc);
					alert("latlng:"+latlng);
					alert("starttime:"+starttime+", endtime:"+endtime);
					
					mapvalue();
					alert("보내지라고");
					meetingsubmit();
				}
			})
			
		function mapvalue(){
			console.log("in_mapvalue_loc:"+loc);
			console.log("in_mapvalue_loc:"+loc);
			document.msubmit.loc.value = loc;
			document.msubmit.latlng.value = latlng;
		} 
		
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
		
	</script>

		<input type="hidden" name="loc" value=""> 
		<input type="hidden" name="latlng" value="">
		
	
	
		 
	<script>
	function meetingsubmit(){
		document.getElementById("msubmit").submit();
	}
	</script>	

<script async defer
							src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAqOC53EXTtReEkmhrJ4iY3zXOAotGVGWA&libraries=places&callback=initMap">
		
	</script>
<!-- 찬연 스크립트 -->
		<script type="text/javascript">
      $(document).ready(function()
      {

         $('#date-end').bootstrapMaterialDatePicker
         ({
            weekStart: 0, format: 'YYYY/MM/DD/HH/mm',
            //format :  타입 
            minDate : new Date()
         }).on('change',function(e,date){
            $('#date-start').bootstrapMaterialDatePicker('setMaxDate', date);
         });
         $('#date-start').bootstrapMaterialDatePicker
         ({
            weekStart: 0, format: 'YYYY/MM/DD/HH/mm',
            minDate : new Date()
         //mindate : 최소 시간 시작지점 설정 
         }).on('change', function(e, date) //change 바뀔때마다  인지함 
         {
            $('#date-end').bootstrapMaterialDatePicker('setMinDate', date);
         });

         $('#min-date').bootstrapMaterialDatePicker({ format : 'YYYY/MM/DD/HH/mm', minDate : new Date() });

         $.material.init()
         
         $("#input").click(function() {
             $('#insert').submit();
         });
      });
      
	</script>
</body>
</html>