<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/group/top.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<link rel="stylesheet" type="text/css"
	href="css/groupMember-style.css?ver=2">
<link rel="stylesheet" type="text/css"
	href="css/main-calender-style.css">
<link rel="stylesheet" type="text/css"
	href="css/groupMember-style.css?ver=1">
<link rel="stylesheet" type="text/css"
	href="css/main-calender-style.css">


<div id="navi-div">


	<ul class="nav nav-tabs">
		<c:forEach var="item" items="${result }">
			<li role="presentation"><a
				href="groupMain.group?group_seq=${item.group_seq}&page=info">정보</a></li>
			<li role="presentation"><a
				href="groupMain.group?group_seq=${item.group_seq}&page=meetupNext">Meetup</a></li>
			<li role="presentation" class="active"><a
				href="groupMain.group?group_seq=${item.group_seq}&page=member">회원</a></li>
			<li role="presentation"><a
				href="groupMain.group?group_seq=${item.group_seq}&page=photo">사진</a>
			</li>
		</c:forEach>

	</ul>

	<div class="btn-group"
		style="position: absolute; right: 500px; top: 475px;">
		<button type="button" class="btn btn-default dropdown-toggle"
			id="joinGroupBT">이 그룹에 가입하기</button>
		<ul class="dropdown-menu" role="menu">
		</ul>
	</div>

	<div class="btn-group"
		style="position: absolute; right: 500px; top: 475px;">
		<button type="button" class="btn btn-default dropdown-toggle"
			data-toggle="dropdown" aria-expanded="false" id="memberBT">회원입니다.</button>
		<ul class="dropdown-menu" role="menu">
			<c:forEach var="result" items="${result }">
				<li><a href="out.group?group_seq=${result.group_seq }">이 그룹
						탈퇴</a></li>
				<li><a href="groupreport.group?group_seq=${result.group_seq }">그룹
						신고</a></li>
			</c:forEach>
		</ul>
	</div>



	<!-- 그룹 관리 -->
	<div class="btn-group"
		style="position: absolute; right: 600px; top: 475px;">
		<button type="button" class="btn btn-default dropdown-toggle"
			data-toggle="dropdown" aria-expanded="false" id="groupSettingBT">그룹
			관리</button>
		<ul class="dropdown-menu" role="menu">
			<c:forEach var="result" items="${result }">
				<li><a href="#">그룹 내용 수정</a></li>
				<li><a href="#">그룹 흥미 수정</a></li>
			</c:forEach>
		</ul>
	</div>

	<!-- 밋업 관리 -->
	<a href="#"><button type="button" class="btn btn-secondary"
			id="newMeetingBT">MeetUp 계획</button></a>
	<!-- 밋업 수정 -->
	<a href="#"><button type="button" class="btn btn-secondary"
			id="newMeetingBT">MeetUp 계획</button></a>



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
				<c:forEach var="result" items="${result }">
					<li><a href="groupreport.group?group_seq=${result.group_seq }">그룹
							신고</a></li>
				</c:forEach>
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
		$("#joinGroupBT").click(
				function() {

					var group_seq = $("#group_seq").val();
					var group_name = $("#group_name").val();

					$.ajax({
						url : "join.group",
						type : "get",
						data : {
							group_seq : group_seq,
							group_name : group_name
						},
						success : function(resp) {

							$("#memberBT").show();
							$("#joinGroupBT").hide();
							$("#test").remove();
						},
						error : function() {
							console.log("에러발생 !" + request.status + " : "
									+ status + " : " + error);
						}
					});
				});
	</script>
</div>


<div id="contents">
	<div class="wrapper-member" style="">
		<div class="title-member">
			<a href=""><span class="glyphicon glyphicon-menu-left"
				style="font-size: 20px; float: left;"></span></a>
			<div class="group-info-member">회원 목록</div>
		</div>
		<div class="search-member">
			<div class="box-member">
				<div class="container-3">
					<span class="icon"><i class="fa fa-search"></i></span> <input
						type="search" id="search" placeholder="회원 찾기" />
				</div>
			</div>
		</div>
		<%
			int cnt = 0;
		%>
		<div id="countmem" class="count-attend-member">총${count } 명</div>
		<c:forEach var="memberList" items="${memberList}">
			<%
				cnt = cnt + 1;
			%>
			<div id="searchmem" class="attend-member">
<!-- 				<div id="membermem" class="member-mem"> -->
<%-- 					<img src="files/${memberList.member_picture}"> --%>
<!-- 					<div id="memberinfomem" class="member-info-mem"> -->
<!-- 						<div id="membername" class="member-name"> -->
<%-- 							<a href="#profile<%=cnt%>" data-toggle="modal" --%>
<%-- 								onclick="profile<%=cnt%>()"><b>${memberList.member_name}</b> --%>
<!-- 							</a> -->
<!-- 						</div> -->
<!-- 						<div>가입 날짜:</div> -->
<%-- 					<div class="attend-date">${memberList.join_date}</div> --%>
<!-- 				</div> -->
			</div>

				<script>
		var email<%=cnt%>;
		$('#search').keydown(function() {
			var text = $('#search').val();
			var group_seq = ${sessionScope.groupSeq};
			
			$.ajax({
				url:"groupmembersearch.group",
				type:"get",
				data:{
					group_seq,
					text
				},
				success:function(resp){
					console.log(resp);
					var output;  
					
					if (resp.gmlist.length == 0) {
						console.log(resp.gmlist.length);
						
					}else{
					 for (var i = 0; i < resp.gmlist.length; i++) {
						 	email<%=cnt%> = resp.gmlist[i].member_email;
							console.log("길이:" + resp.gmlist.length);
							console.log("email:"+email<%=cnt%>);
							output+="<div id='searchmem' class='attend-member'>";
							output+="<div id='membermem' class='member-mem'>";
							output+="<img src='files/"+resp.gmlist[i].member_picture+"'>";
							output+="<div class='member-info-mem'>";
							output+="<div class='member-name'>";
							output+= "<a href='#profile<%=cnt%>' data-toggle='modal' onclick='profile<%=cnt%>(email<%=cnt%>)'";
							output+="<b>'" +resp.gmlist[i].member_name + resp.gmlist[i].member_email+"'</b></a>";
							output+="<div>가입 날짜:</div>";
							output+="<div id='attenddate' class='attend-date'>"+resp.gmlist.join_date+"</div>";
							output+="</div>";	
							output+="</div>";
							output+="</div>";
							output+="</div>";
						}
						$('#searchmem').html(output); 
					}
				}
				
			})
		})
	</script>

				<!-- memberreport modal -->
				<div class="modal fade" id="report<%=cnt%>" tabindex="-1"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">신고</h4>
							</div>
							<div class="modal-body">
								<div>
									<div id="wrapper">
										<div>
											<div style="font-size: 30px;">
												<b>왜 이 회원을 신고하시나요?</b>
											</div>
											<div>
												<input type="radio" id="r1" name="report_select"
													value=" 공고된 메세지"><label for="r1"> 공고된 메세지</label>
											</div>
											<div>
												<input type="radio" id="r2" name="report_select"
													value="부적절한 프로필 사진"><label for="r2">부적절한
													프로필 사진</label>
											</div>
											<div>
												<input type="radio" id="r3" name="report_select"
													value=" 지적 재산권 침해"><label for="r3"> 지적 재산권
													침해</label>
											</div>
											<div>
												<input type="radio" id="r4" name="report_select" value="인격화"><label
													for="r4">인격화</label>
											</div>
											<div>
												<input type="radio" id="r5" name="report_select"
													value="18세 이하"><label for="r5">18세 이하</label>
											</div>
											<div>
												<input type="radio" id="r6" name="report_select"
													value="환불 받고 싶습니다."><label for="r6">환불 받고
													싶습니다.</label>
											</div>
											<div>
												<input type="radio" id="r7" name="report_select"
													value="사람 행동"><label for="r7">사람 행동</label>
											</div>
											<div>
												<input type="radio" id="r8" name="report_select"
													value=" 가짜 프로필"><label for="r8"> 가짜 프로필</label>
											</div>
											<p align="center">
												<button type="button" class="btn btn-default"
													id="nextbtn<%=cnt%>">다음</button>
											</p>
											<input type="hidden" name="member_email"
												value="${memberList.member_email }">
										</div>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>



				<!-- memberreport modal -->
				<div class="modal fade" id="etcreport<%=cnt%>" tabindex="-1"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">신고</h4>
							</div>
							<div class="modal-body">
								<div>
									<form action="membereportcomplete.group" method="get"
										id="memcomplete">
										<div id="wrapper">
											<div>
												<div>
													<b>왜 ${memberList.member_email } 회원을 신고하시나요?</b>
												</div>
												<div>
													이유: <input type="text" id="reason<%=cnt%>" name="reason">
												</div>
												<div>
													<p>우리가 더 알아야 할것이 있나요?</p>
													<textarea rows="7" cols="50" style="resize: vertical;"
														name="etcreason" id="etcreason"></textarea>
												</div>
												<div>
													<button id="reportbtn" class="btn btn-default btn-">신고하기</button>
												</div>
											</div>
										</div>
										<input type="hidden" name="member_email"
											value="${memberList.member_email }"> <input
											type="hidden" name="reason" value="" id="hiddenreason">
									</form>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>

				<!-- profile modal -->
				<div class="modal fade" id="profile<%=cnt%>" tabindex="-1"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel<%=cnt%>">${memberList.member_email }
									프로필</h4>
							</div>
							<div class="modal-body">
								<div>
									<label>위치:</label><span id="location<%=cnt%>"></span><br>
									<label>언제부터:</label> <span id="from<%=cnt%>"></span><br> <label>가입된
										그룹들:</label><span id="groups<%=cnt%>"></span><br> <label>관심사:</label><span
										id="interests<%=cnt%>"></span><br>
									<button type="button" class="btn btn-danger"
										id="profilereport<%=cnt%>">신고하기</button>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>



				<script>
				var radioVal;
					$('#nextbtn<%=cnt%>').click(function() {
						radioVal = $('input[name="report_select"]:checked').val();
						$("#report<%=cnt%>").modal('hide');
						$("#etcreport<%=cnt%>").modal('show');
 						$('#reason<%=cnt%>').text(radioVal); 
						$('#reason<%=cnt%>').val(radioVal);
					});
					
					$("#profilereport<%=cnt%>").click(function(){
						$("#report<%=cnt%>").modal('show');
						$("#profile<%=cnt%>").modal('hide');
					});
					
					function profile<%=cnt%>(email<%=cnt%>){
						console.log("profile:" );
						var member_email = email<%=cnt%>;
						console.log("member_email:"+ member_email);
						var group_seq = $('#group_seq').val();
							$.ajax({
								url : "memberprofile.group",
								type : "get",
								data : {
									member_email,
									group_seq
								},
								success : function(resp) {
									console.log("성공");
									console.log(resp);
									console.log(resp.names);
									console.log(resp.mdto);
									$('#location<%=cnt%>').text(resp.mdto.member_location);
									$('#interests<%=cnt%>').text(resp.mdto.member_interests);
									$('#groups<%=cnt%>').text(resp.names);
									$('#from<%=cnt%>').text(resp.mdto.join_date)
									$('#myModalLabel<%=cnt%>').text(resp.mdto.member_email);
									
								}

							})
					}
	
				</script>



			</div>
		</c:forEach>
	</div>

</div>


<footer>
	<%@ include file="include/bottom.jsp"%>
</footer>

</body>
</html>