
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="./resources/docs/favicon.ico">
<link rel="stylesheet" type="text/css" href="css/mypagenav-style.css">
<link rel="stylesheet" type="text/css" href="css/bottom-style.css">
<link rel="stylesheet" type="text/css" href="css/groupmain-style.css">

<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>



<title>Group Main</title>


<link href="./resources/docs/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="./resources/docs/examples/jumbotron/jumbotron.css"
	rel="stylesheet">
<script src="./resources/docs/assets/js/ie-emulation-modes-warning.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- fontawesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
	integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
	crossorigin="anonymous">



</head>
<body>
	<header> <%@ include file="../nav/mypageNav.jsp"%>

	</header>
	<hr>

	<div id="group-top">
		<c:forEach var="item" items="${result }">
			<div id="top-contents-img">
				<img src="files/${item.group_picture }" id="group-main-img"
					class="img-responsive img-rounded">
			</div>
			<div id="top-contents-info">
				<div id="info-title">
					<h2>${item.group_name }</h2>
					<ul style="padding: 0px;">
						<li style="list-style: none; margin: 0;">${item.group_location }
						<li style="margin: 0 0 0 30px;">${count}명회원
						<li style="margin: 0 0 0 30px;">공개그룹
					</ul>

				</div>
				<div id="info-leader">
					<div id="leader-pic">
						<img src="img/10.jpg" class="leader-img">
					</div>
					<div id="leader-name">
						<h6>주최자 :</h6>
						<h4>${item.group_leader }</h4>
					</div>
				</div>
				<div id="info-sns">
					<span id="sns">공유 : <a href=""><img src="img/kakao.png"></a> 
					<a href=""><img src="img/facebook.png"></a></span>
				</div>
			</div>
		</c:forEach>
	</div>

	<hr>

		
			