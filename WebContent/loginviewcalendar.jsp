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
</style>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
</head>

<body>

	<nav>
		<%@ include file="include/nav/mypageNav.jsp"%>
	</nav>

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
				data-toggle="dropdown" aria-expanded="false" id="location-default">
				5km <span class="caret"></span>
			</button>
			<ul class="dropdown-menu" role="menu">
				<li><a href="#">5km</a></li>
				<li><a href="#">10km</a></li>
				<li><a href="#">15km</a></li>
				<li><a href="#">모든거리</a></li>
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
			<button type="button" class="btn btn-default" id="gro">그룹들</button>
			<button type="button" class="btn btn-default" id="cal">달력</button>
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


	<div class="myMeetNow">
		<p>내 MeetNow</p>

		<div class="row" id="myMeet_row">
			<c:forEach var="item" items="${myGroupList }">

				<div class="col-md-3" style="padding: 10px;">
					<a href="groupMain.group?group_seq=${item.group_seq}&page=info">
						<div class="over-img">
							<img src="files/${item.system_name }" class="img_size">
						</div>
						<h4 class="group_title">${item.group_name }</h4> <c:forEach
							var="item2" items="${memberCount }">
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
						  		 $("#printlist").html($("#printlist").html()+"<div class=panel panel-default>"+"<div class=panel-heading>"+"<div>"+hour+"</div>"  
									  	   +"<div>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>"+"</div>"+"</div>"
									  	 );
						  	   }else{
						  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading>"
						  				 +"<div>"+hour+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>"+"</div>"+"</div>"
									  	 );
						  	   }
						  	   }else{
						  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading>"
						  				 +"<div>"+hour+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>"+"</div>"+"</div>"
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
					  			 $("#printlist").html($("#printlist").html()+"<div class=panel panel-default>"+"<div class=panel-heading>"+"<div>"+hour+"</div>"  
									  	   +"<div>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>"+"</div>"+"</div>"
									  	 );
					  	   }else{
					  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading>"
					  				 +"<div>"+hour+"</div>" +"<div>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>" +"</div>"+"</div>"
								  	 );
					  	   }
				  	   }else{
				  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading>"+
				  		 "<div>"+hour+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>" +"</div>"+"</div>"
						 );
				  	   }
				  	   
						}
				  	  }else{
				  		 $("#printlist").html($("#printlist").html()+"<div class=dayby>"+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading>"+
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
						  			 $("#printlist").html($("#printlist").html()+"<div class=panel panel-default>"+"<div class=panel-heading>"+"<div>"+hour+"</div>"  
										  	   +"<div>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>"+"</div>"+"</div>"
										  	 );
						  	   }else{
						  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading>"
						  				 +"<div>"+hour+"</div>" +"<div>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>" +"</div>"+"</div>"
									  	 );
						  	   }
					  	   }else{
					  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading>"+
					  		 "<div>"+hour+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>" +"</div>"+"</div>"
							 );
					  	   }
					  	   
							}
					  	  }else{
					  		 $("#printlist").html($("#printlist").html()+"<div class=dayby>"+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading>"+
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
						  			 $("#printlist").html($("#printlist").html()+"<div class=panel panel-default>"+"<div class=panel-heading>"+"<div>"+hour+"</div>"  
										  	   +"<div>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>"+"</div>"+"</div>"
										  	 );
						  	   }else{
						  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading>"
						  				 +"<div>"+hour+"</div>" +"<div>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>" +"</div>"+"</div>"
									  	 );
						  	   }
					  	   }else{
					  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading>"+
					  				 "<div>"+hour+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>" +"</div>"+"</div>"
								  	 );
					  	   }
					  	
						}
						
					  }else{
						  $("#printlist").html($("#printlist").html()+"<div class=dayby>"+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading>"+
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
						  			 $("#printlist").html($("#printlist").html()+"<div class=panel panel-default>"+"<div class=panel-heading>"+"<div>"+hour+"</div>"  
										  	   +"<div>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>"+"</div>"+"</div>"
										  	 );
						  	   }else{
						  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading>"
						  				 +"<div>"+hour+"</div>" +"<div>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>" +"</div>"+"</div>"
									  	 );
						  	   }
					  	   }else{
					  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading>"+
					  				 "<div>"+hour+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>" +"</div>"+"</div>"
								  	 );
					  	   }
					  	
						}
						
					  }else{
						  $("#printlist").html($("#printlist").html()+"<div class=dayby>"+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading>"+
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
						  			 $("#printlist").html($("#printlist").html()+"<div class=panel panel-default>"+"<div class=panel-heading>"+"<div>"+hour+"</div>"  
										  	   +"<div>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>"+"</div>"+"</div>"
										  	 );
						  	   }else{
						  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading>"
						  				 +"<div>"+hour+"</div>" +"<div>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>" +"</div>"+"</div>"
									  	 );
						  	   }
					  	   }else{
					  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading>"+
					  				 "<div>"+hour+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>" +"</div>"+"</div>"
								  	 );
					  	   }
					  	
						}
						
					}else{
						 $("#printlist").html($("#printlist").html()+"<div class=dayby>"+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading>"+
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
						  			 $("#printlist").html($("#printlist").html()+"<div class=panel panel-default>"+"<div class=panel-heading>"+"<div>"+hour+"</div>"  
										  	   +"<div>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>"+"</div>"+"</div>"
										  	 );
						  	   }else{
						  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading>"
						  				 +"<div>"+hour+"</div>" +"<div>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>" +"</div>"+"</div>"
									  	 );
						  	   }
					  	   }else{
					  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading>"+
					  		 "<div>"+hour+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>" +"</div>"+"</div>"
							 );
					  	   }
					  	   
							}
					  	  }else{
					  		 $("#printlist").html($("#printlist").html()+"<div class=dayby>"+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading>"+
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
						  			 $("#printlist").html($("#printlist").html()+"<div class=panel panel-default>"+"<div class=panel-heading>"+"<div>"+hour+"</div>"  
										  	   +"<div>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>"+"</div>"+"</div>"
										  	 );
						  	   }else{
						  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading>"
						  				 +"<div>"+hour+"</div>" +"<div>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>" +"</div>"+"</div>"
									  	 );
						  	   }
					  	   }else{
					  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading>"+
					  				 "<div>"+hour+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>" +"</div>"+"</div>"
								  	 );
					  	   }
					  	
						}
						
					}else{
						 $("#printlist").html($("#printlist").html()+"<div class=dayby>"+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading>"+
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
						  			 $("#printlist").html($("#printlist").html()+"<div class=panel panel-default>"+"<div class=panel-heading>"+"<div>"+hour+"</div>"  
										  	   +"<div>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>"+"</div>"+"</div>"
										  	 );
						  	   }else{
						  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading>"
						  				 +"<div>"+hour+"</div>" +"<div>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>" +"</div>"+"</div>"
									  	 );
						  	   }
					  	   }else{
					  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading>"+
					  				 "<div>"+hour+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>" +"</div>"+"</div>"
								  	 );
					  	   }
					  	
						}
						
					}else{
						 $("#printlist").html($("#printlist").html()+"<div class=dayby>"+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading>"+
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
					  			 $("#printlist").html($("#printlist").html()+"<div class=panel panel-default>"+"<div class=panel-heading>"+"<div>"+hour+"</div>"  
									  	   +"<div>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>"+"</div>"+"</div>"
									  	 );
					  	   }else{
					  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading>"
					  				 +"<div>"+hour+"</div>" +"<div>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>" +"</div>"+"</div>"
								  	 );
					  	   }
				  	   }else{
				  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading>"+
				  				 "<div>"+hour+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>" +"</div>"+"</div>"
							  	 );
				  	   }
				  	   
					}
					
				}else{
					 $("#printlist").html($("#printlist").html()+"<div class=dayby>"+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading>"+
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
					  			 $("#printlist").html($("#printlist").html()+"<div class=panel panel-default>"+"<div class=panel-heading>"+"<div>"+hour+"</div>"  
									  	   +"<div>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>"+"</div>"+"</div>"
									  	 );
					  	   }else{
					  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading>"
					  				 +"<div>"+hour+"</div>" +"<div>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>" +"</div>"+"</div>"
								  	 );
					  	   }
				  	   }else{
				  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading>"+
				  				 "<div>"+hour+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>" +"</div>"+"</div>"
							  	 );
				  	   }
				  	
					}
					
				}else{
					 $("#printlist").html($("#printlist").html()+"<div class=dayby>"+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading>"+
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
					  			 $("#printlist").html($("#printlist").html()+"<div class=panel panel-default>"+"<div class=panel-heading>"+"<div>"+hour+"</div>"  
									  	   +"<div>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>"+"</div>"+"</div>"
									  	 );
					  	   }else{
					  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading>"
					  				 +"<div>"+hour+"</div>" +"<div>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>" +"</div>"+"</div>"
								  	 );
					  	   }
				  	   }else{
				  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading>"+
				  				 "<div>"+hour+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>" +"</div>"+"</div>"
							  	 );
				  	   }
				  	
					}
					
				}else{
					 $("#printlist").html($("#printlist").html()+"<div class=dayby>"+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading>"+
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
					  			 $("#printlist").html($("#printlist").html()+"<div class=panel panel-default>"+"<div class=panel-heading>"+"<div>"+hour+"</div>"  
									  	   +"<div>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>"+"</div>"+"</div>"
									  	 );
					  	   }else{
					  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading>"
					  				 +"<div>"+hour+"</div>" +"<div>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>" +"</div>"+"</div>"
								  	 );
					  	   }
				  	   }else{
				  		 $("#printlist").html($("#printlist").html()+ "<div class=dayby>"+day+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading>"+
				  		 "<div>"+hour+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+group+"</a>"+"</div>"+"<div>"+"<a href=meeting.meet?seq="+seq+">"+title+"</a>"+"</div>"+"<div>"+location+"</div>" +"</div>"+"</div>"
						 );
				  	   }
				  	   
						}
				  	  }else{
				  		 $("#printlist").html($("#printlist").html()+"<div class=dayby>"+"</div>"+"<div class=panel panel-default>"+"<div class=panel-heading>"+
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