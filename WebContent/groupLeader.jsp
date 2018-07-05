<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/group/top.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<link rel="stylesheet" type="text/css" href="css/groupMember-style.css?ver=3">
<link rel="stylesheet" type="text/css" href="css/main-calender-style.css">

<div id="navi-div">
	
	<ul class="nav nav-tabs">
		<c:forEach var="item" items="${result }">
			<li role="presentation"><a href="groupMain.group?group_seq=${item.group_seq}&page=info">정보</a></li>
			<li role="presentation"><a href="groupMain.group?group_seq=${item.group_seq}&page=meetupNext">Meetup</a></li>
			<li role="presentation"><a href="groupMain.group?group_seq=${item.group_seq}&page=member">회원</a></li>
			<li role="presentation">
			<a href="groupMain.group?group_seq=${item.group_seq}&page=photo">사진</a>
			</li>
		</c:forEach>
		
	</ul>
			
			
			<div class="btn-group" style="position: absolute; right: 500px; top: 475px;">
				<button type="button" class="btn btn-default dropdown-toggle"
					data-toggle="dropdown" aria-expanded="false">
					<c:if test="${isGroupMember eq true }">
					회원입니다.
					</c:if>
					<c:if test="${isGroupMember eq false }">
					이 그룹에 가입하기
					</c:if>
				</button>
				<ul class="dropdown-menu" role="menu">
					<li><a href="#">이 그룹 탈퇴</a></li>
					<li><a href="#">그룹 신고</a></li>
				</ul>
			</div>
			
			

			
			
			<c:if test="${isGroupMember eq false }">
			<!-- Single button -->
			<div class="btn-group" style="position: absolute; right: 430px; top: 475px;">
				<button type="button" class="btn btn-default dropdown-toggle"
					data-toggle="dropdown" aria-expanded="false">
					<span class="glyphicon glyphicon-option-horizontal"
						aria-hidden="true"></span> <span class="caret"></span>
				</button>
				<ul class="dropdown-menu" role="menu">
					<li><a href="#">그룹 신고</a></li>
				</ul>
			</div>
			
			</c:if>
</div>

<div id="contents">
	<div id="wrapper">
		<div id="tab">
			<c:forEach var="item" items="${result }">
			<a href="groupMain.group?group_seq=${item.group_seq}&page=member">모든회원</a>
			<a href="groupMain.group?group_seq=${item.group_seq}&page=leader">주최자</a>
			</c:forEach>
		</div>
		
		<div id="memberList">
			<div class="row" style="padding-left: 20px;">
				<c:forEach var="memberList" items="${memberList }">
				<c:if test="${memberList.group_leader eq memberList.member_name}">
				<div class="col-md-4" style="width:200px; height:300px;">
					<img src="files/${memberList.member_picture }" class="member-photo">
					<div class="member-info">
						<h4>${memberList.member_name }</h4>
						가입 날짜 : <br>
						<fmt:parseDate value="${memberList.join_date}" var="time"  pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate value="${time}" pattern="M"/>월  
                              <fmt:formatDate value="${time}" pattern="dd"/>일      
                              <fmt:formatDate value="${time}" pattern="E"/>요일  <br>
                              	주최자 
                              <img src="img/msg.png" style="width:20px; padding-top: 10px;">
						</div>
					</div>
				</c:if>
				
				
				</c:forEach>
				</div>
			</div>
		</div>
		
	</div>
</div>

<footer>
	<%@ include file="include/bottom.jsp"%>
</footer>
</body>
</html>