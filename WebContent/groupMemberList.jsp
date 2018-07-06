<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/group/top.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<link rel="stylesheet" type="text/css" href="css/groupMember-style.css?ver=2">
<link rel="stylesheet" type="text/css" href="css/main-calender-style.css">
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
				<li><a href="#">그룹 신고</a></li>
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
<!-- modalmodal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">이름</h4>
			</div>
			<div class="modal-body" style="width: 1000px; height: 500px;">

				<div style="border: 1px black solid; width: 500px;">
					<div>
						<label>위치:</label><span id="loc"></span>
					</div>
					<div>
						<label>부터 멤버:</label><span id="frommem"></span>
					</div>
					<div>
						<label>가입그룹:</label><span id="joingroup"></span>
					</div>
					<div>
						<label>관심사:</label><span id="interests"></span>
					</div>
					<button type="button" id="reportbtn" class="btn btn-default btn-xs">신고하기</button>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<div id="contents">
	
	<div class="wrapper-member" style="">
       <div class="title-member"> 
          <a href=""><span class="glyphicon glyphicon-menu-left" style="font-size: 20px; float : left;"></span></a>
          <div class="group-info-member">
             회원 목록 
          </div>
       </div>
       <div class="search-member">
          <div class="box-member">
           <div class="container-3">
               <span class="icon"><i class="fa fa-search"></i></span>
               <input type="search" id="search" placeholder="회원 찾기" />
           </div>
         </div>
       </div>
       <div class="attend-member">
       <div class="count-attend-member">총${count } 명</div>
          <c:forEach var="memberList" items="${memberList}">
             <div class="member-mem">
					<img src="files/${memberList.member_picture}">
					<div class="member-info-mem">
						<div class="member-name">
							<B>${memberList.member_name}</B>
						</div>
							<div>가입 날짜:</div>
						<div class="attend-date">${memberList.join_date}</div>
					</div>
				</div>
          </c:forEach>
       </div>
       <P id="response"></P>
    </div>
		
</div>

<script>
function modal(str){
	alert("in show");
	var member_email = str;
	 
	$.ajax({
			url : "modal.ao",
			type : "get",
			data :  member_email,  
			success : function(resp) {
				console.log("성공");
			}   
		});
	}
</script>

<footer>
	<%@ include file="include/bottom.jsp"%>
</footer>
</body>
</html>