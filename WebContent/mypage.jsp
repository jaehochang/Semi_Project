<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE>
<html>
<head>

<meta name="google-signin-client_id"
	content="877251563587-9mm7utso3vmg921b183stb0anidpr2n6.apps.googleusercontent.com">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<!-- mdb -->
    <meta http-equiv="x-ua-compatible" content="ie=edge">
<!-- mdb -->
<title>My Page</title>


<link rel="stylesheet" type="text/css" href="css/mypagenav-style.css">
<link rel="stylesheet" type="text/css" href="css/bottom-style.css">
<link rel="stylesheet" type="text/css"
	href="css/mypage-section-style.css">
<link rel="stylesheet" type="text/css" href="css/animate.css">

<!-- Animtion On Sroll CDN -->
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

<!-- google api -->
<meta name="google-signin-client_id"
	content="201245295217-c7jm6q8qk7qf81smd0qfkfp3mlnr33cn.apps.googleusercontent.com">
<meta name="google-signin-scope" content="profile email">
<script src="https://apis.google.com/js/platform.js" async defer></script>



<!-- //밑에 CDN 순서 맞지 않으면 오류 발생// -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->



<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


<!-- Jquery CDN -->
<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>


<!-- <!-- fontawesome --> -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" -->
<!-- 	integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" -->
<!-- 	crossorigin="anonymous"> -->

<!-- 위에 CDN 순서 맞지 않으면 오류 발생 -->




<!-- mdb -->
  <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.0/css/font-awesome.min.css">
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="css/mdb.min.css" rel="stylesheet">

</head>
<body>
	<%@ include file="include/nav/mypageNav.jsp"%>

	<!-- 이 줄 밑으로 my page 구현하기 -->

	<div id="profilebox">

		<div id=profilebody class="animated fadeInLeft">

			<div id=boxheader>
				<h3>${requestScope.userName}</h3>
				<p>이메일 : ${requestScope.userEmail}</p>
				<p>지역 : ${requestScope.userLocation}</p>
				<p>성별 : ${requestScope.userGender}</p>
				<p>나이 : ${requestScope.userAge}</p>
				<p>가입 날짜 : ${requestScope.userJoinDate}</p>
				
			</div>
			


			<div id="meetnow">
				<h1>${requestScope.joinedMeetnowCounts} 모임 참여 중</h1>
			</div>

			<div id=joinedgroup-list>
				<div id="group-titles">
					<h4>${requestScope.joinedGroupNames}</h4>
				</div>
			</div>


		</div>

		<!-- aside 시작 -->
		<div id=profileaside class="animated fadeInRight">
			<img src="${requestScope.userPicture}"
				style="border-radius:150px;height: 150px; width: 150px; display: block; margin: 0 auto;">


				<div id=interestbox>
					<h2>관심사</h2>
					
					<div id=interests>${requestScope.getUserInterests} </div>
				</div>
				<!-- 지혜야 부탁해 -->

		</div>
	</div>


<div class="modal fade" id="modalSubscriptionForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header text-center">
                <h4 class="modal-title w-100 font-weight-bold">Subscribe</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body mx-3">
                <div class="md-form mb-5">
                    <i class="fa fa-user prefix grey-text"></i>
                    <input type="text" id="form3" class="form-control validate">
                    <label data-error="wrong" data-success="right" for="form3">Your name</label>
                </div>

                <div class="md-form mb-4">
                    <i class="fa fa-envelope prefix grey-text"></i>
                    <input type="email" id="form2" class="form-control validate">
                    <label data-error="wrong" data-success="right" for="form2">Your email</label>
                </div>

            </div>
            <div class="modal-footer d-flex justify-content-center">
                <button class="btn btn-indigo">Send <i class="fa fa-paper-plane-o ml-1"></i></button>
            </div>
        </div>
    </div>
</div>

<div class="text-center">
    <a href="" class="btn btn-default btn-rounded mb-4" data-toggle="modal" data-target="#modalSubscriptionForm">Launch Modal Subscription Form</a>
</div>


	<!-- 	footer -->
	<%@ include file="include/bottom.jsp"%>

<!-- 	<script -->
<!-- 		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
<!-- 	<script src="./resources/docs/dist/js/bootstrap.min.js"></script> -->
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script
		src="./resources/docs/assets/js/ie10-viewport-bug-workaround.js"></script>
		
		
<!-- 		mdb -->
		   <!-- JQuery -->
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="js/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="js/mdb.min.js"></script>
<!-- 		mdb -->
</body>
</html>