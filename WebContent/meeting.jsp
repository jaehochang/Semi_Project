<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Meeting</title>
<link href="./resources/docs/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="./resources/docs/examples/jumbotron/jumbotron.css" rel="stylesheet">
<script src="./resources/docs/assets/js/ie-emulation-modes-warning.js"></script>

<link rel="stylesheet" type="text/css" href="css/mypagenav-style.css">
<link rel="stylesheet" type="text/css" href="css/meeting-style.css">

</head>
<body>
	<header>
		<%@ include file="include/nav/mypageNav.jsp"%>
	</header>

  <hr class="my-4" style="border-bottom: 2px grey;">

<div class="jumbotron">
  <time class="icon">
	<strong>6월</strong> <span>20</span>
  </time>
	<div class="meeting-info">
		<h5>${result.attend_date}</h5>
		<h2><b>${result.board_title}</b></h2>
		<h5>주최자 : <a href="">${result.group_leader }</a></h5>
		<h5><a href="">${result.group_name}</a>에서 주최</h5>
	</div>
</div>
<div class="meeting-contents">
	<p>세부사항</p>
	<p>${result.board_content}</p>
</div>



</body>
</html>