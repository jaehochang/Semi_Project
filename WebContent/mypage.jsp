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
			<script>
location.href="Oops.jsp";

</script>
		</c:when>
	</c:choose>

	<%@ include file="include/nav/mypageNav.jsp"%>

	<!-- 이 줄 밑으로 my page 구현하기 -->


	<!-- 옛날 버전 -->


	<div id="profilebox">

		<div id=profilebody class="animated fadeInLeft">
			<div class=title>프로필</div>
			<div id=boxbody>
				<div class="md-form mb-3">
					<i class="fa fa-user prefix grey-text"></i> <input type="text"
						id="form34" class="form-control validate  disabled"
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

			<!-- 회원정보 수정 버튼 -->
			<div id="profile-footer">
				<button 
					class="btn btn-secondary"
					data-toggle="modal" data-target="#modalContactForm"
					style="background-color: #b831d9;">
<i class="fa fa-address-book" aria-hidden="true"></i>
<i class="fa fa-address-card" aria-hidden="true"></i>
					회원정보 수정</button>
			</div>
		</div>



		<!-- aside 시작 -->
		<div id=profileaside class="animated fadeInUp mask rgba-white-slight"
			style="padding: 0px;">
			<div class=title>사진</div>
			
			
			<%-- 			<img id="profile-photo" src="${requestScope.userPicture}"> --%>
			<!-- 			id="memPic" -->
			<img src="files/${userPicture }" id="profile-photo">



			<!-- 사진 변경 버튼 -->
			<div>
				<form action="upload.file?group_seq=0&page=mypage" method="post"
					id="writeForm" enctype="multipart/form-data">


					<input type="file" id="file" name="file"
						onchange="this.form.submit()" style="display: none;" />
					<button type="button" class="btn btn-secondary"
						style="width: 150px; background-color: #f7f7f7; color: black;"
						id="btn-upload">
				<i class="fa fa-photo" aria-hidden="true"></i>		사진변경
					</button>
				</form>
			</div>


		</div>


		<div id=interestbox class="animated fadeInRight">
			<div class=title>관심사</div>
			<div id=interests>${requestScope.getUserInterests}</div>
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
							class="btn btn-secondary btn-rounded mb-4 rgba-purple-strong waves-effect waves-light">
							바꾸기<i class="fa fa-paper-plane-o ml-1"></i>
						</button>

					</div>
				</form>

			</div>
		</div>
	</div>



	<!-- modal btn -->





	<script>
		$("#btn-upload").click(function(e) {
			e.preventDefault();
			$('#file').click();
		});
	</script>

	<c:if test="${fileResult >=1 }">
		<script>
			var val = "${systemName}";
			
			$.ajax({
				url : "test.file",
				type : "get",
				data : {value : val},
				success : function(resp) {

					var contents = resp.html;
					
					console.log(contents);
				},
				error : function(request, status, error) {
					console
							.log(request.status + " : " + status + " : "
									+ error);
				},
				complate : function() {
					console.log("ajax 종료");
				}
			});
		</script>
	</c:if>

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