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
<title>프로필 | MeetNow</title>


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




<!-- mdb -->

<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.0/css/font-awesome.min.css">
<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="css/mdb.min.css" rel="stylesheet">


<!-- error catching jQuery -->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<!-- BS JavaScript -->
<script type="text/javascript" src="js/bootstrap.js"></script>


</head>
<body>
	<c:choose>
		<c:when test="${requestScope.infoUpdateSuccess==true}">
			<!-- 성공 모달 -->
			<!-- Central Modal Medium Success -->
			<div class="modal fade" id="centralModalSuccess" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-notify modal-success" role="document">
					<!--Content-->
					<div class="modal-content">
						<!--Header-->
						<div class="modal-header">
							<p class="heading lead">성공!</p>

							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true" class="white-text">&times;</span>
							</button>
						</div>

						<!--Body-->
						<div class="modal-body">
							<div class="text-center">
								<i class="fa fa-check fa-4x mb-3 animated rotateIn"></i>
								<p>회원정보 수정이 성공하였습니다!</p>
							</div>
						</div>

						<!--Footer-->
						<div class="modal-footer justify-content-center">
							<a id=info-success-update-close-btn type="button"
								data-dismiss="modal" class="btn btn-success" class=close>OK</a>
						</div>
					</div>
					<!--/.Content-->
				</div>
			</div>
			<!-- Central Modal Medium Success-->

			<!-- cetral modal initialzing syntax 뒤에 있어야 밑의 scripts 작동함 -->
			<script>

if(${requestScope.infoUpdateSuccess==true}){

	$('#centralModalSuccess').modal('show');
	
}else{

	
	
}
</script>

		</c:when>
		<c:when test="${requestScope.infoUpdateSuccess==false}">
			<!-- 담당자에게 문의하세요 -->

		</c:when>
	</c:choose>

	<%@ include file="include/nav/mypageNav.jsp"%>

	<!-- 이 줄 밑으로 my page 구현하기 -->










	<!-- 옛날 버전 -->


	<div id="profilebox">

		<div id=profilebody class="animated fadeInLeft">
			<span class=title>프로필</span>
			<div id=boxbody>
				<div class="md-form mb-3">
					<i class="fa fa-user prefix grey-text"></i> <input
						type="text" id="form34" class="form-control validate  disabled"
						placeholder="${requestScope.userName}">
				</div>

				<div class="md-form mb-3">
					<i class="fa fa-location-arrow prefix grey-text "
						aria-hidden="true"></i> <input type="text" id="form29"
						class="form-control validate  disabled"
						placeholder="${requestScope.userLocation}">
				</div>
				<div class="md-form mb-3">

					<i class="fa fa-transgender prefix grey-text " aria-hidden="true"></i>
					<input type="text" id="form24"
						class="form-control validate disabled" name=member_gender
						placeholder="${requestScope.userGender}">
				</div>
				<div class="md-form mb-3">
					<i class="fa fa-birthday-cake prefix grey-text " aria-hidden="true"></i>
					<input type="text" id="form32"
						placeholder="${requestScope.userAge}"
						class="form-control validate disabled">
				</div>
				<div class="md-form mb-3">
					<i class="fa fa-envelope-o prefix grey-text" aria-hidden="true"></i>
					<input type="text" id="form32"
						class="form-control validate disabled"
						placeholder=" ${requestScope.userEmail}">
				</div>
			</div>
		</div>



	<!-- aside 시작 -->
	<div id=profileaside
		class="animated fadeInRight mask rgba-white-slight"
		style="padding: 0px;">
		<img id="profile-photo" src="${requestScope.userPicture}">

		<div id=interestbox>

			<span class=title>관심사</span>

			<div id=interests>${requestScope.getUserInterests}</div>
		</div>

	</div>


	</div>
	<!-- 	modal -->
	<div class="modal fade" id="modalContactForm" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header text-center">
					<h4 class="modal-title w-100 font-weight-bold">회원정보 수정</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<form action="updateUserInfo.co" method=post>
					<div class="modal-body mx-3">
						<div class="md-form mb-5">
							<i class="fa fa-user prefix grey-text"></i> <input type="text"
								id="form34" class="form-control validate" name="member_name">
							<label data-error="한글만 입력해주세요." data-success="O.K" for="form34">이름</label>
						</div>

						<div class="md-form mb-5">
							<i class="fa fa-location-arrow prefix grey-text"
								aria-hidden="true"></i> <input type="text" id="form29"
								class="form-control validate" name=member_location> <label
								data-error="올바른 선택이 아닙니다." data-success="O.K" for="form29">지역</label>
						</div>

						<div class="md-form mb-5">
							<i class="fa fa-transgender prefix grey-text" aria-hidden="true"></i>


							<input type="text" id="form24" class="form-control validate"
								name=member_gender> <label data-error="올바른 입력이 아닙니다."
								data-success="O.K" for="form24">성별</label>
						</div>
						<div class="md-form mb-5">
							<i class="fa fa-birthday-cake prefix grey-text"
								aria-hidden="true"></i> <input type="number" id="form32"
								class="form-control validate" name=member_age> <label
								data-error="올바른 입력이 아닙니다. 숫자만 입력해주세요." data-success="O.K"
								for="form32">나이</label>
						</div>


					</div>
					<div class="modal-footer d-flex justify-content-center">
						<button id=info-change-btn
							class="btn btn-unique rgba-purple-strong">
							바꾸기<i class="fa fa-paper-plane-o ml-1"></i>
						</button>

					</div>
				</form>

			</div>
		</div>
	</div>

	<!-- modal btn -->
	<div class="text-center">
		<a href=""
			class="btn btn-secondary btn-rounded mb-4 rgba-purple-strong"
			data-toggle="modal" data-target="#modalContactForm"
			style="background-color: #b831d9;">회원정보 수정</a>
	</div>


	<!-- <div class="modal fade" id="modalSubscriptionForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> -->
	<!--     <div class="modal-dialog" role="document"> -->
	<!--         <div class="modal-content"> -->
	<!--             <div class="modal-header text-center"> -->
	<!--                 <h4 class="modal-title w-100 font-weight-bold">Subscribe</h4> -->
	<!--                 <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
	<!--                     <span aria-hidden="true">&times;</span> -->
	<!--                 </button> -->
	<!--             </div> -->
	<!--             <div class="modal-body mx-3"> -->
	<!--                 <div class="md-form mb-5"> -->
	<!--                     <i class="fa fa-user prefix grey-text"></i> -->
	<!--                     <input type="text" id="form3" class="form-control validate"> -->
	<!--                     <label data-error="wrong" data-success="right" for="form3">Your name</label> -->
	<!--                 </div> -->

	<!--                 <div class="md-form mb-4"> -->
	<!--                     <i class="fa fa-envelope prefix grey-text"></i> -->
	<!--                     <input type="email" id="form2" class="form-control validate"> -->
	<!--                     <label data-error="wrong" data-success="right" for="form2">Your email</label> -->
	<!--                 </div> -->

	<!--             </div> -->
	<!--             <div class="modal-footer d-flex justify-content-center"> -->
	<!--                 <button class="btn btn-indigo">Send <i class="fa fa-paper-plane-o ml-1"></i></button> -->
	<!--             </div> -->
	<!--         </div> -->
	<!--     </div> -->
	<!-- </div> -->



	<!-- 	footer -->
	<%@ include file="include/bottom.jsp"%>

	<script
		src="./resources/docs/assets/js/ie10-viewport-bug-workaround.js"></script>


	<!-- 		mdb -->
	<!-- JQuery -->
	<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
	<!-- Bootstrap tooltips -->
	<script type="text/javascript" src="js/umd/popper.min.js"></script>
	<!-- Bootstrap core JavaScript -->
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<!-- MDB core JavaScript -->
	<script type="text/javascript" src="js/mdb.min.js"></script>
	<!-- ---------------------------------------- -->

</body>
</html>