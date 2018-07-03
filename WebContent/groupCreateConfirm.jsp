<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/nav/createNav.jsp"%>


<div class="jumbotron"
		style="background-color: transparent !important; " >
<div id="bigContainer" class="container" style="">
	
		<!--            -->
		<div class="container" id="photoName">
			<img src="./image/노이어프로필사진.png" class="img-fluid" alt="반응형 이미지"
				style="width: 200px; height: 200px"><span style=""></span>

			<h3 id="h3">Manuel Neuer</h3>
			<h4 id="h4">MeetNow creator</h4>

		</div>

		<ul class="timeline" id="timeline">
			<li class="timeline-inverted">

				<div class="timeline-panel" style="width: 500px">
					<div class="timeline-heading">
						<h3 class="timeline-title" style="font-weight: bold; text-align:center">축하합니다!!!</h3>
					</div>
					<div class="timeline-body">
					<p style="text-align:center">${requestScope.groupName}이(가) 생성되었습니다!</p>
					<p>주소는 <a href="#">http://localhost://</a></p>
						<p style="font-size:20px;">이제 어떤 단계가 남았을까요?</p>
						<br>
						<p style="font-size:16px;">●맞춤화: 지금 Meetup을 맞춤화할 수 있습니다.</p>
						<p style="font-size:16px;">●검토: 커뮤니티 팀에서 귀하의 Meetup을 검토합니다.</p>
						<p style="font-size:16px;">●발표: 검토가 끝나면 관심을 보일 만한 회원에게 Meetup이 즉시 발표됩니다.</p>

					</div>
				</div>
			</li>
		</ul>
		<input type="button" id="nextBt" class="btn btn-button default" value="새로 시작하기"
				style="background-color: #b831d9; color: white; font-size: 15px; font-weight: bold"></input>
	</div>
	<!-- 점보트론 -->
	
</div>
<!-- container -->




<footer>
	<%@ include file="include/bottom.jsp"%>
</footer>

</body>
</html>