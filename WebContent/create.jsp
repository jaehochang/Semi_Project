<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/nav/createNav.jsp"%>

<div class="jumbotron animated bounceInDown"
	style="background-image: url(./image/열기구.jpg); background-size: 100%;width:1733.8px;">
	<div class="container">
	<div id="text" class=text-align>
		<h2 id="writing1" style="color: white;text-align:center;">새로운 MeetNow를 시작하세요</h2>
		<p id="writing2" style="color: white;text-align:center;">자신과 잘 맞는 사람들을 찾아 모임을 할 수
			있도록 도와드리겠습니다.</p>
			</div>
	</div>
</div>

<form method="post" id="create" action="create.group">
<div class="container" id="container1">
	<div class="row" id="row1">
		<div class="col-md-4.col-md-offset4">
			<img src="./image/지구.png" class="img-fluid" alt="반응형 이미지"
				style="width: 63px; height: 50px"><span style="">1/4단계</span>

			<h1>새로운 MeetNow 그룹의 주 지역은 어디신가요?</h1>
			<br>
           
			<div class="form-group">
			<label for="#hiddenLo" id="labelID" style="font-size:30px;font-weight:13;"></label><!-- 회원가입시 설정한 장소 -->
			<input id="hiddenLo" type="hidden" name="location">
			<input id="hiddenLat" type="hidden" name="lat">
			<input id="hiddenLng" type="hidden" name="lng">
			
			
			<a id="locationChangeBt" data-toggle="collapse" href="" style="color: blue;">(위치설정)</a><br>
			<script>
				$("#locationChangeBt").click(function(){
					alert("위치변경");
					open('groupmap.jsp','popup','scrollbars=no, resizable=no, width=800, height=600');
					
				})
			</script>
			<div id="locationChangeShow" class="collapse"></div>
			
			</div>
			<!-- <button id="firstBt" data-target="#container1"
				class="btn btn-button default"
				style="background-color: #b831d9; color: white; font-size: 15px; font-weight: bold">다음</button> -->

		</div>
		<!--col-->
	</div>
	<!--row-->
	<hr>
</div>

<!--container-->
<!------------------------------------------------------------->
<div class="container" id="container2">
	<div class="row" id="row2">
		<div class="col-md-4.col-md-offset4">
			<img src="./image/관련상자.png" class="img-fluid" alt="반응형 이미지"
				style="width: 63px; height: 50px"><span style="">2/4단계</span>

			<h1>당신의 MeetNow는 무엇과 관련되어 있나요?</h1>
			<br> <input id="tagText" type="text" style="width: 500px;"
				class="form-control"  placeholder="예:여행   (10개 까지 선택가능합니다.)" required>
			<br>
			<input id="tagStore" type="hidden" name="storedtags">
			<input id="hiddenTag" type="hidden" name="tags">
			
			<div class="btn-group" data-toggle="buttons" id="printTerm1"
				style="width: 800px; height: auto"></div>
				<div class="btn-group" data-toggle="buttons" id="printTerm2"
				style="width: 800px; height:auto">
				</div>

			<!--  -->
			<!-- <button id="secondBt" class="btn btn-button default"
				style="background-color: #b831d9; color: white; font-size: 15px; font-weight: bold">다음</button>
 -->
		</div>
		<!--col-->
	</div>
	<!--row-->
	<hr>
</div>
<!--container-->

<!------------------------------------------------------------->

<div class="container" id="container3">
	<div class="row" id="row3">
		<div class="col-md-4.col-md-offset4">
			<img src="./image/태그2.png" class="img-fluid" alt="반응형 이미지"
				style="width: 63px; height: 50px"><span style="">3/4단계</span>

			<h1>MeetNow 이벤트의 이름은 무엇으로 정하시겠어요?</h1>
			<br> <input type="text" id="eventText" name="eventName" style="width: 500px"
				class="form-control" name="x" placeholder="예: 서을 블록체인  MeetNow" maxlength=400 required>
			<span id="showText" class="warning"></span> <br>
			<h1>MeetNow에 누가 참여하고, 무엇을 할 것인지 알려 주세요.</h1>
			<br> <span id="showideaText" class="default">아이디어가
				필요하신가요?<a id="showBt" data-toggle="collapse" href="#showmoreInfo"
				style="color: #b831d9;"> 몇 가지 예를 확인해 보세요.</a>
			</span><br>


			<div class="col-md-7" style="background-image: gray;">
				<div id="showmoreInfo" class="collapse">
					<div class="well" style="background-color:white">"이 그룹에서는 함께 공부하며, 공부내용을 공유하고, 서로 실력을 쌓아 나갈 수 있는 자바 웹 & 앱 개발 공부 방입니다. 현재 저는 카카오팀에서 웹 개발 파트에서 일하고 있으며 , 코딩을 모르시는 분도 제가 처음부터 가르쳐 드릴수 있습니다 ^^ 함께 열심히 코딩 하실분 얼른 그룹 참여하세요! "
						<hr>
						"In this group, you can study together, share your studies, and build your skills. I am currently working in the web development part of Kakao team, and I can teach you from the beginning if you don't know the coding. If you're working hard together, join the group!"
						
						</div>
				</div>
			</div>
			<br>


<span id="textAreaWarning" class="warning"></span>
			<textarea id="contents" name="eventContents" class="form-control" rows="5" style="height: 400px; width: 600px;"  maxlength="3000" required>
			</textarea>
			 <br>

	<!-- 		<button id="thirdBt" class="btn btn-button default"
				style="background-color: #b831d9; color: white; font-size: 15px; font-weight: bold">다음</button> -->
		</div>
		<!--col-->
	</div>
	<!--row-->
	<hr>
</div>
<!--container-->


<div id="container4" class="container">
	<div class="row" id="row4">
		<div class="col-md-4.col-md-offset4">
			<img src="./image/커뮤니티.png" class="img-fluid" alt="반응형 이미지"
				style="width: 63px; height: 50px"><span style="">4/4단계</span>

			<h1>MeetNow를 하는 의미</h1>
			<br> <span>●회원이 가장 우선입니다</span> <br> <span>●개방적이고
				정직한 목적을 가지고 있습니다</span> <br> <span>●언제나 안전하고 정중합니다</span><br> <span>●실제로
				직접 대화를 나누세요</span> <br> <br>
			<input type="button" id="fourthBt" class="btn btn-button default" value="동의후  그룹생성"
				style="background-color: #b831d9; color: white; font-size: 15px; font-weight: bold">
			<input type="hidden" id="memberName" name="member_name" value="${requestScope.member_name}">
		</div>
		<!--col-->
	</div>
	<!--row-->
</div>
<!--container-->
</form>
<br>
<br>
<br>
<br>
<br>
<%@ include file="include/bottom.jsp"%>