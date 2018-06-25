<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="include/top.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="jumbotron" style="background-color: #d07de8">
	<div class="container">
		<h1 style="text-align: center; color: white;">MeetNow 찾기</h1>
		<p>MeetNow로 한 걸음 더 나아가기</p>
		<p>
			<a class="btn btn-primary btn-lg" href="#" role="button">가입하기&raquo;</a>
		</p>
	</div>
</div>

<div id="search">
	<div class="col-xs-4">
		<input type="text" class="form-control" id="search-input"
			placeholder="전체 MeetUp 이벤트">
		<button type="button" class="btn btn-default" aria-label="Left Align"
			id="search-bt">
			<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
		</button>
	</div>
	<h5 id="location-text">내</h5>
	<div class="btn-group" id="location-km">
		<button type="button" class="btn btn-default dropdown-toggle"
			data-toggle="dropdown" aria-expanded="false" id="location-default">
			5km <span class="caret"></span>
		</button>
		<ul class="dropdown-menu" role="menu">
			<li><a href="#">5km</a></li>
			<li><a href="#">10km</a></li>
			<li><a href="#">15km</a></li>
			<li><a href="#">모든거리</a></li>
		</ul>
	</div>


	<div class="btn-group"
		style="position: absolute; bottom: 15px; left: 450px;">
		<button type="button" class="btn btn-default dropdown-toggle"
			data-toggle="dropdown" aria-expanded="false" id="location-default">
			서울,KR <span class="caret"></span>
		</button>
		<ul class="dropdown-menu" role="menu" id="dropdown-location">
			<li><input type=text></li>
		</ul>
	</div>

	<script>
		$('#dropdown-location').click(function(e) {
		    e.stopPropagation();
		});
		</script>

	<h5 id="location-text2">의</h5>

	<div class="btn-group" role="group" id="search-check"
		style="position: absolute; bottom: 15px; left: 750px;">
		<button type="button" class="btn btn-default">그룹들</button>
		<button type="button" class="btn btn-default">달력</button>
	</div>



</div>

<div class="myMeetNow">
	<p>내 MeetNow</p>




<div class="row" id="myMeet_row">
	<c:forEach var="item" items="${myGroupList }">
		
			<div class="col-md-3" style="padding:10px;">
				<div class="over-img">
					<img src="files/${item.system_name }">
				</div>
				<h3 class="group_title">${item.group_name }</h3>

				<c:forEach var="item2" items="${memberCount }">
					<c:if test="${item.group_seq eq item2.group_seq }">
						<h5 class="group_count">${item2.count}명의 회원</h5>
					</c:if>
				</c:forEach>

			</div>
		
	</c:forEach>
	</div>

</div>

<div id="recoMeetnow">
	<p>추천 MeetNow</p>
	<div class="row">
		<div class="col-md-4">
			<div class="img_div">
				<img src="files/1.jpg" class="img_size">
			</div>
		</div>
		<div class="col-md-4">
			<div class="img_div">
				<img src="files/1.jpg" class="img_size">
			</div>
		</div>
		<div class="col-md-4">
			<div class="img_div">
				<img src="files/1.jpg" class="img_size">
			</div>
		</div>
	</div>


	<div class="row">
		<div class="col-md-4">
			<div class="img_div">
				<img src="files/1.jpg" class="img_size">
			</div>
		</div>
		<div class="col-md-4">
			<div class="img_div">
				<img src="files/1.jpg" class="img_size">
			</div>
		</div>
		<div class="col-md-4">
			<div class="img_div">
				<img src="files/1.jpg" class="img_size">
			</div>
		</div>
	</div>


</div>
</body>
</html>