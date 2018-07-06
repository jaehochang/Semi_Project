<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/group/top.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<link rel="stylesheet" type="text/css"
	href="css/groupInfo-style.css?ver=1">
<link rel="stylesheet" type="text/css"
	href="css/main-calender-style.css">

<div id="navi-div">

	<ul class="nav nav-tabs">
		<c:forEach var="item" items="${result}">
			<li role="presentation" class="active"><a
				href="groupMain.group?group_seq=${item.group_seq}&page=info">정보</a></li>
			<li role="presentation"><a
				href="groupMain.group?group_seq=${item.group_seq}&page=meetupNext">Meetup</a></li>
			<li role="presentation"><a
				href="groupMain.group?group_seq=${item.group_seq}&page=member">회원</a></li>
			<li role="presentation">
			<a href="groupMain.group?group_seq=${item.group_seq}&page=photo">사진</a></li>
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

<div id="contents" style="background-color: #f4f6f7; height:1800px;">


	<div id="wrapper">

		<div id="meetup-plan">

			<c:forEach var="result" items="${result}">
				<div id="meetup-plan-top">
					<span>다음 Meetup</span> <span id="meetup-plan-all"> <a
						href="groupMain.group?group_seq=${result.group_seq}&page=meetupNext">모두보기</a>
					</span>
				</div>
			</c:forEach>


			
			
				<c:forEach var="nextMeeting" items="${nextMeeting}">
				<div id="meetup-plan-contents" onclick="location.href='meeting.meet?seq=${nextMeeting.meeting_seq }';">
				
					<div style="width: 70%; hegith: 100%; float: left">
						<time class="icon">
							<strong><fmt:formatDate
									value="${nextMeeting.meeting_start_time}" pattern="M" />월</strong> <span><fmt:formatDate
									value="${nextMeeting.meeting_start_time}" pattern="dd" /></span>
						</time>
						<div class="meeting-info"
							style="padding-left: 150px; padding-top: 30px;">
							<div class="" style="color: #8b96a8;">
								<fmt:formatDate value="${nextMeeting.meeting_start_time}"
									pattern="M" />
								월
								<fmt:formatDate value="${nextMeeting.meeting_start_time}"
									pattern="dd" />
								일
								<fmt:formatDate value="${nextMeeting.meeting_start_time}"
									pattern="E" />
								요일
								<fmt:formatDate value="${nextMeeting.meeting_start_time}"
									pattern="a" />
								<fmt:formatDate value="${nextMeeting.meeting_start_time}"
									pattern="hh" />
								시
								<fmt:formatDate value="${nextMeeting.meeting_start_time}"
									pattern="mm" />
								분
							</div>
							<h2>
								<p id="btag">
									<b>${nextMeeting.meeting_title }</b>
								</p>
							</h2>
							<div id="meetup-leader">
								<div style="width: 20%; hegiht: 60px; float: left;">
									<img src="img/10.jpg"
										style="width: 50px; height: 50px; border-radius: 150px;">
								</div>
								<div style="width: 80%; hegiht: 60px; float: left;">
									<h5 style="padding-top: 20px;">
										주최자 : <a href="">${nextMeeting.group_leader }</a>
									</h5>
								</div>
							</div>

							<h5>
								<p id="nextMeeting-contents">${nextMeeting.meeting_contents }</p>
							</h5>
						</div>
					</div>
					<div style="width: 30%; hegith: 100%; float: left;">
						<div id="meetup-img">
							<img src="files/${nextMeeting.meeting_picture }">
						</div>

						<div id="meetup-btn">
							<button type="button" class="btn btn-secondary"
								style="width: 200px; background-color: #b831d9; color: white;">참석</button>
						</div>
						<div id="meetup-location">
							<span class="glyphicon glyphicon-map-marker" aria-hidden="true"
								style="color: gray;"></span> 당산역<br>
						</div>

					</div>
					</div>
				</c:forEach>
		</div>



		<c:forEach var="item2" items="${result }">
			<div id="group-contents">
				<div id="group-plan">
					<h4 style="padding-top: 30px;">활동 계획</h4>
					<br> ${item2.group_info }
				</div>


				<div id="group-member">
					<div id="group-member-count">
						<span>회원(${count }명)</span> <span id="all-member">
						
						<a href="groupMain.group?group_seq=${item2.group_seq}&page=member">모두 보기</a>
						</span>
					</div>
					<div id="groupleader-info">
						<div id="groupleader-info-img">
							<img src="img/10.jpg">
						</div>
						<div id="groupleader-info-name">
							<h6>주최자 :</h6>
							<h4>${item2.group_leader }</h4>
						</div>

					</div>

					<div id="group-member-list">
						<div class="row">
							<c:forEach var="items" items="${memberList}">
								<div class="col-md-3">
									<img src="files/${items.member_picture}">
									<div class="member-info">
										<p>
											<b>${items.member_name}</b>
										</p>
										<p>회원</p>
									</div>
								</div>
							</c:forEach>

						</div>
					</div>
				</div>


				<div id="group-pic">
					<div id="photo-top">
						<div id="group-member-count">
							<span>사진(${groupPagePicCount }장)</span> <span id="all-member"><a href="">모두보기</a></span>
						</div>
					</div>
					<div id="photo-pics">
						<div class="row">
							<c:forEach var="groupPagePic" items="${groupPagePic }" varStatus="status">
								<c:if test="${status.count < 7}">
									<div class="col-md-4" style="margin-bottom: 5px;">
										<img src="files/${groupPagePic.system_name }" class="group-photo">
									</div>
								</c:if>
									
							</c:forEach>
						</div>
					</div>
				</div>
			</div>


			<div id="last-meetup">
				<div id="pre-meetup-top">
					<c:forEach var="result" items="${result }">
						<span style="padding-top: 80px;">예정된 Meetup</span>
						<span id="last-meetup-all"> <a
							href="groupMain.group?group_seq=${result.group_seq}&page=meetupNext">모두보기</a>
						</span>
					</c:forEach>
				</div>
				
				<div id="pre-meetup-div" >
					
					<c:forEach var="preMeeting" items="${preMeeting }">
					<div id="noPremeetup" onclick="location.href='meeting.meet?seq=${preMeeting.meeting_seq }';">
					<p style="padding-left: 5px; padding-top: 5px;">예정된 Meetup이 없습니다.</p>
					</div>
				
						<div id="premeetup" onclick="location.href='meeting.meet?seq=${preMeeting.meeting_seq }';">

							<time class="icon">
								<strong><fmt:formatDate
										value="${preMeeting.meeting_start_time}" pattern="M" />월</strong> <span><fmt:formatDate
										value="${preMeeting.meeting_start_time}" pattern="dd" /></span>
							</time>

							<div id="lastmeetup-title">
								<div class="" style="color: #8b96a8;">
									<fmt:formatDate value="${preMeeting.meeting_start_time}"
										pattern="M" />
									월
									<fmt:formatDate value="${preMeeting.meeting_start_time}"
										pattern="dd" />
									일
									<fmt:formatDate value="${preMeeting.meeting_start_time}"
										pattern="E" />
									요일
									<fmt:formatDate value="${preMeeting.meeting_start_time}"
										pattern="a" />
									<fmt:formatDate value="${preMeeting.meeting_start_time}"
										pattern="hh" />
									시
									<fmt:formatDate value="${preMeeting.meeting_start_time}"
										pattern="mm" />
									분
								</div>
								<h4>
									<b id="last-title">${preMeeting.meeting_title }</b>
								</h4>
							</div>
							<div id="lastmeetup-attend"></div>
							<button type="button" class="btn btn-secondary"
								style="width: 200px; background-color: #b831d9; color: white; margin-left: 90px; margin-top: 25px;">참석</button>
						</div>
					</c:forEach>
				</div>
				
				


				<div id="last-meetup-top">
					<c:forEach var="result" items="${result }">
						<span style="padding-top: 80px;">지난 Meetup</span>
						<span id="last-meetup-all"> <a
							href="groupMain.group?group_seq=${result.group_seq}&page=meetupLast">모두보기</a>
						</span>
					</c:forEach>
				</div>
				<div id="last-meetup-div">
					<c:forEach var="lastMeeting" items="${lastMeeting }">
						<div id="lastmeetup" onclick="location.href='meeting.meet?seq=${lastMeeting.meeting_seq }';">
							<time class="icon">
								<strong><fmt:formatDate
										value="${lastMeeting.meeting_start_time}" pattern="M" />월</strong> <span><fmt:formatDate
										value="${lastMeeting.meeting_start_time}" pattern="dd" /></span>
							</time>

							<div id="lastmeetup-title">
								<div class="" style="color: #8b96a8;">
									<fmt:formatDate value="${lastMeeting.meeting_start_time}"
										pattern="M" />
									월
									<fmt:formatDate value="${lastMeeting.meeting_start_time}"
										pattern="dd" />
									일
									<fmt:formatDate value="${lastMeeting.meeting_start_time}"
										pattern="E" />
									요일
									<fmt:formatDate value="${lastMeeting.meeting_start_time}"
										pattern="a" />
									<fmt:formatDate value="${lastMeeting.meeting_start_time}"
										pattern="hh" />
									시
									<fmt:formatDate value="${lastMeeting.meeting_start_time}"
										pattern="mm" />
									분
								</div>
								<h4>
									<b id="last-title">${lastMeeting.meeting_title }</b>
								</h4>
							</div>
							<div id="lastmeetup-attend"></div>
						</div>
					</c:forEach>
				</div>


				<c:if test="${fn:length(nextMeeting)<=0}">
					<script>
						$("#meetup-plan").remove();
					</script>
				</c:if>

				<c:if test="${fn:length(lastMeeting)<=0}">
					<script>
						$("#last-meetup-top").remove();
						$("#last-meetup-div").remove();
					</script>
				</c:if>

				<c:if test="${fn:length(preMeeting)<=0}">
					<script>
						
						$("#premeetup").remove();
					</script>
				</c:if>

				<c:if test="${fn:length(preMeeting)>0}">
					<script>
						
						$("#noPremeetup").remove();
					</script>
				</c:if>
			</div>
		</c:forEach>
	</div>
</div>


</body>
</html>