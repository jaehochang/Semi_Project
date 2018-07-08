<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!-- Controller에서  sessionScope.loginId 받으면 오는 페이지 : 로그인이 되어있는 경우 -->

<c:choose>
	<c:when test="${sessionScope.loginId != null}">

		<nav>
			<a href="index.jsp"><img src="https://i.imgur.com/axIYcKj.png"
				style="height: 50px; width: 150px;"></a>

			<ul id=nav-ul style="width: 200px;">
				<li><a href="createRequest.group">새 그룹 시작하기</a>
				<li id=snd-list class="dropdown active"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"> <i
						class="fa fa-user" aria-hidden="true"></i>
				</a>
					<ul class="dropdown-menu dropdown-menu-right" style="width: 100px;">
						<li style="margin-left: 20px;"><a href="LogoutController.co">로그아웃
						</a></li>
						<li style="margin-left: 20px;"><a href="mypage.co">프로필</a></li>
					</ul>
			</ul>
		</nav>





	</c:when>

	<c:when
		test="${(sessionScope.loginId != null) && (sessionScope.idAlreadyExist == true) }">

		<nav>

			<a href="index.jsp"><img src="https://i.imgur.com/axIYcKj.png"
				class="animated wobble" style="height: 50px; width: 150px;"></a>

			<ul id=nav-ul style="width: 200px;">

				<li><a href="createRequest.group">새 그룹 시작하기</a>
				<li id=snd-list class="dropdown active"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"> <i
						class="fa fa-user" aria-hidden="true"></i>
				</a>

					<ul class="dropdown-menu dropdown-menu-right" style="width: 100px;">
						<li><a href="LogoutController.co">로그아웃 </a></li>
						<li><a href="mypage.co">마이페이지 </a></li>
					</ul>
			</ul>
		</nav>
	</c:when>


	<c:when test="${sessionScope.loginId == null }">

		<nav>
			<a href="index.jsp"><img src="https://i.imgur.com/axIYcKj.png"
				class="animated fadeInLeft" style="height: 50px; width: 150px;"></a>

			<ul id=nav-ul class="fadeInRight animated" style="width: 290px;">
				<li><a href="createRequest.group">새 그룹 시작하기</a>
				<li><a href="login.jsp">로그인</a> <!-- 클릭시 idTypeQuestion 라는 모달 띄움 -->
				<li><a onclick="displayData(11,1,0,'A')" onmouseover="" style="cursor: pointer;" 
				><i data-target="#idTypeQuestions"
					data-toggle="modal" class="fa fa-user" aria-hidden="true"></i> 가입하기</a>
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
							<button id=signUpWithEmail class="btn btn-light btn-block"
								onclick="window.location.href='signUpWithEmail.jsp'">✉
								이메일로 회원가입</button>
							<div style="text-align: center;">
								<br> 또는 <br> <br>
							</div>
							<!-- 카카오톡으로 회원가입 버튼 -->
							<button id="kakao-signUp-btn" class="btn btn-warning btn-block"
								onclick="javascript:kakaoProc()">🗨 카카오 로그인</button>
							<!-- 페이스북 -->
							<button onclick="signIn()" class="btn btn-primary btn-block">f
								페이스북 로그인</button>
							<!-- Google Login API -->
							<button type=button class="btn btn-success btn-block"
								onclick="google_login_in()">g 구글 로그인</button>

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
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





		</nav>
	</c:when>

</c:choose>



