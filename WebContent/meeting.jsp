<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Meeting</title>
<link href="./resources/docs/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="./resources/docs/examples/jumbotron/jumbotron.css" rel="stylesheet">
<script src="./resources/docs/assets/js/ie-emulation-modes-warning.js"></script>

<link rel="stylesheet" type="text/css" href="css/mypagenav-style.css">
<link rel="stylesheet" type="text/css" href="css/meeting-style.css?ver=2">
<link rel="stylesheet" type="text/css" href="css/meeting-nav-style.css?ver=1">
<link rel="stylesheet" type="text/css" href="css/bottom-style.css?ver=2">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>
	$(window).scroll(function(){
	    if ($(window).scrollTop() >= 300) {
	        $('nav').addClass('fixed-header');
	        $('nav div').addClass('visible-title');

	    }
	    else {
	        $('nav').removeClass('fixed-header');
	        $('nav div').removeClass('visible-title');
	    }
	});
</script>

</head>
<body>
   <header>
      <%@ include file="include/nav/mypageNav.jsp"%>
      <div class="jumbotron">
        	<time class="icon">
         		<strong><fmt:formatDate value="${result.meeting_start_time}" pattern="M"/>월</strong>
           		<span><fmt:formatDate value="${result.meeting_start_time}" pattern="dd"/></span>
        	</time>
        	<div class="meeting-info" >
            <div class="" style="color:#8b96a8;" >
                         <fmt:formatDate value="${result.meeting_start_time}" pattern="M"/>월
                     	<fmt:formatDate value="${result.meeting_start_time}" pattern="dd"/>일 
                     	<fmt:formatDate value="${result.meeting_start_time}" pattern="E"/>요일 
                     	<fmt:formatDate value="${result.meeting_start_time}" pattern="a"/> 
                     	<fmt:formatDate value="${result.meeting_start_time}" pattern="hh"/>시
                     	<fmt:formatDate value="${result.meeting_start_time}" pattern="mm"/>분
            </div>
            <h2><b>${result.meeting_title}</b></h2>
            <h5>주최자 : <a href="">${result.group_leader }</a></h5>
            <h5><a href="">${result.group_name}</a>에서 주최</h5>
         </div>
         <div class="ask-attend">
            <p>참석하시겠습니까? </p>
            <br>
            
            <button type="button" class="btn" style="width:150px; background-color:pink; color:white;"><span class="glyphicon glyphicon-ok"></span></button>
            <button type="button" class="btn" style="width:150px; background-color:pink; color:white;"><span class="glyphicon glyphicon-remove"></span></button>
      	</div>
      </div>
      <nav>
      		<div class="navi-info">
	        <div class="navi-meeting-time" style="color:#8b96a8;" >
            	<fmt:formatDate value="${result.meeting_start_time}" pattern="M"/>월
               	<fmt:formatDate value="${result.meeting_start_time}" pattern="dd"/>일 
                <fmt:formatDate value="${result.meeting_start_time}" pattern="E"/>요일 
                <fmt:formatDate value="${result.meeting_start_time}" pattern="a"/> 
               	<fmt:formatDate value="${result.meeting_start_time}" pattern="hh"/>시
               	<fmt:formatDate value="${result.meeting_start_time}" pattern="mm"/>분
            </div>
      		<div>
	        	<h2><b>${result.meeting_title}</b></h2>
      		</div>
      		</div>
      		<div class="navi-buttons">
      			<button type="button" class="btn" style="width:100px; background-color:pink; color:white;"><span class="glyphicon glyphicon-ok"></span></button>
            	<button type="button" class="btn" style="width:100px; background-color:pink; color:white;"><span class="glyphicon glyphicon-remove"></span></button>
      		</div>
      </nav>
   </header>
   
	 <div class="fixed-bar" style="color:#8b96a8;">
	 	<div class="fixed-bar-contents">
			<span class="glyphicon glyphicon-time"></span><Br>
							<fmt:formatDate value="${result.meeting_start_time}" pattern="M"/>월
	                     	<fmt:formatDate value="${result.meeting_start_time}" pattern="dd"/>일 
	                     	<fmt:formatDate value="${result.meeting_start_time}" pattern="E"/>요일 
	                     	<fmt:formatDate value="${result.meeting_start_time}" pattern="a"/> 
	                     	<fmt:formatDate value="${result.meeting_start_time}" pattern="hh"/>시
	                     	<fmt:formatDate value="${result.meeting_start_time}" pattern="mm"/>분 </br>
							~  <fmt:formatDate value="${result.meeting_end_time}" pattern="M"/>월
	                     	<fmt:formatDate value="${result.meeting_end_time}" pattern="dd"/>일 
	                     	<fmt:formatDate value="${result.meeting_end_time}" pattern="E"/>요일 
	                     	<fmt:formatDate value="${result.meeting_end_time}" pattern="a"/> 
	                     	<fmt:formatDate value="${result.meeting_end_time}" pattern="hh"/>시
	                     	<fmt:formatDate value="${result.meeting_end_time}" pattern="mm"/>분
							<Br>
							<br>
			<span class="glyphicon glyphicon-map-marker"></span><Br>
				<p>${result.meeting_location }</p>
	 	</div>
	 	<div class="fixed-bar-location-image">
			<img src="files/default.jpg">
	 	</div>
		
	 </div>
      <div class="meeting-contents-wrapper">
	    	<div class ="meeting-picture"><img src="files/default.jpg">
		    </div>
		    <div class="meeting-contents">
		        <p>세부사항</p>
		        <p>${result.meeting_contents}</p>
		    </div>
		    
		    
		
		<div class="meeting-member-wrapper" style="border:1px solid black;">
			<div class="meeting-member-title">
				<p class="pull-left">참석자</p> 
				<a href="" class="pull-right">모두보기</a><br>
			</div> <br>
			<div class="row" >
				<div class="col-md-3">
					<img src="files/default.jpg">
					<div class="member-info">
					<p><b>${result.group_leader }</b></p>
					<p>주최자</p>
					</div>
				</div>
				<div class="col-md-3">.col-md-3</div>
				<div class="col-md-3">.col-md-3</div>
				<div class="col-md-3">.col-md-3</div>
				<div class="col-md-3">.col-md-3</div>
				<div class="col-md-3">.col-md-3</div>
				<div class="col-md-3">.col-md-3</div>
				<div class="col-md-3">.col-md-3</div>
			</div>
		</div>
	</div>
	<div>
		<footer>
	    	<%@ include file="include/bottom.jsp"%>
		</footer>
	</div>


</body>
</html>