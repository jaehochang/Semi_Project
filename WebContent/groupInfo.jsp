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
		<c:forEach var="item" items="${result }">
			<li role="presentation" class="active"><a
				href="groupMain.group?group_seq=${item.group_seq}&page=info">정보</a></li>
			<li role="presentation"><a
				href="groupMain.group?group_seq=${item.group_seq}&page=meetup">Meetup</a></li>
			<li role="presentation"><a href="#">회원</a></li>
			<li role="presentation"><a href="#">사진</a></li>
		</c:forEach>
		
	</ul>
			
			
			
		
			<c:if test="${isGroupMember eq true }">
			<button type="button" class="btn" style="position: absolute; right: 450px; top: 475px; border: 1px solid #c4c4c4;">
				회원입니다.
			</button>
			</c:if>
			<c:if test="${isGroupMember eq false }">
			<button id="joinGroupBT" type="button" class="btn" style="position: absolute; right: 450px; top: 475px; border: 1px solid #c4c4c4;">
				이 그룹에 가입하기
			</button>
			</c:if>
			
			<c:forEach var="result" items="${result }">
				<input type="hidden" id="group_seq" value="${result.group_seq }">
				<input type="hidden" id="group_name" value="${result.group_name }">
			</c:forEach>
			
			<p id="response"></p>
			
			<script>
			$(document).ready(function(){
				$("#joinGroupBT").click(function(){
					
					var group_seq = $("#group_seq").val();
					var group_name = $("#group_name").val();
					
					$.ajax({
						url:"join.group",
						type:"get",
						data:{group_seq:group_seq,group_name:group_name},
						success:function(){
							console.log("전송성공!")
						},
						error : function(request,status,error) {
							console.log("에러발생 !" + request.status + " : " + status + " : " + error);
						}
					});
					
					
				})
			})
			
			
			</script>
			
			
			
			<!-- Single button -->
			<div class="btn-group" style="position: absolute; right: 400px; top: 475px;">
				<button type="button" class="btn btn-default dropdown-toggle"
					data-toggle="dropdown" aria-expanded="false">
					<span class="glyphicon glyphicon-option-horizontal"
						aria-hidden="true"></span> <span class="caret"></span>
				</button>
				<ul class="dropdown-menu" role="menu">
					<li><a href="#">그룹 신고</a></li>
				</ul>
			</div>
</div>

<div id="contents">


	<div id="wrapper">

		<div id="meetup-plan">

			<div id="meetup-plan-top">
				<span>다음 Meetup</span> <span id="meetup-plan-all"><a href="">모두보기</a></span>

			</div>
			<div id="meetup-plan-contents">
				<c:forEach var="nextMeeting" items="${nextMeeting}">
					<div style="width: 70%; hegith: 100%; float: left">
						<time class="icon">
							<strong><fmt:formatDate value="${nextMeeting.meeting_start_time}" pattern="M"/>월</strong>
                    		<span><fmt:formatDate value="${nextMeeting.meeting_start_time}" pattern="dd"/></span>
						</time>
						<div class="meeting-info"
							style="padding-left: 150px; padding-top: 30px;">
							<div class="" style="color:#8b96a8;" >
                        <fmt:formatDate value="${nextMeeting.meeting_start_time}" pattern="M"/>월
                        <fmt:formatDate value="${nextMeeting.meeting_start_time}" pattern="dd"/>일 
                        <fmt:formatDate value="${nextMeeting.meeting_start_time}" pattern="E"/>요일 
                        <fmt:formatDate value="${nextMeeting.meeting_start_time}" pattern="a"/> 
                        <fmt:formatDate value="${nextMeeting.meeting_start_time}" pattern="hh"/>시
                        <fmt:formatDate value="${nextMeeting.meeting_start_time}" pattern="mm"/>분 
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

				</c:forEach>
			</div>
		</div>



		<c:forEach var="item2" items="${result }">
			<div id="group-contents">
				<div id="group-plan">
					<h4 style="padding-top: 30px;">활동 계획</h4>
					<br> ${item2.group_info }
				</div>


				<div id="group-member">
					<div id="group-member-count">
						<span>회원(${count }명)</span> <span id="all-member"><a
							href="">모두 보기</a></span>
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
						<div id="member-card">
							<img src="img/member-default.png" id="member-img">
						</div>
					</div>
				</div>


				<div id="group-pic">
					<div id="photo-top">
						<div id="group-member-count">
							<span>사진(6장)</span> <span id="all-member"><a href="">모두보기</a></span>
						</div>
					</div>
					<div id="photo-pics">
						<div class="row">
							<div class="col-md-4">
								<img src="img/1.jpg" class="group-photo">
							</div>

							<div class="col-md-4">
								<img src="img/1.jpg" class="group-photo">
							</div>

							<div class="col-md-4">
								<img src="img/1.jpg" class="group-photo">
							</div>

							<div class="col-md-4">
								<img src="img/1.jpg" class="group-photo">
							</div>

							<div class="col-md-4">
								<img src="img/1.jpg" class="group-photo">
							</div>

							<div class="col-md-4">
								<img src="img/1.jpg" class="group-photo">
							</div>

						</div>
					</div>
				</div>
			</div>


			<div id="last-meetup">
				<div id="pre-meetup-top">
					<span style="padding-top: 80px;">예정된 Meetup</span> <span
						id="last-meetup-all"><a href="">모두보기</a></span>
				</div>
				<div id="pre-meetup-div">
					<c:forEach var="preMeeting" items="${preMeeting }">
						<div id="premeetup">
							
							 <time class="icon">
                  <strong><fmt:formatDate value="${preMeeting.meeting_start_time}" pattern="M"/>월</strong>
                    <span><fmt:formatDate value="${preMeeting.meeting_start_time}" pattern="dd"/></span>
                  </time>

							<div id="lastmeetup-title">
								<div class="" style="color:#8b96a8;" >
                        <fmt:formatDate value="${preMeeting.meeting_start_time}" pattern="M"/>월
                        <fmt:formatDate value="${preMeeting.meeting_start_time}" pattern="dd"/>일 
                        <fmt:formatDate value="${preMeeting.meeting_start_time}" pattern="E"/>요일 
                        <fmt:formatDate value="${preMeeting.meeting_start_time}" pattern="a"/> 
                        <fmt:formatDate value="${preMeeting.meeting_start_time}" pattern="hh"/>시
                        <fmt:formatDate value="${preMeeting.meeting_start_time}" pattern="mm"/>분 
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
					<span style="padding-top: 80px;">지난 Meetup</span> <span
						id="last-meetup-all"><a href="">모두보기</a></span>
				</div>
				<div id="last-meetup-div">
					<c:forEach var="lastMeeting" items="${lastMeeting }">
						<div id="lastmeetup">
							<time class="icon">
								<strong><fmt:formatDate value="${lastMeeting.meeting_start_time}" pattern="M" />월</strong>
								<span><fmt:formatDate value="${lastMeeting.meeting_start_time}" pattern="dd" /></span>
							</time>

							<div id="lastmeetup-title">
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
						$("#pre-meetup-top").remove();
						$("#pre-meetup-div").remove();
					</script>
				</c:if>

			</div>
		</c:forEach>
	</div>
</div>

<footer>
	<%@ include file="include/bottom.jsp"%>
</footer>
</body>
</html>