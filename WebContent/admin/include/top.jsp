<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">

<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/dashboard.css">

<script type="text/javascript" src="js/fusioncharts.js"></script>
<script type="text/javascript"
	src="js/themes/fusioncharts.theme.fint.js"></script>

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
<!-- <script src="js/bootstrap.min.js"></script>-->
<body>
	<nav class="navbar navbar-default navbar-fixed-top navbar-inverse">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="main.ao">Meet Now</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">관리
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="member.ao?subject=member_email&text=">회원</a></li>
							<li><a href="group.ao?subject=group_name&text=">그룹</a></li>
							<li><a href="meeting.ao?subject=meeting_title&text=">meetup</a></li>
							<!--<li class="divider"></li> -->
							<!--<li class="dropdown-header">Nav header</li> -->
							<!--<li><a href="#">Separated link</a></li> -->
							<!--<li><a href="#">One more separated link</a></li> -->
						</ul></li>
					<li><a href="memberreport.ao?subject=report_calleemember&text=">신고</a></li>
					<li><a href="stats.ao">통계</a></li>


				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"><span class="glyphicon glyphicon-user"
							aria-hidden="true">&nbsp;</span>${adminId }님의 로그인을 환영합니다.</a></li>
					<li><a href="logout.ao">Logout</a></li>
				</ul>

			</div>
		</div>
	</nav>