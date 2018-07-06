<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/group/top.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<link rel="stylesheet" type="text/css" href="css/groupMember-style.css?ver=1">
<link rel="stylesheet" type="text/css" href="css/main-calender-style.css">

<div id="navi-div">
	
	
	<ul class="nav nav-tabs">
		<c:forEach var="item" items="${result }">
			<li role="presentation"><a
				href="groupMain.group?group_seq=${item.group_seq}&page=info">정보</a></li>
			<li role="presentation"><a
				href="groupMain.group?group_seq=${item.group_seq}&page=meetupNext">Meetup</a></li>
			<li role="presentation"  class="active"><a
				href="groupMain.group?group_seq=${item.group_seq}&page=member">회원</a></li>
			<li role="presentation">
			<a href="groupMain.group?group_seq=${item.group_seq}&page=photo">사진</a>
			</li>
		</c:forEach>

	</ul>

	<div class="btn-group"
		style="position: absolute; right: 500px; top: 475px;">
			<button type="button" class="btn btn-default dropdown-toggle" id="joinGroupBT">이 그룹에 가입하기</button>
		<ul class="dropdown-menu" role="menu">
		</ul>
	</div>
	
	<div class="btn-group"
		style="position: absolute; right: 500px; top: 475px;">
			<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" 
			aria-expanded="false" id="memberBT">회원입니다.</button>
		<ul class="dropdown-menu" role="menu">
		<c:forEach var="result" items="${result }">
			<li><a href="out.group?group_seq=${result.group_seq }">이 그룹 탈퇴</a></li>
			<li><a href="#">그룹 신고</a></li>
		</c:forEach>
		</ul>
	</div>
	
	
	
	<!-- 그룹 관리 -->
	<div class="btn-group"
		style="position: absolute; right: 600px; top: 475px;">
			<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" 
			aria-expanded="false" id="groupSettingBT">그룹 관리</button>
		<ul class="dropdown-menu" role="menu">
		<c:forEach var="result" items="${result }">
			<li><a href="#">그룹 내용 수정</a></li>
			<li><a href="#">그룹 흥미 수정</a></li>
		</c:forEach>
		</ul>
	</div>
	
	
	
	
	
	
	<!-- 밋업 관리 -->
	<a href="#"><button type="button" class="btn btn-secondary" id="newMeetingBT">MeetUp 계획</button></a>
	
	
	
	<c:if test="${isGroupMember eq true }">
		<script>
			$("#joinGroupBT").hide();
		</script>
	</c:if>
	
	<c:if test="${isGroupMember eq false }">
		<script>
			$("#memberBT").hide();
		</script>
	</c:if>
	
	

	
	
			
			

	<c:if test="${isGroupMember eq false }">
		<!-- Single button -->
		<div class="btn-group"
			style="position: absolute; right: 430px; top: 475px;">
			<button type="button" class="btn btn-default dropdown-toggle"
				data-toggle="dropdown" aria-expanded="false" id="test">
				<span class="glyphicon glyphicon-option-horizontal"
					aria-hidden="true"></span> <span class="caret"></span>
			</button>
			<ul class="dropdown-menu" role="menu">
				<li><a href="#">그룹 신고</a></li>
			</ul>
		</div>

	</c:if>
	
	
	<c:forEach var="result" items="${result }">
			<input type="hidden" id="group_seq" value="${result.group_seq }">
			<input type="hidden" id="group_name" value="${result.group_name }">
			
			<c:choose>
				<c:when test="${result.member_email eq  sessionScope.loginId}">
					<script>
						$("#joinGroupBT").hide();
						$("#memberBT").hide();
						$("#test").remove();
					</script>
				</c:when>
				<c:otherwise>
					<script>
						$("#newMeetingBT").hide();
						$("#groupSettingBT").hide();
					</script>
				</c:otherwise>
			</c:choose>
			
	</c:forEach>
	
	
	<script>
				$("#joinGroupBT").click(function(){
					
					var group_seq = $("#group_seq").val();
					var group_name = $("#group_name").val();
					
					$.ajax({
						url:"join.group",
						type:"get",
						data:{group_seq:group_seq,group_name:group_name},
						success:function(resp){
							
							
							
							$("#memberBT").show();
							$("#joinGroupBT").hide();
							$("#test").remove();
						},
						error:function() {
							console.log("에러발생 !" + request.status + " : " + status + " : " + error);
						}
					});
				});
				
			</script>
	
	
</div>

<div id="contents">
	<div id="wrapper">
		<div id="memberSearch">
			<div style="margin-bottom: 10px;">
			<input type="text" class="form-control" id="search-input"
				placeholder="회원 찾기" style="width:300px;">
			<button type="button" class="btn btn-default" aria-label="Left Align" id="search-bt">
				<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
			</button>
			</div>
		</div>
		<div id="tab">
			<c:forEach var="item" items="${result }">
			<a href="groupMain.group?group_seq=${item.group_seq}&page=member">모든회원</a>
			<a href="groupMain.group?group_seq=${item.group_seq}&page=leader">주최자</a>
			</c:forEach>
		</div>
		<div id="memberList">
			<%int cnt=0;%>
			<c:forEach var="memberList" items="${memberList }">
			<%=cnt=cnt+1 %>			
			<hr>
			<div class="member">
				<div class="mem-img">
				
			<a href="memberprofile.group?member_email=${memberList.member_email}">
					<img src="files/${memberList.member_picture }" class="member-photo">
			</a>
				</div>
				<div class="mem-info">
					<h4>${memberList.member_name }</h4>
					<fmt:parseDate value="${memberList.join_date}" var="time"  pattern="yyyy-MM-dd HH:mm:ss"/>
					<fmt:formatDate value="${time}" pattern="M"/>월  
                    <fmt:formatDate value="${time}" pattern="dd"/>일      
                    <fmt:formatDate value="${time}" pattern="E"/>요일  <br>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
		
</div>

<footer>
	<%@ include file="include/bottom.jsp"%>
</footer>
</body>
</html>