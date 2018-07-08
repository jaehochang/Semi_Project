<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Meeting</title>
<link href="./resources/docs/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="./resources/docs/examples/jumbotron/jumbotron.css" rel="stylesheet">
<script src="./resources/docs/assets/js/ie-emulation-modes-warning.js"></script>

<link rel="stylesheet" type="text/css" href="css/meeting-style.css?ver=1">
<link rel="stylesheet" type="text/css" href="css/meeting-nav-style.css?ver=2">
<link rel="stylesheet" type="text/css" href="css/mypagenav-style.css?ver=1">
<link rel="stylesheet" type="text/css" href="css/bottom-style.css?ver=3">

<script src="https://code.jquery.com/jquery-3.3.1.js"></script>

<!-- 참석 모달 -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>



<script>
   $(window).scroll(function() {
      if ($(window).scrollTop() >= 300) {
         $('nav').addClass('fixed-header');
         $('nav div').addClass('visible-title');
         $('fixed-var').addClass('moved');

      } else {
         $('nav').removeClass('fixed-header');
         $('nav div').removeClass('visible-title');
      }
   });
   
</script>

<!-- 다음지도 api -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72bc28de313df7398364bb8371a65642"></script>
<style>
#daumMap {
            width: 100%;
            height: 130px;
            margin: auto;
            margin-right: 50PX;
            border-bottom-left-radius: 20px;
  			border-bottom-right-radius: 20px;
        }
</style>
<STYLE>


/* 나눔고딕 */
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css); 

body {
   font-family: 'Nanum Gothic', serif; 
}

</STYLE>

</head>
<body>


   <header>
      <%@ include file="include/nav/mypageNav.jsp"%>
   </header>
   <div class="jumbotron" style="background-color:#f7f2fc;">
      <time class="icon"> <strong><fmt:formatDate
            value="${result.meeting_start_time}" pattern="M" />월</strong> <span><fmt:formatDate
            value="${result.meeting_start_time}" pattern="dd" /></span> </time>
      <div class="meeting-info">
         <div class="" style="color: #8b96a8;">
         <fmt:parseDate value="${getMeetingStartTime}" var="stime" pattern="yyyy-MM-dd HH:mm:ss"/>
            <fmt:formatDate value="${result.meeting_start_time}" pattern="M" />
            월
            <fmt:formatDate value="${result.meeting_start_time}" pattern="dd"/>
            일
            <fmt:formatDate value="${result.meeting_start_time}" pattern="E"/>
            요일
            <fmt:formatDate value="${stime}" pattern="a" />
            <fmt:formatDate value="${stime}" pattern="h"/>시
            
            <fmt:formatDate value="${stime}" pattern="m"/>
            분
         </div>
         <h2>
            <b>${result.meeting_title}</b>
         </h2>
         <h5>
            주최자 : <a href="">${result.group_leader }</a>
         </h5>
         <h5>
            <a href="groupMain.group?group_seq=${result.group_seq}&page=info">${result.group_name}</a>에서 주최
         </h5>
         
      </div>
      <div class="ask-attend">
            <c:choose>
            	<c:when test="${checkMeetingDate==false}">
            		<p>지난 모임입니다. </p>
            	</c:when>
               <c:when test="${result_areYouAttend}">
                  <p>참석 예정입니다. </p>
                  <button type="button" class="btn btn-primary btn-lg" style="width: 150px; background-color: pink; color: white; border:0;"></a><span class="glyphicon glyphicon-ok"></span>
                  </button>
                  <a href="attendCancel.meet?meeting_seq=${result.meeting_seq}"><button type="button" class="btn btn-primary btn-lg" style="width: 150px; background-color: pink; color: white; border:0;"><span class="glyphicon glyphicon-remove"></span>
                 </button></a>
               </c:when>
               <c:otherwise>
                  <p>참석하시겠습니까?</p>
                  <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" style="width: 150px; background-color: pink; color: white; border:0;"></a><span class="glyphicon glyphicon-ok"></span>
                  </button>
                 <button type="button" class="btn btn-primary btn-lg" style="width: 150px; background-color: pink; color: white; border:0;"><span class="glyphicon glyphicon-remove"></span>
                  </button>
               </c:otherwise>
               
            </c:choose>
         <br>
         
         
         <c:choose>
         <c:when test="${sessionScope.loginId != null}">
         	<%@ include file="include/modal/attend_login.jsp"%>
            
         </c:when>
         <c:when test="${sessionScope.loginId == null}">
            <%@ include file="include/modal/signup.jsp"%>
			
         </c:when>
         </c:choose>
      </div>
   </div>
   <nav>
   <div class="navi-info">
      <div class="navi-meeting-time" style="color: #8b96a8;">
      <fmt:parseDate value="${getMeetingStartTime}" var="stime" pattern="yyyy-MM-dd HH:mm:ss"/>
         <fmt:formatDate value="${result.meeting_start_time}" pattern="M" />
         월
         <fmt:formatDate value="${result.meeting_start_time}" pattern="dd" />
         일
         <fmt:formatDate value="${result.meeting_start_time}" pattern="E" />
         요일
         <fmt:formatDate value="${stime}" pattern="a" />
            <fmt:formatDate value="${stime}" pattern="h"/>시
            
            <fmt:formatDate value="${stime}" pattern="m"/>
            분
      </div>
      <div>
         <h2>
            <b>${result.meeting_title}</b>
         </h2>
      </div>
   </div>
   <div class="navi-buttons">
            <c:choose>
            	<c:when test="${checkMeetingDate==false}">
            		<p>지난 모임입니다. </p>
            	</c:when>
               <c:when test="${result_areYouAttend}">
                  <p>참석 예정입니다. </p>
                  <button type="button" class="btn btn-primary btn-lg" style="width: 100px; height:35px; background-color: pink; color: white; border:0;"></a><span class="glyphicon glyphicon-ok"></span>
                  </button>
                  <a href="attendCancel.meet?meeting_seq=${result.meeting_seq}"><button type="button" class="btn btn-primary btn-lg" style="width: 100px; height:35px; background-color: pink; color: white; border:0;"><span class="glyphicon glyphicon-remove"></span>
                 </button></a>
               </c:when>
               <c:otherwise>
                  <p>참석하시겠습니까?</p>
                  <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" style="width: 100px; height:35px; background-color: pink; color: white; border:0;"></a><span class="glyphicon glyphicon-ok"></span>
                  </button>
                 <button type="button" class="btn btn-primary btn-lg" style="width: 100px; height:35px; background-color: pink; color: white; border:0;"><span class="glyphicon glyphicon-remove"></span>
                  </button>
               </c:otherwise>
            </c:choose>
   </div>
   </nav> 
  
    
   <div class="fixed-bar" style="color: #8b96a8;">
      <div class="fixed-bar-contents">
         <span class="glyphicon glyphicon-time"></span><Br>
         <fmt:parseDate value="${getMeetingStartTime}" var="stime" pattern="yyyy-MM-dd HH:mm:ss"/>
         <fmt:formatDate value="${result.meeting_start_time}" pattern="M" />월
         <fmt:formatDate value="${result.meeting_start_time}" pattern="dd" /> 일
         <fmt:formatDate value="${result.meeting_start_time}" pattern="E" /> 요일
         <fmt:formatDate value="${stime}" pattern="a" />
         <fmt:formatDate value="${stime}" pattern="h"/>시
         <fmt:formatDate value="${stime}" pattern="m"/>분 
         <br> ~
            
            <fmt:parseDate value="${getMeetingEndTime}" var="etime" pattern="yyyy-MM-dd HH:mm:ss"/>
         <fmt:formatDate value="${result.meeting_end_time}" pattern="M" />
         월
         <fmt:formatDate value="${result.meeting_end_time}" pattern="dd" />
         일
         <fmt:formatDate value="${result.meeting_end_time}" pattern="E" />
         요일
         <fmt:formatDate value="${etime}" pattern="a" />
            <fmt:formatDate value="${etime}" pattern="h"/>시
            <fmt:formatDate value="${etime}" pattern="m"/>분 
            <Br> <br> <span class="glyphicon glyphicon-map-marker"></span><Br>
         <p>${result.meeting_location }</p>
      </div>
      <div class="daumMap-wrapper">
      
<!--          <img src="files/default.jpg"> -->
      </div>
      <div id="daumMap">
      </div>
   </div>
   
   <div class="meeting-contents-wrapper">
      <div class="meeting-picture">
         <img src="files/default.jpg">
      </div>
      <div class="meeting-contents">
         <p>세부사항</p>
         <p>${result.meeting_contents}</p>
      </div>


      <div class="meeting-member-wrapper">
         <div class="meeting-member-title">
            <p class="pull-left">참석자</p>
            (${result_countAttendMembers}) <a href="attendMember.meet?meeting_seq=${result.meeting_seq}" class="pull-right">모두보기</a><br>
         </div>
         <br>
         <div class="row">
               <div class="col-md-3">
                  <img src="files/${result.meeting_picture}">
                  <div class="member-info">
                     <p>
                        <b>${result.group_leader}</b>
                     </p>
                     <p>주최자</p>
                  </div>
               </div>
            <c:forEach var="items" items="${result_attend}">
               <div class="col-md-3">
                  <img src="files/${items.member_picture}">
                  <div class="member-info">
                     <p>
                        <b>${items.member_name}</b>
                     </p>
                     <p>회원</p>
                  </div>
               </div>
               <script>
	              
               </script>
            </c:forEach>
         </div>
      </div>
   </div>
  
	<script>
	var lat = ${result.meeting_lat};
	var lng = ${result.meeting_lng};
	var mapContainer = document.getElementById('daumMap'), // 지도를 표시할 div 
	mapOption = {
// 	    center: new daum.maps.LatLng(37.3595704, 127.105399), // 지도의 중심좌표
	    center: new daum.maps.LatLng(lat, lng), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};
	
	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new daum.maps.Map(mapContainer, mapOption);
	</script>

   
         <div>
            <footer> <%@ include file="include/bottom.jsp"%>
            </footer>
         </div>
</body>
</html>