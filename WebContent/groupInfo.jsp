<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/group/top.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<link rel="stylesheet" type="text/css"
	href="css/groupInfo-style.css?ver=2">
<link rel="stylesheet" type="text/css"
	href="css/main-calender-style.css">
	
<div id="navi-div">

	<ul class="nav nav-tabs">
		<c:forEach var="item" items="${result}">
			<c:set var="groupSeqvar" value="${item.group_seq}" scope="request"/>
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
	
	<c:forEach var="result" items="${result }">
		<div class="btn-group" 
			style="position: absolute; right: 430px; top: 475px;">  
				<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" 
				aria-expanded="false" id="memberBT">회원입니다.</button>
				<button type="button" onclick="location.href='newmeetingform.meet?group_seq=${result.group_seq}'" 
	class="btn btn-secondary" id="newMeetingBT">MeetUp 계획</button>
			<ul class="dropdown-menu" role="menu">
				<li><a href="out.group?group_seq=${result.group_seq }">이 그룹 탈퇴</a></li>
				<li><a href="#">그룹 신고</a></li>
			</ul>
		</div>
	</c:forEach>
	
	
	
	<!-- 그룹 관리 -->
	<div class="btn-group"
		style="position: absolute; right: 600px; top: 475px;">
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
			style="position: absolute; right: 430px; top: 475px;" id="check">
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
				<div id="meetup-plan-contents">
				
					<div style="width: 70%; hegith: 100%; float: left">
						<time class="icon">
							<strong><fmt:formatDate
									value="${nextMeeting.meeting_start_time}" pattern="M" />월</strong> <span><fmt:formatDate
									value="${nextMeeting.meeting_start_time}" pattern="dd" /></span>
						</time>
						<div class="meeting-info"  onclick="location.href='meeting.meet?seq=${nextMeeting.meeting_seq }';"
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
								style="width: 200px; background-color: #b831d9; color: white;" id="joinMeetupBT">참석</button>
						

							<div class="btn-group" style="width: 200px;" id="editMeetupBT" >
								<button type="button" class="btn btn-default dropdown-toggle"
									data-toggle="dropdown" aria-expanded="false" id="editMeetupBT">
									주최자 도구
								</button>
								<ul class="dropdown-menu" role="menu">
									<li><a href="#">Meetup 편집</a></li>
									<li><a href="#">Meetup 삭제</a></li>
								</ul>
							</div>
							
						</div>
						<div id="meetup-location">
							<span class="glyphicon glyphicon-map-marker" aria-hidden="true"
								style="color: gray;"></span> ${nextMeeting.meeting_location }<br>
						</div>

					</div>
					
				</c:forEach>
		</div>
		
		<script>
			$("#editMeetupBT").click(function(){
				
			})
		</script>

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
						<c:forEach var="leaderInfo" items="${leaderInfo }">
						<div id="groupleader-info-img">
							<img src="files/${leaderInfo.member_picture }">
						</div>
						<div id="groupleader-info-name">
							<h6>주최자 :</h6>
							<h4>${leaderInfo.member_name }</h4>
						</div>
						</c:forEach>
					</div>

					<div id="group-member-list">
						<div class="row">
							<c:forEach var="items" items="${memberList}" varStatus="status">
								<c:if test="${status.count < 9}">
								<div class="col-md-3">
									<img src="files/${items.member_picture}">
									<div class="member-info">
										<p>
											<b>${items.member_name}</b>
										</p>
										
										<c:choose>
											<c:when test="${items.member_email eq leader_email}">
												<p>주최자</p>
											</c:when>
											<c:otherwise>
												<p>회원</p>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
								</c:if>
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
								<c:if test="${status.count < 6}">
									<div class="col-md-4" style="margin-bottom: 5px;"
									onclick="location.href='groupMain.group?group_seq=${groupPagePic.group_seq}&page=photo';">
										<img src="files/${groupPagePic.system_name }" class="group-photo">
									</div>
								</c:if>
								<c:if test="${status.count== 7}">
									<div class="col-md-4" style="margin-bottom: 5px;"
									onclick="location.href='groupMain.group?group_seq=${groupPagePic.group_seq}&page=photo';">
										<img src="files/${groupPagePic.system_name }" class="group-photo-last">
										<p style="position:absolute; top:65px; right:85px; font-weight: 700;">+${groupPagePicCount-6 }</p>
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
						<span style="padding-top: 180px;">예정된 Meetup</span>
						<span id="last-meetup-all"> <a
							href="groupMain.group?group_seq=${result.group_seq}&page=meetupNext">모두보기</a>
						</span>
					</c:forEach>
				</div>
				
				<div id="pre-meetup-div" >
					
					<div id="noPremeetup">
					<p style="padding-left: 5px; padding-top: 5px;">예정된 Meetup이 없습니다.</p>
					</div>
					
					<c:forEach var="preMeeting" items="${preMeeting }">
				
						<div id="premeetup" >

							<time class="icon">
								<strong><fmt:formatDate
										value="${preMeeting.meeting_start_time}" pattern="M" />월</strong> <span><fmt:formatDate
										value="${preMeeting.meeting_start_time}" pattern="dd" /></span>
							</time>

							<div id="lastmeetup-title" onclick="location.href='meeting.meet?seq=${preMeeting.meeting_seq }';">
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
							<button type="button" class="btn btn-secondary"
								style="width: 200px; background-color: #b831d9;
								color: white; margin-left: 90px; margin-top: 25px;" id="joinMeetupBT2">참석</button>
								
							<div class="btn-group" style="width: 200px;" id="editMeetupBT" >
								<button type="button" class="btn btn-default dropdown-toggle"
									data-toggle="dropdown" aria-expanded="false" id="editMeetupBT2">
									주최자 도구
								</button>
								<ul class="dropdown-menu" role="menu">
									<li><a href="#">Meetup 편집</a></li>
									<li><a href="#">Meetup 삭제</a></li>
								</ul>
							</div>
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
						<div id="lastmeetup" >
							<time class="icon">
								<strong><fmt:formatDate
										value="${lastMeeting.meeting_start_time}" pattern="M" />월</strong> <span><fmt:formatDate
										value="${lastMeeting.meeting_start_time}" pattern="dd" /></span>
							</time>

							<div id="lastmeetup-title" onclick="location.href='meeting.meet?seq=${lastMeeting.meeting_seq }';">
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
							<div id="lastmeetup-attend">
								<div id="attend-pic">
									<div class="row" id="attend-row">
										
										


									</div>
								</div>
								<div id="attend-text">
								</div>
								<script>
											var meetingSep = ${lastMeeting.meeting_seq}

											$.ajax({
												url : "attendMem.group",
												type : "post",
												data : {meetingSep : meetingSep},
												success : function(resp) {
													
													if(resp.length <0){
														$("#lastmeetup-attend").remove();
													}
													
													for (var i = 0; i < resp.length; i++) {
														var picture = resp[i].member_picture;
														var count = resp[i].count;
														console.log("dd");
														console.log(picture);
														$("#attend-row").after(
																"<div class='col-md-2' id='attend-col-2'><img src='files/"+picture+"' class='attend-col-img'></div>"
																);
														
														$("#attend-text").html("<p style='color:gray; padding-top:8px; padding-left:5px;'>"+count+"명 참석했음</p>");
													}
													
													
													
												}
											})
										</script>
							</div>
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

				
				<c:if test="${fn:length(nextMeeting)>0}">
					<c:if test="${fn:length(preMeeting)<=0}">
						<script>
							$("#pre-meetup-top").remove();
						</script>
					</c:if>
					<script>
						$("#noPremeetup").remove();
					</script>
				</c:if>
				
				<c:if test="${groupPagePicCount == 0}">
					<script>
						$("#group-pic").remove();
					</script>
				</c:if>
				
				
			</div>
		</c:forEach>
		
		<c:forEach var="result" items="${result }">
			<input type="hidden" id="group_seq" value="${result.group_seq }">
			<input type="hidden" id="group_name" value="${result.group_name }">
			
			<c:choose>
				<c:when test="${leader_email eq  sessionScope.loginId}">
					<script>
						$("#check").hide();
						$("#joinMeetupBT").hide();
						$("#joinMeetupBT2").hide();
						$("#joinGroupBT").hide();
						$("#memberBT").hide();
						$("#test").remove();
					</script>
				</c:when>
				<c:otherwise>
					<script>
						$("#editMeetupBT2").hide();
						$("#editMeetupBT").hide();
						$("#newMeetingBT").hide();
						$("#groupSettingBT").hide();
					</script>
				</c:otherwise>
			</c:choose>
			
	</c:forEach>
		
	</div>
</div>


</body>
</html>