<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!-- Controller에서  sessionScope.loginId 받으면 오는 페이지 : 로그인이 되어있는 경우 -->

<c:choose>
	<c:when test="${sessionScope.loginId != null}">

		<!-- 		<nav> -->

		<a href="main.jsp"><img src="https://i.imgur.com/axIYcKj.png"
			class="animated wobble" style="height: 50px; width: 150px;"></a>

		<ul id=nav-ul style="width: 200px;">

			<li><a href="#">새 그룹 시작하기</a>
			<li id=snd-list class="dropdown active"><a href="#"
				class="dropdown-toggle" data-toggle="dropdown"><i
					class="fas fa-user"></i></a>

				<ul class="dropdown-menu dropdown-menu-right" style="width: 100px;">
					<li><a href="LogoutController.co">로그아웃 </a></li>
					<li><a href="mypage.co">마이페이지 </a></li>
				</ul>
		</ul>
		<!-- 		</nav> -->

	</c:when>


	<c:when test="${sessionScope.loginId == null }">

		<!-- 		<nav> -->
		<a href="main.jsp"><img src="https://i.imgur.com/axIYcKj.png"
			class="animated fadeInLeft" style="height: 50px; width: 150px;"></a>

		<ul id=nav-ul class="fadeInRight animated" style="width: 290px;">
			<li><a href="#">새 그룹 시작하기</a>
			<li><a href="login.jsp">로그인</a>
			<li><button type="button" class="btn btn-default"
					data-toggle="modal" data-target="#idTypeQuestions">가입하기</button> <!-- 클릭시 idTypeQuestion 라는 모달 띄움 -->
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

						<!-- 이메일로 회원가입 -->
							<button id=signUpWithEmail class="button button-shadow"
								onclick="window.location.href='signUpWithEmail.jsp'">✉</button>



<!-- 						<div class=sns-login-btn> -->
							<!-- 카카오톡으로 회원가입 버튼 -->
							<a id="kakao-signUp-btn"
								class="button button-shadow yellow text-blanco text-shadow-negra">🗨</a>
							<!-- 페이스북 -->
							<button onclick="signIn()"
								class="button blue button-shadow text-blanco-fb text-shadow-negra">f</button>
							<!-- Google Login API -->
							<button type=button class="button button-shadow"
								onclick="google_login_in()">g</button>
<!-- 						</div> -->


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
		</div>

		<!-- 페이스북 -->
		<div>
			<%@ include file="../../signUpWithFaceBook.jsp"%>


		</div>

		<!-- 구글 API  -->
		<div>
			<%@ include file="../../signUpWithGoogle.jsp"%>
		</div>

		<!-- 		</nav> -->
	</c:when>

</c:choose>



