<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/top.jsp"%>

<style>
</style>
<div style="margin: 150px auto; width: 1000px;">
	<ul class="nav nav-tabs">
		<li role="presentation"><a href="memberreport.ao">회원신고</a></li>
		<li role="presentation"><a href="groupreport.ao">그룹신고</a></li>
		<li role="presentation" class="active"><a href="deleteproc.ao">휴지통</a></li>
	</ul>
	<table class="table table-condensed"
		style="margin: 0 auto; margin-top: 50px; width: 800px;">
		<thead class="thead-dark">
			<tr style="font-size: 20px;">
				<td>신고받은사람</td>
				<td>신고한사람</td>
				<td>신고내용</td>
				<td>블락횟수</td>
			</tr>
		</thead>
		<tbody>
			<tr>
			</tr>
		</tbody>
	</table>
</div>
</body>
</html>