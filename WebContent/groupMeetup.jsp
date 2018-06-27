<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/group/top.jsp"%>

<div id="navi-div">
		<ul class="nav nav-tabs">
		<c:forEach var="item" items="${result }">
			<li role="presentation"><a href="groupMain.group?group_seq=${item.group_seq}&page=info">정보</a></li>
			<li role="presentation" class="active"><a href="groupMain.group?group_seq=${item.group_seq}&page=meetup">Meetup</a></li>
			<li role="presentation"><a href="#">회원</a></li>
			<li role="presentation"><a href="#">사진</a></li>
		</c:forEach>	
		</ul>
	</div>

밋업
	<footer> <%@ include file="include/bottom.jsp"%>
	</footer>
</body>
</html>