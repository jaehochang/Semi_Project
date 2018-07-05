<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/nav/createNav.jsp"%>

<div class="jumbotron"
	style="background-image: url(./image/열기구.jpg); background-size: 100%;">
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
			<label for="#hiddenLo" id="labelID" style="font-size:30px;font-weight:13;">&nbsp;<input id="hiddenLo" type="hidden" name="location"></label><!-- 회원가입시 설정한 장소 -->
			
			
			
			<a id="locationChangeBt" data-toggle="collapse" href="" style="color: blue;">(위치설정)</a><br>
			<script>
				$("#locationChangeBt").click(function(){
					alert("위치변경");
					open('groupmap.jsp','popup','scrollbars=no, resizable=no, width=800, height=600');
					
				})
			</script>
			<div id="locationChangeShow" class="collapse">asdadasd</div>
			
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
				class="form-control"  placeholder="예:영화   (10개 까지 선택가능합니다.)" required>
			<br>
			<input id="tagStore" type="hidden" name="storedtags">
			<input id="hiddenTag" type="hidden" name="tags">
			
			<div class="btn-group" data-toggle="buttons" id="printTerm1"
				style="width: auto; height: 90px"></div>
				<div class="btn-group" data-toggle="buttons" id="printTerm2"
				style="width: auto; height:150px">
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
				class="form-control" name="x" placeholder="예: 서울 코딩 MeetNow" maxlength=400 required>
			<span id="showText" class="warning"></span> <br>
			<h1>MeetNow에 누가 참여하고, 무엇을 할 것인지 알려 주세요.</h1>
			<br> <span id="showideaText" class="default">아이디어가
				필요하신가요?<a id="showBt" data-toggle="collapse" href="#showmoreInfo"
				style="color: #b831d9;"> 몇 가지 예를 확인해 보세요.</a>
			</span><br>


			<div class="col-md-7" style="background-image: gray;">
				<div id="showmoreInfo" class="collapse">
					<div class="well">"이 그룹은 하이킹, 암벽등반, 캠핑, 카약, 볼더링, 등에 관심있은 사람들을
						위한 그룹입니다. 능력에 상관없이 모두 환영합니다. 야외스포츠에 열정적인 다른 사람들을 만나기 위해 이 그룹을 시작
						하였습니다. 다른분들과 같이 야외 스포츠를 즐길날을 기대합니다."
						<hr>
						“Calling all Chihuahua owners! I'd love for my Chihuahua Becky to meet other Chihuahuas and other small dogs! We'll meet once a week at the park to get together and let our dogs play. We can also meet at the Captain's Table down the street (they allow dogs on their patio!) for some food and drink afterward.”
						
						</div>
				</div>
			</div>
			<br>


<span id="textAreaWarning" class="warning"></span>
			<textarea id="contents" onKeyPress="javascript: if (event.keyCode==13) return false;" name="eventContents" class="form-control" rows="5" style="height: 400px; width: 600px;"  maxlength="4000" required>
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

		</div>
		<!--col-->
	</div>
	<!--row-->
</div>
<!--container-->
</form>
<footer><%@ include file="include/bottom.jsp"%></footer>