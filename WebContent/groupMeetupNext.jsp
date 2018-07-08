<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/group/top.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<link rel="stylesheet" type="text/css" href="css/groupMeetup-style.css?ver=1">
<link rel="stylesheet" type="text/css" href="css/group-meeting-contents.css?ver=1">
<link rel="stylesheet" type="text/css" href="css/main-calender-style.css">
<link rel="stylesheet" type="text/css"
	href="css/groupInfo-style.css?ver=2">
		
<div id="navi-div">
		<ul class="nav nav-tabs">
		<c:forEach var="item" items="${result}">
			<li role="presentation"><a href="groupMain.group?group_seq=${item.group_seq}&page=info">정보</a></li>
			<li role="presentation" class="active"><a href="groupMain.group?group_seq=${item.group_seq}&page=meetup">Meetup</a></li>
			<li role="presentation"><a href="groupMain.group?group_seq=${item.group_seq}&page=member">회원</a></li>
			<li role="presentation">
			<a href="groupMain.group?group_seq=${item.group_seq}&page=photo">사진</a>
			</li>
		</c:forEach>	
		</ul>
		
		
		<div class="btn-group"
		style="position: absolute; transform: translate(400%, -140%);">
			<button type="button" class="btn btn-default dropdown-toggle" id="joinGroupBT">이 그룹에 가입하기</button>
		<ul class="dropdown-menu" role="menu">
		</ul>
	</div>
	
	<c:forEach var="result" items="${result }">
		<div class="btn-group" 
			style="position: absolute; transform: translate(600%, -140%);">  
				<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" 
				aria-expanded="false" id="memberBT">회원입니다.</button>
			<ul class="dropdown-menu" role="menu">
				<li><a href="out.group?group_seq=${result.group_seq }">이 그룹 탈퇴</a></li>
				<li><a href="#">그룹 신고</a></li>
			</ul>
		</div>
				<button type="button" onclick="location.href='newmeetingform.meet?group_seq=${result.group_seq}'" 
	class="btn btn-secondary" id="newMeetingBT">MeetUp 계획</button>
	</c:forEach>
	
	
	
	<!-- 그룹 관리 -->
	<div class="btn-group"
		style="position: absolute; transform: translate(700%, -140%);">
			<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" 
			aria-expanded="false" id="groupSettingBT">그룹 관리</button>
		<ul class="dropdown-menu" role="menu">
		<c:forEach var="result" items="${result }">
			<li><a href="toupdate.group?groupSeq=${result.group_seq}">그룹 내용 수정</a></li>
			<li><a href="#">그룹 흥미 수정</a></li>
		</c:forEach>
		</ul>
	</div>
	
	
	
	 

	
	
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
			

	<c:if test="${isGroupMember eq false }">
		<!-- Single button -->
		<div class="btn-group"
			style="position: absolute; transform: translate(1370%, -140%);" id="check">
			<button type="button" class="btn btn-default dropdown-toggle"
				data-toggle="dropdown" aria-expanded="false" id="test">
				<span class="glyphicon glyphicon-option-horizontal"
					aria-hidden="true"></span> <span class="caret"></span>
			</button>
			<ul class="dropdown-menu" role="menu">
				<li><a href="groupreport.group?group_seq=${group_seq }">그룹 신고</a></li>
			</ul>
		</div>

	</c:if>
	</div>
	
	
	
	<div id="contents" >
	<div id="wrapper">
		<div id="tab">
			<c:forEach var="item" items="${result }">
			<a href="groupMain.group?group_seq=${item.group_seq}&page=meetupNext">예정</a>
			<a href="groupMain.group?group_seq=${item.group_seq}&page=meetupLast">과거</a>
			</c:forEach>
		</div>
		
		
		<div id="no-meeting">
			<h4>예정된 Meetup 없음</h4>
		</div>
		
		
		
		
		<div id="preMeetingList">
			<%
				int cnt = 0;
			%>
			<c:forEach var="nextAllMeeting" items="${nextAllMeeting}">
				<%
					cnt = cnt + 1;
				%>
				<div id="meetup-plan-contents" style="margin-bottom: 30px;">
					<div style="width: 70%; hegith: 100%; float: left" onclick="location.href='meeting.meet?seq=${nextAllMeeting.meeting_seq }';">
						<time class="icon">
							<strong><fmt:formatDate value="${nextAllMeeting.meeting_start_time}" pattern="M" />월</strong>
							<span><fmt:formatDate value="${nextAllMeeting.meeting_start_time}" pattern="dd" /></span>
						</time>
						<div class="meeting-info"
							style="padding-left: 150px; padding-top: 30px;">
							<div class="" style="color: #8b96a8;">
								<fmt:formatDate value="${nextAllMeeting.meeting_start_time}" pattern="M" />
								월
								<fmt:formatDate value="${nextAllMeeting.meeting_start_time}" pattern="dd" />
								일
								<fmt:formatDate value="${nextAllMeeting.meeting_start_time}" pattern="E" />
								요일
								<fmt:formatDate value="${nextAllMeeting.meeting_start_time}" pattern="a" />
								<fmt:formatDate value="${nextAllMeeting.meeting_start_time}" pattern="hh" />
								시
								<fmt:formatDate value="${nextAllMeeting.meeting_start_time}" pattern="mm" />
								분
							</div>
							<h2>
								<p id="btag">
									<b>${nextAllMeeting.meeting_title }</b>
								</p>
							</h2>
							<div id="meetup-leader">
								
								<c:forEach var="leaderInfo" items="${leaderInfo }">
									
									<div style="width: 20%; hegiht: 60px; float: left;">
									<img src="files/${leaderInfo.member_picture }"
										style="width: 50px; height: 50px; border-radius: 150px;">
								</div>
								<div style="width: 80%; hegiht: 60px; float: left;">
									<h5 style="padding-top: 20px;">
										주최자 : <a href="">${leaderInfo.member_name }</a>
									</h5>
								</div>
							</c:forEach>
							</div>

							<h5>
								<p id="nextMeeting-contents">${nextAllMeeting.meeting_contents }</p>
							</h5>
						</div>
					</div>
					<div style="width: 30%; hegith: 100%; float: left;">
						<div id="meetup-img">
							<img src="files/${nextAllMeeting.meeting_picture }">
						</div>

						<div id="meetup-btn">
							<button type="button" class="btn btn-secondary"
								style="width: 200px; background-color: #b831d9; color: white;" id="joinMeetupBT<%=cnt%>">참석</button>
						
							<div class="btn-group" style="width: 200px; " id="editMeetupBT<%=cnt%>" >
								<button type="button" class="btn btn-default dropdown-toggle"
									data-toggle="dropdown" aria-expanded="false" style="width: 200px; ">
									주최자 도구
								</button>
								<ul class="dropdown-menu" role="menu">
									<li><a href="#">Meetup 편집</a></li>
									<li><a href="#">Meetup 삭제</a></li>
								</ul>
							</div>
							
						
						</div>
							<c:choose>
								<c:when test="${nextAllMeeting.member_email eq  sessionScope.loginId}">
									<script>
										$("#joinMeetupBT<%=cnt%>").hide();
									</script>
								</c:when>
								<c:otherwise>
									<script>
										$("#editMeetupBT<%=cnt%>").hide();
									</script>
								</c:otherwise>
							</c:choose>
							
						<div id="meetup-location">
							<span class="glyphicon glyphicon-map-marker" aria-hidden="true"
								style="color: gray;"></span> ${nextAllMeeting.meeting_location }<br>
						</div>

					</div>

			</div>
			</c:forEach>
		</div>
		
		<c:forEach var="result" items="${result }">
			<input type="hidden" id="group_seq" value="${result.group_seq }">
			<input type="hidden" id="group_name" value="${result.group_name }">
			
			<c:choose>
				<c:when test="${leader_email eq  sessionScope.loginId}">
					<script>
						$("#check").hide();
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
		
		
		<c:if test="${fn:length(nextAllMeeting)>0}">
			<script>
				$("#no-meeting").remove();
			</script>
		</c:if>
		
		<c:if test="${fn:length(nextAllMeeting)<=0}">
			<script>
				$("#meetup-plan-contents").remove();
			</script>
		</c:if>
		
		
		</div>
	</div>
		
		
	<footer> <%@ include file="include/bottom.jsp"%>
	</footer>
</body>
</html>