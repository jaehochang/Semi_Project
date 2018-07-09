<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/top.jsp"%>
<style>
tr {
	font-size: 20px;
}

.title {
	width: 50%;
	
}
</style>
<div>
	<div class="admin_memberpage"
		style="width: 700px; margin: 0 auto; margin-top: 100px;">
		<table class="table table-condensed">
			<thead>
				<tr>
					<td style="font-size: 30px;"><strong>Meetup 정보</strong></td>
				</tr>
			</thead>
			<tbody>
				<tr style="font-size: 18px;">
					<td class="title">그룹이름 :</td>
					<td>${mdto.group_name }</td>
				</tr>
				<tr>
					<td class="title">그룹장 :</td>
					<td>${mdto.group_leader }
				</tr>
				<tr>
					<td class="title">Meetup 제목 :</td>
					<td>${mdto.meeting_title }
				</tr>
				<tr>
					<td class="title">Meetup 내용 :</td>
					<td>${mdto.meeting_contents }
				</tr>
				<tr>
					<td class="title">Meetup 시작시간 :</td>
					<td>${mdto.meeting_start_time }
				<tr>
					<td class="title">Meetup 끝나는시간 :</td>
					<td>${mdto.meeting_end_time }
				<tr>
					<td class="title">Meetup 위치 :</td>
					<td>${mdto.meeting_location }
				</tr>
			</tbody>
		</table>
	</div>

</div>
</body>
</html>