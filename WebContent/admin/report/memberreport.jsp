<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/top.jsp"%>

<style>
</style>
<div style="margin: 150px auto; width: 1000px;">
	<ul class="nav nav-tabs">
		<li role="presentation" class="active"><a href="memberreport.ao">회원신고</a></li>
		<li role="presentation"><a href="groupreport.ao">그룹신고</a></li>
	</ul>
	<table class="table table-condensed"
		style="margin: 0 auto; margin-top: 50px; width: 800px;">
		<thead class="thead-dark">
			<tr style="font-size: 20px;">
				<td>신고받은사람</td>
				<td>신고한사람</td>
				<td>신고시간</td>
				<td>신고내용</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="rdto" items="${list }">
				<tr>
					<td><a href="memberpage.ao?member_email=${rdto.report_calleemember }">${rdto.report_calleemember }</a></td>
					<td><a href="memberpage.ao?member_email=${rdto.report_caller }">${rdto.report_caller }</a></td>
					<td>${rdto.report_date }</td>
					<td>${rdto.report_reason }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<%@include file="../include/footer.jsp"%>