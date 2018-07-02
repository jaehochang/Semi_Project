<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<html>
<head>



<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- google api -->
<meta name="google-signin-scope" content="profile email">

<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id"
	content="29772503024-a0vbpecnn40g77lm6r1coi2sg7c1rmr5.apps.googleusercontent.com">

<!-- google api -->

<meta name="description" content="">
<meta name="author" content="">

<link rel="icon" href="./resources/docs/favicon.ico">
<link rel="stylesheet" type="text/css" href="css/groupstyle.css">
<link rel="stylesheet" type="text/css" href="css/mypagenav-style.css">
<link rel="stylesheet" type="text/css" href="css/bottom-style.css">
<link rel="stylesheet" type="text/css" href="css/main-card-style.css">

<link rel="stylesheet" type="text/css" href="css/main-card-style.css?ver=2">
<link rel="stylesheet" type="text/css" href="css/main-calender-style.css">
<link rel="stylesheet" type="text/css" href="css/main-carousel-style.css">

<link rel="stylesheet" type="text/css"
	href="css/main-calender-style.css">

<link rel="stylesheet" type="text/css"
	href="css/main-carousel-style.css">

<link href="./resources/docs/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="./resources/docs/examples/jumbotron/jumbotron.css"
	rel="stylesheet">

<title>Meet now</title>

<script src="./resources/docs/assets/js/ie-emulation-modes-warning.js"></script>


<!-- 밑에 CDN 순서 맞지 않으면 오류 발생 -->


<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


<!-- Jquery CDN -->
<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- fontawesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
	integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
	crossorigin="anonymous">

<!-- 위에 CDN 순서 맞지 않으면 오류 발생 -->


</head>



<script>
	$(document).ready(function() {
		$('#media').carousel({
			pause : true,
			interval : false,
		});

		$("#login").click(function() {
			$(location).attr("href", "LoginController.co");

		});
		$("#logout").click(function() {

			$(location).attr("href", "LogoutController.co");
		});

	});
</script>



<body>
	<header>
		<%@ include file="include/nav/mypageNav.jsp"%>
	</header>

	<div class="jumbotron" style="background-color: #b548d0">
		<div class="container">

			<!--       <video src="./video/MeetNow.mp4" autoplay="autoplay" loop="loop" width="100%" height="100%"> -->
			<h1 id="" style="color: white;">무엇을 좋아하시나요?</h1>
			<p style="color: white;">MeetNow로 한 걸음 더 나아가기</p>
			<p>
				<a class="btn btn-primary btn-lg" href="#" role="button">가입하기&raquo;</a>
			</p>
			<!--       </video> -->
		</div>
	</div>


	<div class="container">
		<h2 style="color: #5e5568;">
			<b>주변의 인기 Meet Up</b>
		</h2>
		</br>
		<div class='row'>
			<div class='col-md-12'>
				<div class="carousel slide media-carousel" id="media">
					<div class="carousel-inner">
						<div class="item  active">
							<div class="row">
								<div class="col-md-4">
									<a class="thumbnail" href="#"><img alt=""
										src="./image/manse.jpeg"></a>
								</div>
								<div class="col-md-4">
									<a class="thumbnail" href="#"><img alt=""
										src="./image/manse.jpeg"></a>
								</div>
								<div class="col-md-4">
									<a class="thumbnail" href="#"><img alt=""
										src="http://placehold.it/150x150"></a>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="row">
								<div class="col-md-4">
									<a class="thumbnail" href="#"><img alt=""
										src="http://placehold.it/150x150"></a>
								</div>
								<div class="col-md-4">
									<a class="thumbnail" href="#"><img alt=""
										src="http://placehold.it/150x150"></a>
								</div>
								<div class="col-md-4">
									<a class="thumbnail" href="#"><img alt=""
										src="http://placehold.it/150x150"></a>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="row">
								<div class="col-md-4">
									<a class="thumbnail" href="#"><img alt=""
										src="http://placehold.it/150x150"></a>
								</div>
								<div class="col-md-4">
									<a class="thumbnail" href="#"><img alt=""
										src="http://placehold.it/150x150"></a>
								</div>
								<div class="col-md-4">
									<a class="thumbnail" href="#"><img alt=""
										src="http://placehold.it/150x150"></a>
								</div>
							</div>
						</div>
					</div>
					<a data-slide="prev" href="#media" class="left carousel-control">‹</a>
					<a data-slide="next" href="#media" class="right carousel-control">›</a>
				</div>
			</div>
		</div>
	</div>

<div class="container">
   <h2 style="color:#5e5568;"><b>주변의 인기 Meet Up</b></h2></br>
      <c:forEach var="items" items="${result}">
         <div class="col">
            <div class="col-md-4">
               <div class="card">
                  <time class="icon">
                  <strong><fmt:formatDate value="${items.meeting_start_time}" pattern="M"/>월</strong>
                    <span><fmt:formatDate value="${items.meeting_start_time}" pattern="dd"/></span>
                  </time>
                  <a class="img-card" href="meeting.meet?seq=${items.meeting_seq}"><img src="files/1.jpg"> </a>
                  <div class="card-content">
                     <div class="" style="color:#8b96a8;" >
                        <fmt:formatDate value="${items.meeting_start_time}" pattern="M"/>월
                        <fmt:formatDate value="${items.meeting_start_time}" pattern="dd"/>일 
                        <fmt:formatDate value="${items.meeting_start_time}" pattern="E"/>요일 
                        <fmt:formatDate value="${items.meeting_start_time}" pattern="a"/> 
                        <fmt:formatDate value="${items.meeting_start_time}" pattern="hh"/>시
                        <fmt:formatDate value="${items.meeting_start_time}" pattern="mm"/>분 
                     </div>
                     <br>
                     <h2 class="card-title">
                        <p><a href="meeting.meet?seq=${items.meeting_seq}"> ${items.meeting_title} </a></p>
                     </h2>
                     <p class="img-member">
                        <img class="pull-left" src="./image/manse.jpeg" alt="Focus Lab">
                     </p>
                     <div class="">주최자 : ${items.group_leader}</div>
                     <div class="">주최그룹 : ${items.group_name}</div>
                     
                  </div>
               </div>
            </div>
         </div>
      </c:forEach>

						<time class="icon">
							<strong><fmt:formatDate value="${time}" pattern="M" />월</strong>
							<span><fmt:formatDate value="${time}" pattern="dd" /></span>
						</time>
						<a class="img-card" href="meeting.meet?seq=${items.meeting_seq}"><img
							src="files/1.jpg"> </a>
						<div class="card-content">
							<div class="" style="color: #8b96a8;">
								<fmt:formatDate value="${time}" pattern="M" />
								월
								<fmt:formatDate value="${time}" pattern="dd" />
								일
								<fmt:formatDate value="${time}" pattern="E" />
								요일
								<fmt:formatDate value="${time}" pattern="a" />
								<fmt:formatDate value="${time}" pattern="hh" />
								시
								<fmt:formatDate value="${time}" pattern="mm" />
								분
							</div>
							<br>
							<h2 class="card-title">
								<a href="meeting.meet?seq=${items.meeting_seq}">
									${items.meeting_title} </a>

							</h2>
							<p class="img-member">
								<img class="pull-left" src="./image/manse.jpeg" alt="Focus Lab">
							</p>
							<div class="">주최자 : ${items.group_leader}</div>
							<div class="">주최그룹 : ${items.group_name}</div>

						</div>
					</div>
				</div>
			</div>
		</c:forEach>


		<div class="col">
			<div class="col-xs-12 col-sm-4">
				<div class="card">
					<a class="img-card" href="http://www.fostrap.com/"> <img
						src="./image/Tulips.jpg" />
					</a> <br />
					<div class="card-content">
						<h4 class="card-title">
							<a href="http://www.fostrap.com/"> Your title card </a>
						</h4>
						<div class="">Your description card!!</div>
					</div>
					<div class="card-read-more">
						<a class="btn btn-link btn-block" href="http://www.fostrap.com/">
							Read More </a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<h2 class="interest-title" style="color: #5e5568;">
			<b>분류별 탐색</b>
		</h2>
		<div class="col">
			<div class="col-md-3">
				<div class="interest-card">
					<a class="interest-img" href="http://www.fostrap.com/"><img
						src="./image/outside activities.jpg"></a> <br />
					<p class="interest-name">야외활동</p>
				</div>
			</div>
			<div class="col-md-3">
				<div class="interest-card">
					<a class="interest-img" href="http://www.fostrap.com/"><img
						src="./image/tech.jpg"></a> <br />
					<p class="interest-name">기술</p>
				</div>
			</div>
			<div class="col-md-3">
				<div class="interest-card">
					<a class="interest-img" href="http://www.fostrap.com/"><img
						src="./image/Tulips.jpg"></a> <br />
					<p class="interest-name">이 구림을 어찌할까..</p>
				</div>
			</div>
			<div class="col-md-3">
				<div class="interest-card">
					<a class="interest-img" href="http://www.fostrap.com/"><img
						src="./image/Tulips.jpg"></a> <br />
					<p class="interest-name">야외활동</p>
				</div>
			</div>
		</div>
		<div class="col">
			<div class="col-md-3">
				<div class="interest-card">
					<a class="interest-img" href="http://www.fostrap.com/"><img
						src="./image/Tulips.jpg"></a> <br />
					<p class="interest-name">야외활동</p>
				</div>
			</div>
			<div class="col-md-3">
				<div class="interest-card">
					<a class="interest-img" href="http://www.fostrap.com/"><img
						src="./image/Tulips.jpg"></a> <br />
					<p class="interest-name">야외활동</p>
				</div>
			</div>
			<div class="col-md-3">
				<div class="interest-card">
					<a class="interest-img" href="http://www.fostrap.com/"><img
						src="./image/Tulips.jpg"></a> <br />
					<p class="interest-name">야외활동</p>
				</div>
			</div>
			<div class="col-md-3">
				<div class="interest-card">
					<a class="interest-img" href="http://www.fostrap.com/"><img
						src="./image/Tulips.jpg"></a> <br />
					<p class="interest-name">야외활동</p>
				</div>
			</div>
		</div>
		<div class="col">
			<div class="col-md-3">
				<div class="interest-card">
					<a class="interest-img" href="http://www.fostrap.com/"><img
						src="./image/Tulips.jpg"></a> <br />
					<p class="interest-name">야외활동</p>
				</div>
			</div>
			<div class="col-md-3">
				<div class="interest-card">
					<a class="interest-img" href="http://www.fostrap.com/"><img
						src="./image/Tulips.jpg"></a> <br />
					<p class="interest-name">야외활동</p>
				</div>
			</div>
			<div class="col-md-3">
				<div class="interest-card">
					<a class="interest-img" href="http://www.fostrap.com/"><img
						src="./image/Tulips.jpg"></a> <br />
					<p class="interest-name">야외활동</p>
				</div>
			</div>
			<div class="col-md-3">
				<div class="interest-card">
					<a class="interest-img" href="http://www.fostrap.com/"><img
						src="./image/Tulips.jpg"></a> <br />
					<p class="interest-name">야외활동</p>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="include/bottom.jsp"%>
</body>

</html>