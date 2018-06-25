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
			<li id=snd-list><a href="#">탐색</a>
			<li><a href="#">메시지</a>
			<li><a href="#">알림</a>
			<li class="dropdown active"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown"><i class="fas fa-user"></i></a>

				<ul class="dropdown-menu">
					<li><a href="LogoutController.co">로그아웃 </a></li>
					<li><a href="mypage.jsp">마이페이지 </a></li>
				</ul>
		</ul>


	</c:when>


	<c:when test="${sessionScope.loginId == null }">


		<a href="main.jsp"><img src="https://i.imgur.com/axIYcKj.png"
			style="height: 50px; width: 150px;"></a>
		<ul id=nav-ul>

			<li><a href="#">새 그룹 시작하기</a>
			<li><a href="login.jsp">로그인</a>
			<li><button type="button" class="btn btn-default"
					data-toggle="modal" data-target="#idTypeQuestions" onclick="window.open('signUpPage.jsp')">가입하기</button>
		</ul>


	</c:when>

</c:choose>

