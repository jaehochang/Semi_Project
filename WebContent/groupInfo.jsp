<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/group/top.jsp"%>
<link rel="stylesheet" type="text/css" href="css/groupInfo-style.css?ver=1">
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
</div>

<div id="contents">


	<div id="wrapper">

		<div id="meetup-plan">

			<div id="meetup-plan-top">
				<span>다음 Meetup</span> <span id="meetup-plan-all"><a href="">모두보기</a></span>

			</div>

			<div id="meetup-plan-contents">

				<div
					style="width: 70%; hegith: 100%; float: left">
					<time class="icon">
						<strong><fmt:formatDate pattern="M" />6월</strong> <span><fmt:formatDate
								pattern="dd" />28</span>
					</time>
					<div class="meeting-info"
						style="padding-left: 150px; padding-top: 30px;">
						<div class="" style="color: #8b96a8;">
							<fmt:formatDate pattern="M" />
							6월
							<fmt:formatDate pattern="dd" />
							28일
							<fmt:formatDate pattern="E" />
							목요일
							<fmt:formatDate pattern="a" />
							<fmt:formatDate pattern="hh" />
							11시
							<fmt:formatDate pattern="mm" />
							11분
						</div>
						<h2>
							<b>ZILLA meetup In Seoul</b>
						</h2>
						<div id="meetup-leader">
							<div style="width: 20%; hegiht: 60px; float: left;">
								<img src="img/10.jpg"
									style="width: 50px; height: 50px; border-radius: 150px;">
							</div>
							<div style="width: 80%; hegiht: 60px; float: left;">
								<h5 style="padding-top: 20px;">
									주최자 : <a href="">Abasa Phillips</a>
								</h5>
							</div>
						</div>

						<h5>
							<a href="">ZILLA</a>에서 주최
						</h5>
					</div>
				</div>
				<div style="width: 30%; hegith: 100%; float: left">
					<div id="meetup-btn"><button type="button" class="btn btn-secondary" style="width:200px;">참석</button></div>
					<div id="meetup-location">
						<span class="glyphicon glyphicon-map-marker" aria-hidden="true" style="color:gray;"></span>
						당산역
					</div>
					
				</div>


			</div>
		</div>
		<c:forEach var="item2" items="${result }">
			<div id="group-contents">
				<div id="group-plan">
					<h4>활동 계획</h4>
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
				</div>
				<div id="group-pic">
					<div id="photo-top">
						<div id="group-member-count">
							<span>사진(6장)</span> <span id="all-member"><a href="">모두
									보기</a></span>
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
				<div id="last-meetup-top">
					<span>지난 Meetup</span> <span id="last-meetup-all"><a href="">모두보기</a></span>
				</div>
				<div id="last-meetup-div">
					<div id="lastmeetup">
						<time class="icon">
						<strong><fmt:formatDate pattern="M" />6월</strong> <span><fmt:formatDatepattern="dd" />28</span>
						</time>
						<div id="lastmeetup-title">
						<div class="" style="color: #8b96a8;">
							<fmt:formatDate pattern="M" />
							6월
							<fmt:formatDate pattern="dd" />
							28일
							<fmt:formatDate pattern="E" />
							목요일
							<fmt:formatDate pattern="a" />
							<fmt:formatDate pattern="hh" />
							11시
							<fmt:formatDate pattern="mm" />
							11분
						</div>
						<h4>
							<b>ZILLA meetup In Seoul</b>
						</h4>
						</div>
						<div id="lastmeetup-attend"></div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>

<footer>
	<%@ include file="include/bottom.jsp"%>
</footer>
</body>
</html>