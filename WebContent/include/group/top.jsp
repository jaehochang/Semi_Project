
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
<link rel="stylesheet" type="text/css" href="css/groupmain-style.css?ver=3">

<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<link rel="stylesheet" type="text/css" href="css/demo.css" />
<link rel="stylesheet" type="text/css" href="css/component.css" />

<!-- SJ 꺼 -->
<link rel="stylesheet" type="text/css" href="./css/mypagenav-style.css?ver=1">
<link rel="stylesheet" type="text/css" href="./css/bottom-style.css">
<link rel="stylesheet" type="text/css" href="./css/mypage-section-style.css">
<!-- SJ 꺼 -->



<script src="js/modernizr.custom.js"></script>

<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

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
	
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>



<STYLE>

/* 나눔고딕 */
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css); 

/* 제주고딕 */
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
body {
/*    font-family: 'Jeju Gothic', serif; */
   font-family: 'Nanum Gothic', serif;
   padding-top: 0px;
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
					<button type="button" class="btn btn-secondary"
					style="position: absolute; width: 150px; background-color: #f7f7f7; color: black;"
					id="btn-upload"><img src="img/photo.png" style="width:23px; padding-right: 3px;">사진 변경</button>
			</div>

			<form action="upload.file?group_seq=${item.group_seq }&page=group" method="post" id="writeForm" enctype="multipart/form-data">
				<input type="file" id="file" name="file" onchange="this.form.submit()" style="display:none;"/>
				
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
				<c:forEach var="leaderInfo" items="${leaderInfo }">
					<div id="leader-pic">
						<img src="files/${leaderInfo.member_picture }" class="leader-img">
					</div>
					<div id="leader-name">
						<h6>주최자 :</h6>
						<h4>${leaderInfo.member_name }</h4>
					</div>
				</c:forEach>
				</div>
				<div id="info-sns">
					<span id="sns">공유 : <img src="img/kakao.png" id="kakaoShare">
					<a href=""><img src="img/facebook.png"></a></span>
				</div>
			</div>
			<input type="hidden" id="groupTitle" value="${item.group_name }">
			<input type="hidden" id="groupInfo" value="${item.group_info }">
			<input type="hidden" id="groupSeq" value="${item.group_seq }">
		</c:forEach>
	</div>

	<hr>
	
		<script>
			$("#kakaoShare").click(function(){
				
				var title = $("#groupTitle").val();
				var info = $("#groupInfo").val();
				var seq = $("#groupSeq").val();
				
				// // 사용할 앱의 JavaScript 키를 설정해 주세요.
			    Kakao.init('767925735aa3c3cbed5da5abc25740ee');
			    // // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
			    Kakao.Link.createDefaultButton({
			      container: '#kakaoShare',
			      objectType: 'feed',
			      content: {
			        title: title,
			        description: info,
			        imageUrl: 'https://goo.gl/LP6PfT',
			        link: {
			          mobileWebUrl: "http://192.168.1.249:8080/0619/groupMain?group_seq=1&page=info",
			          webUrl: "http://192.168.1.249:8080/0619/groupMain?group_seq=1&page=info"
			        }
			      },
			      buttons: [
			        {
			          title: '웹으로 보기',
			          link: {
			            mobileWebUrl: "http://192.168.1.249:8080/0619/groupMain?group_seq=1&page=info",
			            webUrl: "http://192.168.1.249:8080/0619/groupMain?group_seq=1&page=info"
			          }
			        }
			      ]
			    });
			})
		</script>
		
			