<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/top.jsp"%>
<style>
.panel {
	width: 250px;
	display: inline-block;
}

#mainpagewrap {
	margin: 0 auto;
	margin-top: 80px;
	width: 800px;
	margin-top: 80px;
}
</style>

<div id="mainpagewrap">
	<div class="panel panel-primary">
		<div class="panel-body">현재 회원  ${memberAll } 명</div>
		<div class="panel-footer">오늘 새로 가입한 회원 ${memberToday } 명</div>
	</div>
	<div class="panel panel-success">
		<div class="panel-body">현재 그룹 ${groupAll }개</div>
		<div class="panel-footer">오늘 새로 생성된 그룹 ${groupToday }개</div>
	</div>
	<div class="panel panel-info">
		<div class="panel-body">현재 meetup ${meetingAll }개</div>
		<div class="panel-footer">오늘 새로 생성된 ${meetingToday }개</div>
	</div>
	<div class="panel panel-warning">
		<div class="panel-body">확인하지 않은 신고수 ${reportAll }개</div>
		<div class="panel-footer">오늘 새로들어온 신고수 ${reportToday }개</div>
	</div>
	<div class="panel panel-danger">
		<div class="panel-body">통계</div>
		<div class="panel-footer">&nbsp;</div>
	</div>
</div>
<!-- <div>현재 그룹수(오늘 새로 생성된 그룹수)</div> -->
<!-- <div>현재 밋업 수(오늘 등록된 밋업수)</div> -->
<!-- <div>확인하지 않은 신고수</div> -->
<!-- <div>방문자수(할수있으면), 회원 연령별, 카테고리별,신고내용별</div> -->
</body>
</html>