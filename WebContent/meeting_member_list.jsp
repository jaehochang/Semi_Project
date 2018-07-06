<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member List Page</title>
<link href="./resources/docs/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="./resources/docs/examples/jumbotron/jumbotron.css" rel="stylesheet">
<script src="./resources/docs/assets/js/ie-emulation-modes-warning.js"></script>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="css/mypagenav-style.css">
<link rel="stylesheet" type="text/css" href="css/meeting-member-list.css?ver=1">
<link rel="stylesheet" type="text/css" href="css/bottom-style.css?ver=1">


<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<STYLE>

/* 나눔고딕 */
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css); 

@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);

body {
   font-family: 'Nanum Gothic', serif; 
}
</STYLE>
<script>
   $(document).ready(function() {
      $("#search").keyup(function(){
         var meeting_seq = 6;
         
         $.ajax({
            url:"search_member.meet",
            type:"get",
            data:{meeting_seq:meeting_seq},
            success:function(resp) {
               
               console.log("ㅋㅋㅋㅋ");
               for(var i=0; i<resp.length; i++) {
                  var member_name = resp[i].member_name;
                  $("#response").text($("#response").text()+member_name);
               }
               console.log("전달성공");
               
            }
         })
      })
   })
</script>
</head>
<body>
    <header> <%@ include file="include/nav/mypageNav.jsp"%></header>
    
    <div class ="back-header"></div>
    
    <div class="wrapper">
       <div class="title"> 
          <a href=""><span class="glyphicon glyphicon-menu-left"></span></a>
          <div class="group-info">
             참석자 <br>
             <br>
             <a href="">${result_group_name}</a>
          </div>
       </div>
       <div class="search">
          <div class="box">
           <div class="container-3">
               <span class="icon"><i class="fa fa-search"></i></span>
               <input type="search" id="search" placeholder="회원 찾기" />
           </div>
         </div>
       </div>
       <div class="attend-member">
       <div class="count-attend-member">총 ${result_countAttendMembers} 명 참석</div>
          <c:forEach var="items" items="${result}">
             <div class="member">
                <img src="files/${items.member_picture}">
                <div class="member-info">
                   <div class="member-name"><B>${items.member_name}</B></div>
                   <c:choose>
                      <c:when test="${items.attend_people!=0}">
                         <div style="color:gray;"> &ensp; + 총 ${items.attend_people}명의 손님</div>
                      </c:when>
                      <c:when test="${items.attend_people==0}">
                         <Br>
                      </c:when>
                   </c:choose>
                   <div class="attend-date">${items.attend_time}</div>
                </div>
             </div>
          </c:forEach>
       </div>
       <P id="response"></P>
    </div>

</body>
</html>