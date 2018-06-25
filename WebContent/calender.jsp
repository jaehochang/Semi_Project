<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="./resources/docs/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="./resources/docs/examples/jumbotron/jumbotron.css" rel="stylesheet">
    <script src="./resources/docs/assets/js/ie-emulation-modes-warning.js"></script>
    <style>
    .date {
	display: block;
	width: 100px;
	height: 110px;
	margin: 30px auto;
	background: #fff;
	text-align: center;
	font-family: 'Helvetica', sans-serif;
	position: relative;
}


.date .binds {
	position: absolute;
	height: 15px;
	width: 60px;
	background: transparent;
	border: 2px solid #999;
	border-width: 0 5px;
	top: -6px;
	left: 0;
	right: 0;
	margin: auto;
}

.date .month {
	background: #555;
	display: block;
	padding: 8px 0;
	color: #fff;
	font-size: 12px;
	font-weight: bold;
	border-bottom: 2px solid #333;
	box-shadow: inset 0 -1px 0 0 #666;
}

.date .day {
	display: block;
	margin: 0;
	padding: 10px 0;
	font-size: 48px;
	box-shadow: 0 0 3px #ccc;
	position: relative;
}

.date .day::after {
	content: '';
	display: block;
	height: 100%;
	width: 96%;
	position: absolute;
	top: 3px;
	left: 2%;
	z-index: -1;
	box-shadow: 0 0 3px #ccc;
}

.date .day::before {
	content: '';
	display: block;
	height: 100%;
	width: 90%;
	position: absolute;
	top: 6px;
	left: 5%;
	z-index: -1;
	box-shadow: 0 0 3px #ccc;
}
    </style>
</head>
<body>
	<div class="date">
	<span class="binds"></span>
	<span class="month">August</span>
	<h1 class="day">28</h1>
</div>
</body>
</html>