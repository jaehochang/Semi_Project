<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/group/top.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<link rel="stylesheet" type="text/css" href="css/groupMeetup-style.css?ver=1">
<link rel="stylesheet" type="text/css" href="css/group-meeting-contents.css?ver=1">
<link rel="stylesheet" type="text/css" href="css/main-calender-style.css">
		
<div id="navi-div">
		<ul class="nav nav-tabs">
		<c:forEach var="item" items="${result }">
			<li role="presentation"><a href="groupMain.group?group_seq=${item.group_seq}&page=info">정보</a></li>
			<li role="presentation" class="active"><a href="groupMain.group?group_seq=${item.group_seq}&page=meetup">Meetup</a></li>
			<li role="presentation"><a href="groupMain.group?group_seq=${item.group_seq}&page=member">회원</a></li>
			<li role="presentation">
			<a href="groupMain.group?group_seq=${item.group_seq}&page=photo">사진</a>
			</li>
		</c:forEach>	
		</ul>
	</div>
	<div id="contents">
	<div id="wrapper">
		<div id="tab">
			<c:forEach var="item" items="${result }">
			<a href="groupMain.group?group_seq=${item.group_seq}&page=meetupNext">예정</a>
			<a href="groupMain.group?group_seq=${item.group_seq}&page=meetupLast";>과거</a>
			</c:forEach>
		</div>
		
		
		
		
		<div id="no-meeting">
			<h4>지난 Meetup 없음</h4>
		</div>
		
		
		
		
		<div id="preMeetingList">
		<c:forEach var="lastMeeting" items="${lastMeeting}">
			<div id="meetup-plan-contents" style="margin-bottom: 25px;">
				
					<div style="width: 70%; hegith: 100%; float: left">
						<time class="icon">
							<strong><fmt:formatDate value="${lastMeeting.meeting_start_time}" pattern="M" />월</strong>
							<span><fmt:formatDate value="${lastMeeting.meeting_start_time}" pattern="dd" /></span>
						</time>
						<div class="meeting-info"
							style="padding-left: 150px; padding-top: 30px;">
							<div class="" style="color: #8b96a8;">
								<fmt:formatDate value="${lastMeeting.meeting_start_time}" pattern="M" />
								월
								<fmt:formatDate value="${lastMeeting.meeting_start_time}" pattern="dd" />
								일
								<fmt:formatDate value="${lastMeeting.meeting_start_time}" pattern="E" />
								요일
								<fmt:formatDate value="${lastMeeting.meeting_start_time}" pattern="a" />
								<fmt:formatDate value="${lastMeeting.meeting_start_time}" pattern="hh" />
								시
								<fmt:formatDate value="${lastMeeting.meeting_start_time}" pattern="mm" />
								분
							</div>
							<h2>
								<p id="btag">
									<b>${lastMeeting.meeting_title }</b>
								</p>
							</h2>
							<div id="meetup-leader">
								<div style="width: 20%; hegiht: 60px; float: left;">
									<img src="img/10.jpg"
										style="width: 50px; height: 50px; border-radius: 150px;">
								</div>
								<div style="width: 80%; hegiht: 60px; float: left;">
									<h5 style="padding-top: 20px;">
										주최자 : <a href="">${lastMeeting.group_leader }</a>
									</h5>
								</div>
							</div>

							<h5>
								<p id="nextMeeting-contents">${lastMeeting.meeting_contents }</p>
							</h5>
						</div>
					</div>
					<div style="width: 30%; hegith: 100%; float: left;">
						<div id="meetup-img">
							<img src="files/${lastMeeting.meeting_picture }">
						</div>

						<div id="meetup-location">
							<span class="glyphicon glyphicon-map-marker" aria-hidden="true"
								style="color: gray;"></span> 당산역<br>
						</div>

					</div>

				
			</div>
			</c:forEach>
		</div>
		
		<c:if test="${fn:length(lastMeeting)>0}">
			<script>
				$("#no-meeting").remove();
			</script>
		</c:if>
		
		<c:if test="${fn:length(lastMeeting)<=0}">
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