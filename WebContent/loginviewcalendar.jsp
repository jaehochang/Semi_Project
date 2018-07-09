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
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">

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

<style type="text/css">
		.dayby{
			margin-top: 5px;
			margin-bottom: 12px;
			margin-left: 45px;
			text-shadow: 2em;
			font-size: 15px;
			font-style: italic;
			font-family: sans-serif;
		}
		#myList{
			margin-top: 18px;
		}
		#datepicker{
			margin-top: 37px;
		}
		#today{
			margin-top: 10px;
			margin-right: 100px;
		}

		#printlist{
			margin-top: 18px;
			margin-left: 125px;
			margin-right: 1px;
			width: 500px;
			background-color: #D8D8D8;
				
		}
		#myList{
			margin-right: 29px;
			margin-left: 1px;
		}
		.list-group{
			margin-left: 20px;
			width: 255px;
			
		}
		
#gro:visited {
	background: gray;
	color: white;
}

#gro {
	background: black;
	color: white;
	font-size: 18px;
	line-height: 1.5;
	position: relative;
	top: 6px;
	width: 100px;
}

#cal:visited {
	background: gray;
	color: white;
}

#cal {
	background: black;
	color: white;
	font-size: 18px;
	line-height: 1.5;
	position: relative;
	top: 6px;
	width: 100px;
}
#search li:hover{
background-color: red;
	
}
		
		.dayby{
			font-weight: bold;
			text-align: left;
		}
	
		.block{
			border: 3px solid black;
		}
		.timehour{
			font-weight: bold;
			text-align: left;
			float: left;
		}
		.groupname{
			font-size: 20px;	
			vertical-align: middle;
		}
		
</style>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function() {
		
			navigator.geolocation.getCurrentPosition(function(position) {
				pos = {
						lat : position.coords.latitude,
						lng : position.coords.longitude

					  };
						alert("나의 위도 : " + pos.lat + " 나의 경도 : "+ pos.lng);
					});

				$("#search-bt").click(function() {
							alert($("#search-input").val());
							
							
							var val = pos.lat + ":" + pos.lng;
					        var dist = $("#distance-default").html();
					        var loc = $("#location-default").html();
					        var word =  $("#search-input").val();
					        
					        var today = new Date();
					        var dd = today.getDate();
					        var mm = today.getMonth()+1; 
					        var yyyy = today.getFullYear();

					        
					        $("#distrow").html("");
							$(".img_size").html("");
							$(".col-md4").html("");
							$(".img_div").html("");
							$("#distSearch2").html("");
					        $.ajax({
										url : "distanceKm.meet",
										type : "get",
										data : {
												value : val,
												distance : dist,
												location : loc,
												word : word,
												year : yyyy,
												month : mm,
										        day : dd
												},
							success : function(response) {
								var a = response.distSearchCount.toString().split(",");
						if(response.distSearchCount.length != 0){	
								for (var b = 0; b < response.distSearchCount.length; b++) {
									alert(a[b].split(":")[0] + "의 거리 " + a[b].split(":")[2]);
									$("#distrow").append("<h4 class=group_title1>"+a[b].split(":")[1]+"</h4>").trigger("create");
									$("#distrow").append("<h4 class=group_title1>"+a[b].split(":")[3]+"</h4>").trigger("create");	
								    $("#distrow").append("<a href='groupMain.group?group_seq="+a[b].split(":")[0]+"&page=info'><img src=files/"+a[b].split(":")[2]+" id=imgTag class=img_size style=width:230px; vspace=30; hspace=40;></a>");
								   														
								}
						}else{
							alert("결과값이 없습니다.");
						}
									},
									error : function() {
										console.log("에러 발생!");
									},
										complete : function() {
										console.log("성공이건 실패건 어찌되었든 ajax 종료");
								}
								});
				})
				$("#five_km").click(function() {

						alert("5km 입니다.");
						alert($("#location-default").html());
			      $("#distance-default").text("5km");
			      
					var val = pos.lat + ":" + pos.lng;
			        var dist = 5;
			        var loc = $("#location-default").html();
			        var word =  $("#search-input").val();
			        
			        var day = $("#datepicker").val();
			        
			        $("#distrow").html("");
					$(".img_size").html("");
					$(".col-md4").html("");
					$(".img_div").html("");
					$("#distSearch2").html("");
			        $.ajax({
								url : "distanceKm.meet",
								type : "get",
								data : {
										value : val,
										distance : dist,
										location : loc,
										day : day
										},
					success : function(response) {
						var a = response.distSearchCount.toString().split(",");
					if(response.distSearchCount.length != 0){	
						for (var b = 0; b < response.distSearchCount.length; b++) {
							alert(a[b].split(":")[0] + "의 거리 " + a[b].split(":")[2]);
							$("#distrow").append("<h4 class=group_title1>"+a[b].split(":")[1]+"</h4>").trigger("create");
							$("#distrow").append("<h4 class=group_title1>"+a[b].split(":")[3]+"</h4>").trigger("create");	
							$("#distrow").append("<a href='groupMain.group?group_seq="+a[b].split(":")[0]+"&page=info'><img src=files/"+a[b].split(":")[2]+" id=imgTag class=img_size style=width:230px; vspace=30; hspace=40;></a>");
						   														
						}
					}else{
						
						alert("결과값이 없습니다.");
					}
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
						$("#distance-default").html("10km");
						var val = pos.lat + ":" + pos.lng;
						var dist = 10;
						var loc = $("#location-default").html();
						var word =  $("#search-input").val();
						
						var day = $("#datepicker").val();
				        
						$("#distrow").html("");
						$(".img_size").html("");
						$(".col-md4").html("");
						$(".img_div").html("");
						$("#distSearch2").html("");
						
						$.ajax({
								url : "distanceKm.meet",
								type : "get",
								data : {
							      		value : val,
										distance : dist,
										location : loc,
										word : word,
										
										year : yyyy,
										month : mm,
								        day : dd

									   },
														
						success : function(response) {
									var a = response.distSearchCount.toString().split(",");
							if(response.distSearchCount.length != 0){
									for (var b = 0; b < response.distSearchCount.length; b++) {
										alert(a[b].split(":")[0] + "의 거리 " + a[b].split(":")[2]);
										$("#distrow").append("<h4 class=group_title1>"+a[b].split(":")[1]+"</h4>").trigger("create");	
										$("#distrow").append("<h4 class=group_title1>"+a[b].split(":")[3]+"</h4>").trigger("create");
										$("#distrow").append("<a href='groupMain.group?group_seq="+a[b].split(":")[0]+"&page=info'><img src=files/"+a[b].split(":")[2]+" id=imgTag class=img_size style=width:230px; vspace=30; hspace=40;></a>");
									
									}	
							}else{
								alert("결과값이 없습니다");
							}
					    },
						error : function() {

							console.log("에러 발생!");
						},
						complete : function() {
								console.log("성공이건 실패건 어찌되었든 ajax 종료");
						}

						});
					})
					$("#fifteen_km").click(function() {
							alert("15km 입니다.");
							$("#distance-default").html("15km");
							var val = pos.lat + ":" + pos.lng;
							var dist = 15;
							var loc = $("#location-default").html();
							var word =  $("#search-input").val();
							
							var day = $("#datepicker").val();
					        
							$("#distrow").html("");
							$(".img_size").html("");
							$(".col-md4").html("");
							$(".img_div").html("");
							$("#distSearch2").html("");
							$.ajax({
									url : "distanceKm.group",
								    type : "get",
									data : {
									   value : val,
									   distance : dist,
									   location : loc,
									   word : word,
									   year : yyyy,
										month : mm,
								        day : dd
									},
									success : function(response) {
															
									var a = response.distSearchCount.toString().split(",");
					if(response.distSearchCount.length != 0){
					      for (var b = 0; b < response.distSearchCount.length; b++) {
							alert(a[b].split(":")[1] + "의 거리 " + a[b].split(":")[2]);
							$("#distrow").append("<h4 class=group_title1>"+a[b].split(":")[1]+"</h4>").trigger("create");	
							$("#distrow").append("<h5 style='position:absolute; z-index:100; top:1000px; padding-left:100px; left:600px; line-height:5;'>"+a[b].split(":")[3]+"</h5>").trigger("create");
						    $("#distrow").append("<a href='groupMain.group?group_seq="+a[b].split(":")[0]+"&page=info'><img src=files/"+a[b].split(":")[2]+" id=imgTag class=img_size style=width:230px; vspace=30; hspace=40;></a>");
						   					
															
						}
					}else{
						alert("결과값이 없습니다.");
					}
							
					},
					error : function() {

						console.log("에러 발생!");
					},
					complete : function() {
						console.log("성공이건 실패건 어찌되었든 ajax 종료");
					}

				    });
					})
					$("#all_km").click(
						function() {
						 alert("모든거리 입니다.");
						$("#distance-default").html("모든거리");
						
						var val = pos.lat + ":" + pos.lng;
						var dist = $("#distance-default").html();
						var loc = $("#location-default").html();
						var word =  $("#search-input").val();
						
						var day = $("#datepicker").val();
						$("#distrow").html("");
						$(".img_size").html("");
						$(".col-md4").html("");
						$(".img_div").html("");
						$("#distSearch2").html("");
						$.ajax({
								url : "distanceKm.group",
							    type : "get",
								data : {
								   value : val,
								   distance : dist,
								   location : loc,
								   word : word,
								   year : yyyy,
									month : mm,
							        day : dd
								},
								success : function(response) {
														
								var a = response.distSearchCount.toString().split(",");
					if(response.distSearchCount.length != 0){
				      for (var b = 0; b < response.distSearchCount.length; b++) {
						alert(a[b].split(":")[1] + "의 거리 " + a[b].split(":")[2]);
						$("#distrow").append("<h4 class=group_title1>"+a[b].split(":")[1]+"</h4>").trigger("create");	
						$("#distrow").append("<h4 class=group_title1>"+a[b].split(":")[3]+"</h4>").trigger("create");
						$("#distrow").append("<a href='groupMain.group?group_seq="+a[b].split(":")[0]+"&page=info'><img src=files/"+a[b].split(":")[2]+" id=imgTag class=img_size style=width:230px; vspace=30; hspace=40;></a>");									
					}
					}else{
						alert("결과값이 없습니다.")
						
					}	
				},
				error : function() {

					console.log("에러 발생!");
				},
				complete : function() {
					console.log("성공이건 실패건 어찌되었든 ajax 종료");
				}

			    });
						})
					
					$("#navigation-list").hide();
					$("#search-input").click(function(){
						
						$("#navigation-list").slideToggle(300);

					})
					
					$("#searchLocation").keyup(function(e){
						
						if(e.keyCode == 13){
							alert($("#searchLocation").val());
							$("#location-default").html($("#searchLocation").val());
							alert($("#distance-default").html());
						
						
						var val = pos.lat + ":" + pos.lng;
						var dist = $("#distance-default").html();
						var loc = $("#searchLocation").val();
						var word =  $("#search-input").val();
						
						var day = $("#datepicker").val();
						
						$("#distrow").html("");
						$(".img_size").html("");
						$(".col-md4").html("");
						$(".img_div").html("");
						$("#distSearch2").html("");
						
						$.ajax({
								url : "distanceKm.group",
							    type : "get",
							    
								data : {
								   value : val,
								   distance : dist,
								   location : loc,
								   word : word,
								   year : yyyy,
									month : mm,
							        day : dd
								},
								
								success : function(response) {
														
								var a = response.distSearchCount.toString().split(",");
								
				if(response.distSearchCount.length != 0){
					
				      for (var b = 0; b < response.distSearchCount.length; b++) {
						alert(a[b].split(":")[1] + "의 거리 " + a[b].split(":")[2]);
						$("#distrow").append("<h4 class=group_title1>"+a[b].split(":")[1]+"</h4>").trigger("create");	
						$("#distrow").append("<h4 class=group_title1>"+a[b].split(":")[3]+"</h4>").trigger("create");
						$("#distrow").append("<a href='groupMain.group?group_seq="+a[b].split(":")[0]+"&page=info'><img src=files/"+a[b].split(":")[2]+" id=imgTag class=img_size style=width:230px; vspace=30; hspace=40;></a>");
					   					
														
					}
				}else{
					alert("결과값이 없습니다.")
					$("#distrow").after("<h4 class=group_title1>결과 값이 없습니다.</h4>").trigger("create");				
				  }	
				},
				error : function() {

					console.log("에러 발생!");
				},
				complete : function() {
					console.log("성공이건 실패건 어찌되었든 ajax 종료");
				}

			    });
						}	
						});
					
					$("#eatout").click(function(){
					   
						alert($("#eatout").html());
						$("#search-input").val($("#eatout").html());
						$("#navigation-list").hide();
						var val = pos.lat + ":" + pos.lng;
						var dist = $("#distance-default").html();
						var loc = $("#location-default").html();
						var word =  $("#search-input").val();
						
						var day = $("#datepicker").val();
						$("#distrow").html("");
						$(".img_size").html("");
						$(".col-md4").html("");
						$(".img_div").html("");
						$("#distSearch2").html("");
						$.ajax({
								url : "distanceKm.group",
							    type : "get",
								data : {
								   value : val,
								   distance : dist,
								   location : loc,
								   word : word
								},
								success : function(response) {
														
								var a = response.distSearchCount.toString().split(",");
					if(response.distSearchCount.length != 0){
				      for (var b = 0; b < response.distSearchCount.length; b++) {
						alert(a[b].split(":")[1] + "의 거리 " + a[b].split(":")[2]);
						$("#distrow").append("<h4 class=group_title1>"+a[b].split(":")[1]+"</h4>").trigger("create");	
						$("#distrow").append("<h4 class=group_title1>"+a[b].split(":")[3]+"</h4>").trigger("create");
						$("#distrow").append("<a href='groupMain.group?group_seq="+a[b].split(":")[0]+"&page=info'><img src=files/"+a[b].split(":")[2]+" id=imgTag class=img_size style=width:230px; vspace=30; hspace=40;></a>");									
					}
					}else{
						alert("결과값이 없습니다.")
						
					}	
				},
				error : function() {

					console.log("에러 발생!");
				},
				complete : function() {
					console.log("성공이건 실패건 어찌되었든 ajax 종료");
				}

			    });
						
						
					});
						
					

					})
					
</script>
</head>

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

	<div id="search" style="left: 0px; z-index: 10">
		<div class="col-xs-4">
		  <a data-toggle="dropdown" aria-expanded="false"  font-size: medium; padding-left: 3"><input id="search-input" type="text" placeholder="전체 Meetup 이벤트" style="width: 270px; height: 34px;  border-radius: 5px;"></a>
			<ul class="dropdown-menu" role="menu" style="position: absolute; z-index: 150; width: 900px">
				<li style="float: left; overflow: hidden; width:220px"><a href="#" id="eatout">외식</a></li>
				<li style="float: left; overflow: hidden; width:220px"><a href="#" id="family">가족</a></li>
				<li style="float: left; overflow: hidden; width:220px"><a href="#" id="">친척</a></li>
				<li style="float: left; overflow: hidden; width:220px"><a href="#" id="">안녕</a></li>
				<li style="float: left; overflow: hidden; width:220px"><a href="#" id="">asdasd</a></li>
				<li style="float: left; overflow: hidden; width:220px"><a href="#" id="">안녕</a></li>
				<li style="float: left; overflow: hidden; width:220px"><a href="#" id="">안녕</a></li>
				<li style="float: left; overflow: hidden; width:220px"><a href="#" id="">안녕</a></li>
				<li style="float: left; overflow: hidden; width:220px"><a href="#" id="">안녕</a></li>
				<li style="float: left; overflow: hidden; width:220px"><a href="#" id="">안녕</a></li>
				<li style="float: left; overflow: hidden; width:220px"><a href="#" id="">안녕</a></li>
				<li style="float: left; overflow: hidden; width:220px"><a href="#" id="">안녕</a></li>
				<li style="float: left; overflow: hidden; width:220px"><a href="#" id="">안녕</a></li>
				<li style="float: left; overflow: hidden; width:220px"><a href="#" id="">안녕</a></li>
				<li style="float: left; overflow: hidden; width:220px"><a href="#" id="">안녕</a></li>
				<li style="float: left; overflow: hidden; width:220px"><a href="#" id="">안녕</a></li>
				<li style="float: left; overflow: hidden; width:220px"><a href="#" id="">안녕</a></li>
				<li style="float: left; overflow: hidden; width:220px"><a href="#" id="">안녕</a></li>
				<li style="float: left; overflow: hidden; width:220px"><a href="#" id="">안녕</a></li>
				<li style="float: left; overflow: hidden; width:220px"><a href="#" id="">안녕</a></li>
			</ul>
			
			

	


			<button type="button" class="btn btn-default" aria-label="Left Align"
				id="search-bt" style="background-color: white;">
				<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
			</button>
		</div>
		<h5 id="location-text">내</h5>
		<div class="btn-group" id="location-km">
			<a data-toggle="dropdown" aria-expanded="false" id="distance-default" style="color: white; font-size: medium; line-height: 2.2; padding-left: 3; text-decoration: underline;">5km</a>
			<ul class="dropdown-menu" role="menu">
				<li><a href="#" id="five_km">5km</a></li>
				<li><a href="#" id="ten_km">10km</a></li>
				<li><a href="#" id="fifteen_km">15km</a></li>
				<li><a href="#" id="all_km">모든거리</a></li>
			</ul>
		</div>


		<div class="btn-group"
			style="position: absolute; bottom: 15px; left: 450px;">
			<a data-toggle="dropdown" aria-expanded="false" id="location-default" style="color: white; font-size: medium; line-height: 2.2; position: relative; right: 25px; text-decoration: underline;">서울</a>
			<ul class="dropdown-menu" role="menu" id="dropdown-location" style="padding-right:5 ">
				<li><input keyup="enterkey();" type=text id="searchLocation"></li>
			</ul>
		</div>

		<script>
			$('#dropdown-location').click(function(e) {
				e.stopPropagation();
				
			});
		</script>

		<h5 id="location-text2">의</h5>

		<div class="btn-group" role="group" id="search-check"
			style="position: absolute; bottom: 15px; left: 680px; width: 250px">
			<button type="button" class="btn btn-default" id="gro">그룹</button>
			<button type="button" class="btn btn-default" id="cal">캘린더</button>
		</div>
	</div>

<div class="container" >
	<div class="row" style="text-align:center; margin: 0 auto;">
	
	    <div class="col-8 col-md-8 col-sm-8" id="printlist" ></div>
		<div class="col-4 col-md-4 col-sm-4 pull-right" id="myList" role="tablist">
		<div class="list-group" id="choice" >
  		<a class="list-group-item list-group-item-action active" data-toggle="list" href="#printlist" role="tab" id="alllist" data-value="all">All</a>
  		<a class="list-group-item list-group-item-action" data-toggle="list" href="#printlist" role="tab" id="recolist" data-value="recommend">Recommend</a>
		<a class="list-group-item list-group-item-action " data-toggle="list" href="#printlist" role="tab" id="mymeetnow" data-value="mymeet">My meet 들</a>
  		<a class="list-group-item list-group-item-action" data-toggle="list" href="#printlist" role="tab" id="comein" data-value="check">참석하는 Meet</a>
  		</div>
	 	<button type="button" id="today" class="pull-right">today</button>
		<div class="col-4 col-md-4 col-sm-4 " id="datepicker"></div>
		</div>
	</div>
</div>

	<div class="container">
	<div class="row">
	</div>
		<div class="row">
		</div>
	</div>
<div class="container">
		
</div>


	

	<div id="moreGroup">
		<button type="button" class="btn btn-default btn-lg btn-block"
			style="height: 30px; padding: 0px;">더보기</button>
	</div>


	
		<%@ include file="include/bottom.jsp"%>


	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript">
     
	//damn = $(".list-group > a").text();
	//alert(damn);
	//damn = $(".list-group > .active").text();
	//alert(damn);
	//var suck = $(".list-group > .active").data("value");
	//alert(suck+"맞을듯");
	
	setTimeout(function() {
		
		$.ajax({
			url:"calendarfirst.meet",
			type:"post",
			dataType : "json",
			success:function(response){
				console.log(response);
				console.log("AJAX Request 성공 ");
				$("#printlist").text('');
					for(var i=0;i<response.length;i++){
						var seq = response[i].groseq;
						var day = response[i].date;
						var hour = response[i].hour;
						var group = response[i].groupName;
						var title =  response[i].groupTitle;
						var location = response[i].location;
						var month = response[i].month;
						
						if(i>0){
						  	
						  	   if(response[i].date == response[i-1].date){
						  		 $("#printlist").html($("#printlist").html()+"<div class=panel panel-default>"+"<div class=panel-heading block>"+"<div class=timehour>"+hour+"</div>"  
									  	   +"<div class=groupname>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>"+"</div>"+"</div>"
									  	 );
						  	   }else{
						  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading block>"
						  				 +"<div class=timehour>"+hour+"</div>"+"<div class=groupname>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>"+"</div>"+"</div>"
									  	 );
						  	   }
						  	   }else{
						  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading block >"
						  				 +"<div class=timehour>"+hour+"</div>"+"<div class=groupname>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>"+"</div>"+"</div>"
									  	 );
						  	   }
						 
					}
			},
			error:function(request,status,error){
				console.log(request.status+":"+status.responseText+":"+ error);
			},
			complete:function(){
				console.log("성공이건 실패건 어찌되었든 ajax 종료");
			}
		});
	}, 100);
     
    
	$("#datepicker").datepicker({
		dateFormat:"yy/mm/dd",
		onSelect: findEvents
	});
	
	function findEvents (date) { 
		
		//var showtypes = $(".list-group > .active").text();
		var showtypes = $(".list-group > .active").data("value");
		
		if(showtypes == "all"){
		$.ajax({
			url:"calendarchoice.meet",
			type:"post",
			data:{
				val:date,
				
				
			},
			dataType : "json",
			success:function(response){
				console.log("AJAX Request 성공 ");
				console.log(response);
				$("#printlist").text('');
				  if(response.length > 0){
					for(var i=0;i<response.length;i++){
						var seq = response[i].groseq;
						var day = response[i].date;
						var hour = response[i].hour;
						var group = response[i].groupName;
						var title =  response[i].groupTitle;
				  	   var location = response[i].location;
				  	   
				  	   if(i>0){
					  	   if(response[i].date == response[i-1].date){
					  			 $("#printlist").html($("#printlist").html()+"<div class=panel panel-default>"+"<div class=panel-heading block>"+"<div class=timehour>"+hour+"</div>"  
									  	   +"<div class=groupname>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>"+"</div>"+"</div>"
									  	 );
					  	   }else{
					  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading block>"
					  				 +"<div class=timehour>"+hour+"</div>" +"<div class=groupname>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>" +"</div>"+"</div>"
								  	 );
					  	   }
				  	   }else{
				  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading block>"+
				  		 "<div class=timehour>"+hour+"</div>"+"<div class=groupname>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>" +"</div>"+"</div>"
						 );
				  	   }
				  	   
						}
				  	  }else{
				  		 $("#printlist").html($("#printlist").html()+"<div class=dayby>"+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading block>"+
						  		 "<div>"+"</div>"+"<div>"+"</div>"+"<div>"+"<h3>"+"해당하는 일치하는 값이 없습니다"+"</h3>"+"</div>" +"</div>"+"</div>"
								 );
				  	  }
			},
			error:function(request,status,error){
				console.log(request.status+":"+status.responseText+":"+ error);
			},
			complete:function(){
				console.log("성공이건 실패건 어찌되었든 ajax 종료");
			}
		});
		
		}else if(showtypes == "recommend"){
			
			$.ajax({
				url:"recommend.meet",
				type:"post",
				data:{val:date},
				dataType : "json",
				success:function(response){
					console.log("AJAX Request 성공 ");
					console.log(response);
					$("#printlist").text('');
					  if(response.length > 0){
						for(var i=0;i<response.length;i++){
							var seq = response[i].groseq;
							var day = response[i].date;
							var hour = response[i].hour;
							var group = response[i].groupName;
							var title =  response[i].groupTitle;
					  	   var location = response[i].location;
					  	   
					  	   if(i>0){
						  	   if(response[i].date == response[i-1].date){
						  			 $("#printlist").html($("#printlist").html()+"<div class=panel panel-default>"+"<div class=panel-heading block>"+"<div class=timehour>"+hour+"</div>"  
										  	   +"<div class=groupname>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>"+"</div>"+"</div>"
										  	 );
						  	   }else{
						  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading block>"
						  				 +"<div class=timehour>"+hour+"</div>" +"<div class=groupname>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>" +"</div>"+"</div>"
									  	 );
						  	   }
					  	   }else{
					  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading block>"+
					  		 "<div class=timehour>"+hour+"</div>"+"<div class=groupname>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>" +"</div>"+"</div>"
							 );
					  	   }
					  	   
							}
					  	  }else{
					  		 $("#printlist").html($("#printlist").html()+"<div class=dayby>"+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading block>"+
							  		 "<div>"+"</div>"+"<div>"+"</div>"+"<div>"+"<h3>"+"해당하는 일치하는 값이 없습니다"+"</h3>"+"</div>" +"</div>"+"</div>"
									 );
					  	  }
				},
				error:function(request,status,error){
					console.log(request.status+":"+status.responseText+":"+ error);
				},
				complete:function(){
					console.log("성공이건 실패건 어찌되었든 ajax 종료");
				}
			});
			
		}else if(showtypes == "mymeet"){
			$.ajax({
				url:"mymeet.meet",
				type:"post",
				data:{val:date},
				dataType : "json",
				success:function(response){
					console.log("AJAX Request 성공 ");
					console.log(response);
					$("#printlist").text('');
					  if(response.length > 0){
						for(var i=0;i<response.length;i++){
							var seq = response[i].groseq;
							var day = response[i].date;
							var hour = response[i].hour;
							var group = response[i].groupName;
							var title =  response[i].groupTitle;
					  	   var location = response[i].location;
					  	   
					  	   if(i>0){
					  	
						  	   if(response[i].date == response[i-1].date){
						  			 $("#printlist").html($("#printlist").html()+"<div class=panel panel-default>"+"<div class=panel-heading block>"+"<div class=timehour>"+hour+"</div>"  
										  	   +"<div class=groupname>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>"+"</div>"+"</div>"
										  	 );
						  	   }else{
						  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading block>"
						  				 +"<div class=timehour>"+hour+"</div>" +"<div class=groupname>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>" +"</div>"+"</div>"
									  	 );
						  	   }
					  	   }else{
					  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading block>"+
					  				 "<div class=timehour>"+hour+"</div>"+"<div class=groupname>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>" +"</div>"+"</div>"
								  	 );
					  	   }
					  	
						}
						
					  }else{
						  $("#printlist").html($("#printlist").html()+"<div class=dayby>"+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading block>"+
							  		 "<div>"+"</div>"+"<div>"+"</div>"+"<div>"+"<h3>"+"해당하는 일치하는 값이 없습니다"+"</h3>"+"</div>" +"</div>"+"</div>"
									 );
					  	  }
						
				},
				error:function(request,status,error){
					console.log(request.status+":"+status.responseText+":"+ error);
				},
				complete:function(){
					console.log("성공이건 실패건 어찌되었든 ajax 종료");
				}
			});
			
		}else if(showtypes == "check"){
			$.ajax({
				url:"checkup.meet",
				type:"post",
				data:{val:date},
				dataType : "json",
				success:function(response){
					console.log("AJAX Request 성공 ");
					console.log(response);
					$("#printlist").text('');
					  if(response.length > 0){
						for(var i=0;i<response.length;i++){
							var seq = response[i].groseq;
							var day = response[i].date;
							var hour = response[i].hour;
							var group = response[i].groupName;
							var title =  response[i].groupTitle;
					  	   var location = response[i].location;
					  	   
					  	   if(i>0){
					  	
						  	   if(response[i].date == response[i-1].date){
						  			 $("#printlist").html($("#printlist").html()+"<div class=panel panel-default>"+"<div class=panel-heading block>"+"<div class=timehour>"+hour+"</div>"  
										  	   +"<div class=groupname>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>"+"</div>"+"</div>"
										  	 );
						  	   }else{
						  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading block>"
						  				 +"<div class=timehour>"+hour+"</div>" +"<div class=groupname>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>" +"</div>"+"</div>"
									  	 );
						  	   }
					  	   }else{
					  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading block>"+
					  				 "<div class=timehour>"+hour+"</div>"+"<div class=groupname>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>" +"</div>"+"</div>"
								  	 );
					  	   }
					  	
						}
						
					  }else{
						  $("#printlist").html($("#printlist").html()+"<div class=dayby>"+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading block>"+
							  		 "<div>"+"</div>"+"<div>"+"</div>"+"<div>"+"<h3>"+"해당하는 일치하는 값이 없습니다"+"</h3>"+"</div>" +"</div>"+"</div>"
									 );
					  	  }	
						
				},
				error:function(request,status,error){
					console.log(request.status+":"+status.responseText+":"+ error);
				},
				complete:function(){
					console.log("성공이건 실패건 어찌되었든 ajax 종료");
				}
			});
		}
			
	}
	//datawhat = $("#datepicker").val();
	//alert(datawhat);
	$("#today").click(function() {
		$("#datepicker").datepicker('setDate', new Date());
		var showtypes = $(".list-group > .active").data("value");
		var date = $("#datepicker").val();
		if(showtypes == "all"){
			$.ajax({
				url:"calendarchoice.meet",
				type:"post",
				data:{val:date},
				dataType : "json",
				success:function(response){
					console.log("AJAX Request 성공 ");
					console.log(response);
					$("#printlist").text('');
					if(response.length > 0){
						for(var i=0;i<response.length;i++){
							var seq = response[i].groseq;
							var day = response[i].date;
							var hour = response[i].hour;
							var group = response[i].groupName;
							var title =  response[i].groupTitle;
					  	   var location = response[i].location;
					  	   
					  	   if(i>0){
					  	
						  	   if(response[i].date == response[i-1].date){
						  			 $("#printlist").html($("#printlist").html()+"<div class=panel panel-default>"+"<div class=panel-heading block>"+"<div class=timehour>"+hour+"</div>"  
										  	   +"<div class=groupname>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>"+"</div>"+"</div>"
										  	 );
						  	   }else{
						  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading block>"
						  				 +"<div class=timehour>"+hour+"</div>" +"<div class=groupname>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>" +"</div>"+"</div>"
									  	 );
						  	   }
					  	   }else{
					  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading block>"+
					  				 "<div class=timehour>"+hour+"</div>"+"<div class=groupname>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>" +"</div>"+"</div>"
								  	 );
					  	   }
					  	
						}
						
					}else{
						 $("#printlist").html($("#printlist").html()+"<div class=dayby>"+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading block>"+
						  		 "<div>"+"</div>"+"<div>"+"</div>"+"<div>"+"<h3>"+"해당하는 일치하는 값이 없습니다"+"</h3>"+"</div>" +"</div>"+"</div>"
								 );
				  	  }	
				},
				error:function(request,status,error){
					console.log(request.status+":"+status.responseText+":"+ error);
				},
				complete:function(){
					console.log("성공이건 실패건 어찌되었든 ajax 종료");
				}
			});
		}else if(showtypes == "recommend"){
			
			$.ajax({
				url:"recommend.meet",
				type:"post",
				data:{val:date},
				dataType : "json",
				success:function(response){
					console.log("AJAX Request 성공 ");
					console.log(response);
					$("#printlist").text('');
					  if(response.length > 0){
						for(var i=0;i<response.length;i++){
							var seq = response[i].groseq;
							var day = response[i].date;
							var hour = response[i].hour;
							var group = response[i].groupName;
							var title =  response[i].groupTitle;
					  	   var location = response[i].location;
					  	   
					  	   if(i>0){
						  	   if(response[i].date == response[i-1].date){
						  			 $("#printlist").html($("#printlist").html()+"<div class=panel panel-default>"+"<div class=panel-heading block>"+"<div class=timehour>"+hour+"</div>"  
										  	   +"<div class=groupname>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>"+"</div>"+"</div>"
										  	 );
						  	   }else{
						  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading block>"
						  				 +"<div class=timehour>"+hour+"</div>" +"<div class=groupname>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>" +"</div>"+"</div>"
									  	 );
						  	   }
					  	   }else{
					  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading block>"+
					  		 "<div class=timehour>"+hour+"</div>"+"<div class=groupname>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>" +"</div>"+"</div>"
							 );
					  	   }
					  	   
							}
					  	  }else{
					  		 $("#printlist").html($("#printlist").html()+"<div class=dayby>"+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading block>"+
							  		 "<div>"+"</div>"+"<div>"+"</div>"+"<div>"+"<h3>"+"해당하는 일치하는 값이 없습니다"+"</h3>"+"</div>" +"</div>"+"</div>"
									 );
					  	  }
				},
				error:function(request,status,error){
					console.log(request.status+":"+status.responseText+":"+ error);
				},
				complete:function(){
					console.log("성공이건 실패건 어찌되었든 ajax 종료");
				}
			});
			
		}else if(showtypes == "mymeet"){
			$.ajax({
				url:"mymeet.meet",
				type:"post",
				data:{val:date},
				dataType : "json",
				success:function(response){
					console.log("AJAX Request 성공 ");
					console.log(response);
					$("#printlist").text('');
					if(response.length > 0){
						for(var i=0;i<response.length;i++){
							var seq = response[i].groseq;
							var day = response[i].date;
							var hour = response[i].hour;
							var group = response[i].groupName;
							var title =  response[i].groupTitle;
					  	   var location = response[i].location;
					  	   
					  	   if(i>0){
					  	
						  	   if(response[i].date == response[i-1].date){
						  			 $("#printlist").html($("#printlist").html()+"<div class=panel panel-default>"+"<div class=panel-heading block>"+"<div class=timehour>"+hour+"</div>"  
										  	   +"<div class=groupname>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>"+"</div>"+"</div>"
										  	 );
						  	   }else{
						  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading block>"
						  				 +"<div class=timehour>"+hour+"</div>" +"<div class=groupname>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>" +"</div>"+"</div>"
									  	 );
						  	   }
					  	   }else{
					  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading block>"+
					  				 "<div class=timehour>"+hour+"</div>"+"<div class=groupname>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>" +"</div>"+"</div>"
								  	 );
					  	   }
					  	
						}
						
					}else{
						 $("#printlist").html($("#printlist").html()+"<div class=dayby>"+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading block>"+
						  		 "<div>"+"</div>"+"<div>"+"</div>"+"<div>"+"<h3>"+"해당하는 일치하는 값이 없습니다"+"</h3>"+"</div>" +"</div>"+"</div>"
								 );
				  	  }	
				},
				error:function(request,status,error){
					console.log(request.status+":"+status.responseText+":"+ error);
				},
				complete:function(){
					console.log("성공이건 실패건 어찌되었든 ajax 종료");
				}
			});
			
		}else if(showtypes == "check"){
			$.ajax({
				url:"checkup.meet",
				type:"post",
				data:{val:date},
				dataType : "json",
				success:function(response){
					console.log("AJAX Request 성공 ");
					console.log(response);
					$("#printlist").text('');
					if(response.length > 0){
						for(var i=0;i<response.length;i++){
							var seq = response[i].groseq;
							var day = response[i].date;
							var hour = response[i].hour;
							var group = response[i].groupName;
							var title =  response[i].groupTitle;
					  	   var location = response[i].location;
					  	   
					  	   if(i>0){
					  	
						  	   if(response[i].date == response[i-1].date){
						  			 $("#printlist").html($("#printlist").html()+"<div class=panel panel-default>"+"<div class=panel-heading block>"+"<div class=timehour>"+hour+"</div>"  
										  	   +"<div class=groupname>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>"+"</div>"+"</div>"
										  	 );
						  	   }else{
						  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading block>"
						  				 +"<div class=timehour>"+hour+"</div>" +"<div class=groupname>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>" +"</div>"+"</div>"
									  	 );
						  	   }
					  	   }else{
					  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading block>"+
					  				 "<div class=timehour>"+hour+"</div>"+"<div class=groupname>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>" +"</div>"+"</div>"
								  	 );
					  	   }
					  	
						}
						
					}else{
						 $("#printlist").html($("#printlist").html()+"<div class=dayby>"+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading block>"+
						  		 "<div>"+"</div>"+"<div>"+"</div>"+"<div>"+"<h3>"+"해당하는 일치하는 값이 없습니다"+"</h3>"+"</div>" +"</div>"+"</div>"
								 );
				  	  }	
				},
				error:function(request,status,error){
					console.log(request.status+":"+status.responseText+":"+ error);
				},
				complete:function(){
					console.log("성공이건 실패건 어찌되었든 ajax 종료");
				}
			});
		}
		
		
	});
	
	$("#alllist").click(function() {
		var nowdata = $("#datepicker").val();
		$.ajax({
			url:"calendarchoice.meet",
			type:"post",
			data:{val:nowdata},
			dataType : "json",
			success:function(response){
				console.log("AJAX Request 성공 ");
				console.log(response);
				$("#printlist").text('');
				if(response.length > 0){
					for(var i=0;i<response.length;i++){
						var seq = response[i].groseq;
						var day = response[i].date;
						var hour = response[i].hour;
						var group = response[i].groupName;
						var title =  response[i].groupTitle;
				  	   var location = response[i].location;
				  	   
				  	   
				  	   
				  	   if(i>0){
					  	   if(response[i].date == response[i-1].date){
					  			 $("#printlist").html($("#printlist").html()+"<div class=panel panel-default>"+"<div class=panel-heading block>"+"<div class=timehour>"+hour+"</div>"  
									  	   +"<div class=groupname>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>"+"</div>"+"</div>"
									  	 );
					  	   }else{
					  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading block>"
					  				 +"<div class=timehour>"+hour+"</div>" +"<div class=groupname>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>" +"</div>"+"</div>"
								  	 );
					  	   }
				  	   }else{
				  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading block>"+
				  				 "<div class=timehour>"+hour+"</div>"+"<div class=groupname>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>" +"</div>"+"</div>"
							  	 );
				  	   }
				  	   
					}
					
				}else{
					 $("#printlist").html($("#printlist").html()+"<div class=dayby>"+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading block>"+
					  		 "<div>"+"</div>"+"<div>"+"</div>"+"<div>"+"<h3>"+"해당하는 일치하는 값이 없습니다"+"</h3>"+"</div>" +"</div>"+"</div>"
							 );
			  	  }		
					
			},
			error:function(request,status,error){
				console.log(request.status+":"+status.responseText+":"+ error);
			},
			complete:function(){
				console.log("성공이건 실패건 어찌되었든 ajax 종료");
			}
		});
	});
	
	$("#comein").click(function() {
		var nowdata = $("#datepicker").val();
		$.ajax({
			url:"checkup.meet",
			type:"post",
			data:{val:nowdata},
			dataType : "json",
			success:function(response){
				console.log("AJAX Request 성공 ");
				console.log(response);
				$("#printlist").text('');
				if(response.length > 0){
					for(var i=0;i<response.length;i++){
						var seq = response[i].groseq;
						var day = response[i].date;
						var hour = response[i].hour;
						var group = response[i].groupName;
						var title =  response[i].groupTitle;
				  	   var location = response[i].location;
				  	   
				  	   if(i>0){
				  	
					  	   if(response[i].date == response[i-1].date){
					  			 $("#printlist").html($("#printlist").html()+"<div class=panel panel-default>"+"<div class=panel-heading block>"+"<div class=timehour>"+hour+"</div>"  
									  	   +"<div class=groupname>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>"+"</div>"+"</div>"
									  	 );
					  	   }else{
					  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading block>"
					  				 +"<div class=timehour>"+hour+"</div>" +"<div class=groupname>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>" +"</div>"+"</div>"
								  	 );
					  	   }
				  	   }else{
				  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading block>"+
				  				 "<div class=timehour>"+hour+"</div>"+"<div class=groupname>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>" +"</div>"+"</div>"
							  	 );
				  	   }
				  	
					}
					
				}else{
					 $("#printlist").html($("#printlist").html()+"<div class=dayby>"+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading block>"+
					  		 "<div>"+"</div>"+"<div>"+"</div>"+"<div>"+"<h3>"+"해당하는 일치하는 값이 없습니다"+"</h3>"+"</div>" +"</div>"+"</div>"
							 );
			  	  }		
			},
			error:function(request,status,error){
				console.log(request.status+":"+status.responseText+":"+ error);
			},
			complete:function(){
				console.log("성공이건 실패건 어찌되었든 ajax 종료");
			}
		});
	});
	
	$("#mymeetnow").click(function() {
		var nowdata = $("#datepicker").val();
		$.ajax({
			url:"mymeet.meet",
			type:"post",
			data:{val:nowdata},
			dataType : "json",
			success:function(response){
				console.log("AJAX Request 성공 ");
				console.log(response);
				$("#printlist").text('');
				if(response.length > 0){
					for(var i=0;i<response.length;i++){
						var seq = response[i].groseq;
						var day = response[i].date;
						var hour = response[i].hour;
						var group = response[i].groupName;
						var title =  response[i].groupTitle;
				  	   var location = response[i].location;
				  	   
				  	   if(i>0){
				  	
					  	   if(response[i].date == response[i-1].date){
					  			 $("#printlist").html($("#printlist").html()+"<div class=panel panel-default>"+"<div class=panel-heading block>"+"<div class=timehour>"+hour+"</div>"  
									  	   +"<div class=groupname>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>"+"</div>"+"</div>"
									  	 );
					  	   }else{
					  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default >"+"<div class=panel-heading block>"
					  				 +"<div class=timehour>"+hour+"</div>" +"<div class=groupname>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>" +"</div>"+"</div>"
								  	 );
					  	   }
				  	   }else{
				  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading block>"+
				  				 "<div class=timehour>"+hour+"</div>"+"<div class=groupname>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>" +"</div>"+"</div>"
							  	 );
				  	   }
				  	
					}
					
				}else{
					 $("#printlist").html($("#printlist").html()+"<div class=dayby>"+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading block>"+
					  		 "<div>"+"</div>"+"<div>"+"</div>"+"<div>"+"<h3>"+"해당하는 일치하는 값이 없습니다"+"</h3>"+"</div>" +"</div>"+"</div>"
							 );
			  	  }		
			},
			error:function(request,status,error){
				console.log(request.status+":"+status.responseText+":"+ error);
			},
			complete:function(){
				console.log("성공이건 실패건 어찌되었든 ajax 종료");
			}
		});
	})
	
	$("#recolist").click(function() {
		var nowdata = $("#datepicker").val();
		$.ajax({
			url:"recommend.meet",
			type:"post",
			data:{val:nowdata},
			dataType : "json",
			success:function(response){
				console.log("AJAX Request 성공 ");
				console.log(response);
				$("#printlist").text('');
				  if(response.length > 0){
					for(var i=0;i<response.length;i++){
						var seq = response[i].groseq;
						var day = response[i].date;
						var hour = response[i].hour;
						var group = response[i].groupName;
						var title =  response[i].groupTitle;
				  	   var location = response[i].location;
				  	   
				  	   if(i>0){
					  	   if(response[i].date == response[i-1].date){
					  			 $("#printlist").html($("#printlist").html()+"<div class=panel panel-default block>"+"<div class=panel-heading>"+"<div class=timehour>"+hour+"</div>"  
									  	   +"<div class=groupname>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>"+"</div>"+"</div>"
									  	 );
					  	   }else{
					  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default block>"+"<div class=panel-heading>"
					  				 +"<div class=timehour>"+hour+"</div>" +"<div class=groupname>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>" +"</div>"+"</div>"
								  	 );
					  	   }
				  	   }else{
				  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default block>"+"<div class=panel-heading>"+
				  		 "<div class=timehour>"+hour+"</div>"+"<div class=groupname>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>" +"</div>"+"</div>"
						 );
				  	   }
				  	   
						}
				  	  }else{
				  		 $("#printlist").html($("#printlist").html()+"<div class=dayby>"+"</div>"+"<div class=panel panel-default block>"+"<div class=panel-heading>"+
						  		 "<div>"+"</div>"+"<div>"+"</div>"+"<div>"+"<h3>"+"해당하는 일치하는 값이 없습니다"+"</h3>"+"</div>" +"</div>"+"</div>"
								 );
				  	  }
			},
			error:function(request,status,error){
				console.log(request.status+":"+status.responseText+":"+ error);
			},
			complete:function(){
				console.log("성공이건 실패건 어찌되었든 ajax 종료");
			}
		});
	})
	
	$('#gro').click(function() {
		location.href = 'list.group';
	});
	
	
</script>

</body>
</html>