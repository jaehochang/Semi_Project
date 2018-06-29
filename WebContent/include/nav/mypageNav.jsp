<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!-- Controller에서  sessionScope.loginId 받으면 오는 페이지 : 로그인이 되어있는 경우 -->

<c:choose>
	<c:when test="${sessionScope.loginId != null}">

		<nav>
			<a href="main.jsp"><img src="https://i.imgur.com/axIYcKj.png"
				style="height: 50px; width: 150px;"></a>
			<ul id=nav-ul>

				<li><a href="#">새 그룹 시작하기</a>
				<li id=snd-list><a href="#">탐색</a>
				<li><a href="#">메시지</a>
				<li><a href="#">알림</a>
				<li class="dropdown active"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"><i class="fas fa-user"></i></a>

					<ul class="dropdown-menu dropdown-menu-right" style="width: 100px;">
						<li><a href="LogoutController.co">로그아웃 </a></li>
						<li><a href="mypage.co">마이페이지 </a></li>
					</ul>
			</ul>
		</nav>

	</c:when>


	<c:when test="${sessionScope.loginId == null }">

		<nav>
			<a href="main.jsp"><img src="https://i.imgur.com/axIYcKj.png"
				style="height: 50px; width: 150px;"></a>
			<ul id=nav-ul>

				<li><a href="#">새 그룹 시작하기</a>
				<li><a href="login.jsp">로그인</a>
				<li><button type="button" class="btn btn-default"
						data-toggle="modal" data-target="#idTypeQuestions">가입하기</button> <!-- 					클릭시 idTypeQuestion 라는 모달 띄움 -->
			</ul>



			<!-- Modal -->
			<div class="modal fade" id="idTypeQuestions" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h2 class="modal-title" id="exampleModalLabel">회원가입</h2>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">

							<!-- 카카오톡으로 회원가입 버튼 -->
							<div class=sns-login-btn>

								<a id="kakao-signUp-btn"><img src="img/kakao.png"
									style="width: 35px; height: 35px;">카카오톡으로 회원가입</a>


								<!-- 페이스북 -->
								<div id="signIn">
									<button onclick="signIn()">Sign In With
										Facebook(Popup)</button>
										
<!-- 									<button onclick="signInWithRedirect()">Sign In With -->
<!-- 										Facebook(Redirect)</button> -->
								</div>
<!-- 								<div id="authorized"> -->
<!-- 									<div> -->
<!-- 										Hello, <img id="photo" src="" /><span id="displayName"></span> -->
<!-- 									</div> -->
<!-- 									<div> -->
<!-- 										Email: <span id="email"></span><br /> RefreshToken: <span -->
<!-- 											id="refreshToken"></span><br /> uid: <span id="uid"></span> -->
<!-- 									</div> -->
<!-- 									<div> -->
<!-- 										<button onclick="signOut()">Sign Out</button> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 								<div id="error"> -->
<!-- 									An error occurred: <span id="errmsg"></span><br /> -->
<!-- 									<button onclick="back();">Back</button> -->
<!-- 								</div> -->


<!-- 								<button id="fb-logout">페북 로그아웃</button> -->


								<!-- ] -->
<!-- 								<script> -->
<!-- // 									document.getElementById("fb-logout").onclick = function() { -->

<!-- // 										FB.logout(function(response) { -->
<!-- // 											// user is now logged out -->
<!-- // 										}); -->
<!-- // 									} -->
<!-- 								</script> -->




							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary">Save
									changes</button>
							</div>
						</div>
					</div>
				</div>


				<!-- 카카오톡 버튼 눌렀을 시  -->
				<div>
					<%@ include file="../../signUpWithKakao.jsp"%>
					<script>
						console.log("/signUpWithKakao.jsp")
					</script>
				</div>
				<!-- 카카오톡 버튼 눌렀을시 끝 -->

				<!-- 페이스북 -->
				<div>



					<%@ include file="../../signUpWithFaceBook.jsp"%>
					<script>
						console.log("/signUpWithFaceBook.jsp");
					</script>


				</div>





			</div>
		</nav>
	</c:when>

</c:choose>



