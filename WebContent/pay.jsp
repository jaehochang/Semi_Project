<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/nav/payNav.jsp"%>


<div class="container">
	<div class="row">
	<br>
	<br>
		<h1>그룹 생성 요금제 선택</h1>
		<br>
		<h4>${requestScope.member_name} 님에게 가장 적합한 요금제를 추천해드립니다. </h4>
		<h4>근처에 있는 회원들에게 MEETNOW를 홍보해드리며 일주일 내내 지원해드립니다.</h4>
		<br>
		<div class="row">
			<div class="col-md-4 text-center">
				<img id="hot" src="./image/hot배지.png" style="width: 120px; height: 100px">
				<div class="box" id="payBox">
					<div class="box-content">
						<h1 class="tag-title">무제한</h1>
						<hr />
						<p>MeetNow로 여러가지 체험을 하세요!</p>
						<h3 class="text-center" style="color: blue">50% 할인</h3>
						<p>Starts at 1만3천원/월</p>
						<br /> <a data-toggle="collapse" href="#nextrow" id="Bt1"
							class="btn btn-block btn-default" style="background:#b831d9;color:white">무제한 선택</a>
					</div>
				</div>
			</div>


		</div>
		<!--첫번쨰 row  -->
		<br> <br>
		<!-- 두번째 결제 박스 -->
		<div class="row">
			<div class="col-md-4 text-center">
				<div id="nextrow" class="collapse">
					<div class="box" id="payBox2">
						<div class="box-content">
							<h1 class="tag-title">구독 기간 선택</h1>
							<hr />

							<div class="radio radio-primary">
							<br>
								<input type=radio name="radio" id="radio1" value="option1">
								<label for="radio1"> 6 months for $8 </label>
							</div>
<br>
							<div class="radio radio-primary">
								<input type=radio name="radio" id="radio2" value="option2">
								<label for="radio2"> 1 months for $13 </label>
							</div>
<div class="container" style="background-color:blue">

</div>

							<br>
							<hr />
							<p>MeetNow의 구독은 자동적으로 리뉴얼됩니다.</p>
							<p>구독 취소를 원하시면 Support@meetnow.com or 1588-1200으로 연락주시길 바랍니다</p>
							<br /> 
							<input type="hidden" value="${requestScope.member_name}" id="name">
							<input type="hidden" value="${requestScope.member_email}" id="email">
							
							<button id="Bt2"
								class="btn btn-block btn-default" style="background:#b831d9;color:white">계속</button>
						</div>


					</div>


				</div>
			</div>
		</div>
	</div>
</div>




<footer><%@ include file="include/bottom.jsp"%></footer>