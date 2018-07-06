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

<link rel="stylesheet" type="text/css" href="css/mypagenav-style.css">
<link rel="stylesheet" type="text/css" href="css/meeting-style.css?ver=6">
<link rel="stylesheet" type="text/css" href="css/meeting-nav-style.css?ver=1">
<link rel="stylesheet" type="text/css" href="css/bottom-style.css?ver=1">

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
<STYLE>

/* 나눔고딕 */
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css); 

/* 제주고딕 */
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);

/* Noto Sans KR */
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);

body {
/*    font-family: 'Jeju Gothic', serif; */
   font-family: 'Nanum Gothic', serif; 
}
</STYLE>
</head>
<body>
   <header> <%@ include file="include/nav/mypageNav.jsp"%>
   <div class="jumbotron" style="background-color:#f7f2fc;">
      <time class="icon"> <strong><fmt:formatDate
            value="${result.meeting_start_time}" pattern="M" />월</strong> <span><fmt:formatDate
            value="${result.meeting_start_time}" pattern="dd" /></span> </time>
      <div class="meeting-info">
         <div class="" style="color: #8b96a8;">
            <fmt:formatDate value="${result.meeting_start_time}" pattern="M" />
            월
            <fmt:formatDate value="${result.meeting_start_time}" pattern="dd" />
            일
            <fmt:formatDate value="${result.meeting_start_time}" pattern="E" />
            요일
            <fmt:formatDate value="${result.meeting_start_time}" pattern="a" />
            <fmt:formatDate value="${result.meeting_start_time}" pattern="hh" />
            시
            <fmt:formatDate value="${result.meeting_start_time}" pattern="mm" />
            분
         </div>
         <h2>
            <b>${result.meeting_title}</b>
         </h2>
         <h5>
            주최자 : <a href="">${result.group_leader }</a>
         </h5>
         <h5>
            <a href="groupMain.group?group_seq=${result.group_seq}&page=info"">${result.group_name}</a>에서 주최
         </h5>
      </div>
      <div class="ask-attend">
            <c:choose>
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
            <%@ include file="include/modal/attend_logout.jsp"%>
         </c:when>
         </c:choose>
      </div>
   </div>
   <nav>
   <div class="navi-info">
      <div class="navi-meeting-time" style="color: #8b96a8;">
         <fmt:formatDate value="${result.meeting_start_time}" pattern="M" />
         월
         <fmt:formatDate value="${result.meeting_start_time}" pattern="dd" />
         일
         <fmt:formatDate value="${result.meeting_start_time}" pattern="E" />
         요일
         <fmt:formatDate value="${result.meeting_start_time}" pattern="a" />
         <fmt:formatDate value="${result.meeting_start_time}" pattern="hh" />
         시
         <fmt:formatDate value="${result.meeting_start_time}" pattern="mm" />
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
   </header>   
   <div class="fixed-bar" style="color: #8b96a8;">
      <div class="fixed-bar-contents">
         <span class="glyphicon glyphicon-time"></span><Br>
         <fmt:formatDate value="${result.meeting_start_time}" pattern="M" />
         월
         <fmt:formatDate value="${result.meeting_start_time}" pattern="dd" />
         일
         <fmt:formatDate value="${result.meeting_start_time}" pattern="E" />
         요일
         <fmt:formatDate value="${result.meeting_start_time}" pattern="a" />
         <fmt:formatDate value="${result.meeting_start_time}" pattern="hh" />
         시
         <fmt:formatDate value="${result.meeting_start_time}" pattern="mm" />
         분 </br> ~
         <fmt:formatDate value="${result.meeting_end_time}" pattern="M" />
         월
         <fmt:formatDate value="${result.meeting_end_time}" pattern="dd" />
         일
         <fmt:formatDate value="${result.meeting_end_time}" pattern="E" />
         요일
         <fmt:formatDate value="${result.meeting_end_time}" pattern="a" />
         <fmt:formatDate value="${result.meeting_end_time}" pattern="hh" />
         시
         <fmt:formatDate value="${result.meeting_end_time}" pattern="mm" />
         분 <Br> <br> <span class="glyphicon glyphicon-map-marker"></span><Br>
         <p>${result.meeting_location }</p>
      </div>
      <div class="fixed-bar-location-image">
         <img src="files/default.jpg">
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
            (${result_countAttendMembers}) <a href="attendMember.meet?meeting_seq=${result.meeting_seq}" class="pull-right">모두보기</a><br><br>
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
            </c:forEach>
         </div>
      </div>
   </div>

   
         <div>
            <footer> <%@ include file="include/bottom.jsp"%>
            </footer>
         </div>
</body>
</html>