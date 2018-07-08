
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="./resources/docs/favicon.ico">
<link rel="stylesheet" type="text/css" href="css/groupmain-style.css?ver=1">

<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<link rel="stylesheet" type="text/css" href="css/demo.css" />
<link rel="stylesheet" type="text/css" href="css/component.css" />

<!-- SJ 꺼 -->
<link rel="stylesheet" type="text/css" href="./css/mypagenav-style.css">
<link rel="stylesheet" type="text/css" href="./css/bottom-style.css">
<link rel="stylesheet" type="text/css" href="./css/mypage-section-style.css">
<!-- SJ 꺼 -->



<script src="js/modernizr.custom.js"></script>

<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>

<!-- 사진  -->
<link rel="stylesheet" href="photo/css/lightbox.min.css">

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
	




<STYLE>

/* 나눔고딕 */
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css); 

/* 제주고딕 */
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
body {
/*    font-family: 'Jeju Gothic', serif; */
   font-family: 'Nanum Gothic', serif;
}
</STYLE>
</head>
<body>
	<header>
      <%@ include file="../nav/mypageNav.jsp"%>
   </header>
   
	<hr>

	<div id="group-top">
		<c:forEach var="item" items="${result }">
			<div id="top-contents-img">
				<img src="files/${item.group_picture }" id="group-main-img"
					class="img-responsive img-rounded">
			</div>

			<form action="upload.file?group_seq=${item.group_seq }&page=group" method="post" id="writeForm" enctype="multipart/form-data">
				<input type="file" id="file" name="file" onchange="this.form.submit()" style="display:none;"/>
				<button type="button" class="btn btn-secondary"
					style="width: 150px; background-color: #f7f7f7; color: black;"
					id="btn-upload"><img src="img/photo.png" style="width:23px; padding-right: 3px;">사진 변경</button>
			</form>
			
			<script>
				$("#btn-upload").click(function(e){
					e.preventDefault();
					$('#file').click();
				});
			</script>

			<c:if test="${fileResult >=1 }">
				<script>
					var val = "${systemName}";
					var seq = "${item.group_seq}";
					$.ajax({
						url : "../test.file",
						type : "get",
						data : {
							value : val
						},
						success : function(resp) {

							var contents = resp.html;

							$("#group-main-img").attr("src","contents");
						},
						error : function(request, status, error) {
							console.log(request.status + " : " + status + " : "
									+ error);
						},
						complate : function() {
							console.log("ajax 종료");
						}
					});
				</script>
			</c:if>



			<div id="top-contents-info">
				<div id="info-title">
					<div id="info-groupname">
						<h2 >${item.group_name }</h2>
					</div>
					<div id="info-groupinfo">
					<ul style="padding: 0px; float:left;">
						<li style="list-style: none; margin: 0; float:left;">${item.group_location }
						<li style="margin: 0 0 0 30px; float:left;">${count}명회원
						<li style="margin: 0 0 0 30px; float:left;">공개그룹
					</ul>
					</div>
					

				</div>
				<div id="info-leader" style="margin-top: 10px;">
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

		
			