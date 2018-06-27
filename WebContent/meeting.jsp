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
<link rel="stylesheet" type="text/css" href="css/meeting-style.css?ver=1">

</head>
<body>
   <header>
      <%@ include file="include/nav/mypageNav.jsp"%>
   </header>

     <hr class="my-4" style="border-bottom: 2px grey;">
       <fmt:parseDate value="${result.meeting_start_time}" var="time" pattern="yyyy-MM-dd HH:mm:ss"/>
      <div class="jumbotron">
        <time class="icon">
         <strong><fmt:formatDate value="${time}" pattern="M"/>월</strong> 
         <span><fmt:formatDate value="${time}" pattern="dd"/></span>
        </time>
         <div class="meeting-info" >
            <div class="" style="color:#8b96a8;" >
                              <fmt:formatDate value="${time}" pattern="M"/>월
                              <fmt:formatDate value="${time}" pattern="dd"/>일     
                              <fmt:formatDate value="${time}" pattern="E"/>요일 
                              <fmt:formatDate value="${time}" pattern="a"/>
                              <fmt:formatDate value="${time}" pattern="hh"/>시 
                              <fmt:formatDate value="${time}" pattern="mm"/>분 
            </div>
            <h2><b>${result.meeting_title}</b></h2>
            <h5>주최자 : <a href="">${result.group_leader }</a></h5>
            <h5><a href="">${result.group_name}</a>에서 주최</h5>
         </div>
         <div class="ask-attend">
            <p>참석하시겠습니까? </p>
            <br>
            <button type="button" class="btn btn-primary">Primary</button>
            <button type="button" class="btn btn-primary">X</button>
            <button type="button" class="btn btn-primary">√</button>

            
         </div>
      </div>
      <div class="meeting-contents">
         <p>세부사항</p>
         <p>${result.meeting_contents}</p>
      </div>



</body>
</html>