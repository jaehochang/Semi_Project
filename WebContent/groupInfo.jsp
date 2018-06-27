<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/group/top.jsp"%>
<link rel="stylesheet" type="text/css" href="css/groupInfo-style.css">

<div id="navi-div">
	<ul class="nav nav-tabs">
		<c:forEach var="item" items="${result }">
			<li role="presentation" class="active"><a href="groupMain.group?group_seq=${item.group_seq}&page=info">정보</a></li>
			<li role="presentation"><a href="groupMain.group?group_seq=${item.group_seq}&page=meetup">Meetup</a></li>
			<li role="presentation"><a href="#">회원</a></li>
			<li role="presentation"><a href="#">사진</a></li>
		</c:forEach>
	</ul>
</div>

<div id="contents">
	<div id="wrapper">
		<c:forEach var="item2" items="${result }">
			<div id="group-contents">
				<div id="group-plan">
					<h4>활동 계획</h4><br>
					${item2.group_info }
				</div>
				<div id="group-member">
					<div id="group-member-count">
						<span>회원(${count }명)</span>
						<span id="all-member"><a href="" >모두 보기</a></span>
					</div>
					<div id="groupleader-info">
						<img src="img/10.jpg">
					</div>
				</div>
				<div id="group-pic"></div>
			</div>
			<div id="last-meetup"></div>
		</c:forEach>
	</div>
</div>

<footer>
	<%@ include file="include/bottom.jsp"%>
</footer>
</body>
</html>