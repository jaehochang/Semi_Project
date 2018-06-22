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
			<li><a href="#">로그인</a>
			<li><a href="#">가입하기</a>
		</ul>

	</c:when>

</c:choose>

