<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!-- session에서 id값이 있는 경우 : 로그인이 되어있는 경우 -->

<c:choose>
	<c:when test="${sessionScope.loginId != null}">


		<a href="main.jsp"><img src="https://i.imgur.com/axIYcKj.png"
			style="height: 50px; width: 150px;"></a>
		<ul id=nav-ul>

			<li><a href="#">새 그룹 시작하기</a>
			<li><a href="#">탐색</a>
			<li><a href="#">메시지</a>
			<li><a href="#">알림</a>
			<li><a href="#"><i class="fas fa-user"></i></a>
		</ul>

	</c:when>


	<c:when test="${sessionScope.loginId == null }">


		<a href="main.jsp"><img src="https://i.imgur.com/axIYcKj.png"
			style="height: 50px; width: 150px;"></a>
		<ul id=nav-ul>

			<li><a href="#">새 그룹 시작하기</a>
			<li><a href="login.jsp">로그인</a>
			<li><button type="button" class="btn btn-primary"
					data-toggle="modal" data-target="#idTypeQuestions">가입하기</button> <!-- Modal -->
				<div class="modal fade" id="idTypeQuestions" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalCenterTitle"
					aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header" style="margin: 0 auto; text-align:center;">
								<h3 class="modal-title">가입하기</h3>
								<p style="color: grey;">이미 회원이신가요?</p>
								<a href="#">로그인</a>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
<!-- 								<button type="button" class="btn btn-secondary" style="background-color:#b831d9;color:white;" -->
<!-- 									data-dismiss="modal">카카오톡으로 로그인</button> -->

<!-- 								<button type="button" class="btn btn-primary" data-dismiss="modal">페이스북으로 로그인</button> -->

<!-- 								<button type="button" class="btn btn-primary" data-dismiss="modal">네이버로 로그인</button> -->
<!-- 								<p style="color: grey;">또는</p> -->
								<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="window.location.href='signUpPage.co'" style="text-align:center;margin:0 auto;">이메일로 가입하기</button>



							</div>
						</div>
					</div>
				</div>
		</ul>


	</c:when>

</c:choose>

