<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="include/top.jsp"%>

<div class="jumbotron" style="background-color: #d07de8">
	<div class="container">
		<h1 style="text-align: center; color: white;">MeetNow 찾기</h1>
		<p>MeetNow로 한 걸음 더 나아가기</p>
		<p>
			<a class="btn btn-primary btn-lg" href="#" role="button">가입하기&raquo;</a>
		</p>
	</div>
</div>
<div class="myMeetNow">
	<p>내 MeetNow</p>
	<div class="row">
	<c:forEach var="item" items="${myGroupList }">
		<div class="col-md-3"><img src="files/${item.system_name }"></div>
	</c:forEach>
	</div>
</div>

<div id="recoMeetnow">
<p>추천 MeetNow</p>
	<div class="row">
  		<div class="col-md-4" style="width:300px;"><img src="files/1.jpg" width="100%"></div>
  		<div class="col-md-4" style="width:300px;"><img src="img/1.jpg" width="100%"></div>
  		<div class="col-md-4" style="width:300px;"><img src="img/1.jpg" width="100%"></div>
	</div>
</div>
</body>
</html>