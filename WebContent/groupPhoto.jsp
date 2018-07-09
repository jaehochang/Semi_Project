<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/group/top.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<link rel="stylesheet" type="text/css"
	href="css/groupInfo-style.css?ver=3">
	
<link rel="stylesheet" type="text/css" href="css/groupPhoto-style.css?ver=2">

	<div id="navi-div">
		<ul class="nav nav-tabs">
		<c:forEach var="item" items="${result}">
			<li role="presentation"><a href="groupMain.group?group_seq=${item.group_seq}&page=info">정보</a></li>
			<li role="presentation" ><a href="groupMain.group?group_seq=${item.group_seq}&page=meetup">Meetup</a></li>
			<li role="presentation" ><a href="groupMain.group?group_seq=${item.group_seq}&page=member">회원</a></li>
			<li role="presentation" class="active">
			<a href="groupMain.group?group_seq=${item.group_seq}&page=photo">사진</a>
			</li>
		</c:forEach>	
		</ul>
		
	   <!-- 로그인 모달용 -->
   <div class="btn-group"
      style="position: absolute; transform: translate(400%, -140%);">
         <button type="button" class="btn btn-default dropdown-toggle" id="joinGroupBT-modal" data-toggle="modal" data-target="#myModal">이 그룹에 가입하기</button>
      <ul class="dropdown-menu" role="menu">
      </ul>
   </div>
   
   <div class="btn-group"
      style="position: absolute; transform: translate(400%, -140%);">
         <button type="button" class="btn btn-default dropdown-toggle" id="joinGroupBT">이 그룹에 가입하기</button>
      <ul class="dropdown-menu" role="menu">
      </ul>
   </div>
   
   <c:choose>
      <c:when test="${sessionScope.loginId eq null }">
         <script>
            $("#joinGroupBT").hide();
         </script>
      </c:when>
      <c:otherwise>
         <script>
            $("#joinGroupBT-modal").hide();
         </script>
      </c:otherwise>
   </c:choose>
   
   
   <c:forEach var="result" items="${result }">
      <div class="btn-group" 
         style="position: absolute; transform: translate(600%, -140%);">  
            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" 
            aria-expanded="false" id="memberBT" >회원입니다.</button>
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
            <c:forEach var="result" items="${result}">
               <li><a href="groupreport.group?group_seq=${result.group_seq }">그룹 신고</a></li>
            </c:forEach>
         </ul>
      </div>

   </c:if>
</div>



<div id="contents">
	<div id="wrapper" style="height: auto;">
		<div style="margin: 0 auto;">
			<c:forEach var="result" items="${result}">
				<form id="photoForm"
					action="upload1.file?group_seq=${result.group_seq }&page=group"
					method="post" enctype="multipart/form-data">
					<input type="file" id="file2" name="file"
						onchange="photoForm.submit()" style="display: none;" />
					<img src="img/plus.jpg" style="width: 50px"  id="up" />사진 추가
				</form>
			</c:forEach>
			<div>
				<div class="wrapper">
					<div class="row" style="margin: 0 auto;">
						<c:forEach var="groupPagePic" items="${groupPagePic }"
							varStatus="status">
							<div class="col-md-4"
								style="padding-left: 0px; margin: 0 10px 50px 0; width: 300px; height: 200px">

								<div class="item">
									<div class="polaroid">

										<a class="example-image-link"
											href="files/${groupPagePic.system_name }"
											data-lightbox="example-set"> <img class="example-image"
											src="files/${groupPagePic.system_name }" id="pola-img" /></a>

									</div>
								</div>
							</div>
						</c:forEach>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
				$("#up").click(function(e){
					e.preventDefault();
					$('#file2').click();
				});
				
			</script>

<script src="photo/js/lightbox-plus-jquery.min.js"></script>


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



<footer>
	<%@ include file="include/bottom.jsp"%>
</footer>
</body>
</html>

