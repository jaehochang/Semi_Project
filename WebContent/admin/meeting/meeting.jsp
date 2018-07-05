<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/top.jsp"%>

<div id="meepup_wrapper">
	<div style="margin: 150px auto; width: 1000px;">
		<div>
			<select name="subject" id="subject">
				<option value="meeting_title">Meeting제목</option>
				<option value="meeting_location">Meeting 위치</option>
			</select> <input type="search" id="search">
		</div>
		<table class="table table-condensed">
			<thead class="thead-dark">
				<tr style="font-size: 20px;">
					<th scope="col">미팅제목</th>
					<th scope="col">그룹이름</th>
					<th scope="col">그룹리더</th>
					<th scope="col">미팅 위치</th>
				</tr>
			</thead>

			<tbody>
				<c:choose>
					<c:when test="${empty list}">
						<tr>
							<td>표시할 내용이 없습니다.
						</tr>
					</c:when>
					<c:when test="${not empty list }">
						<c:forEach var="mdto" items="${list }">
							<tr>
								<td><a href="meetingpage.ao?meeting_seq=${mdto.meeting_seq }">${mdto.meeting_title }</a></td>
								<td><a href="grouppage.ao?group_seq=${mdto.group_seq }">${mdto.group_name }</a></td>
								<td><a href="memberpage.ao?member_email=${mdto.group_leader}">${mdto.group_leader }</a></td>
								<td>${mdto.meeting_location }</td>
							</tr>
						</c:forEach>
					</c:when>
				</c:choose>
			</tbody>
		</table>
		<nav style="margin: 0 auto;" align="center">
			<ul class="pagination">${page }</ul>
		</nav>
	</div>
</div>

<script>
var subject = $("#subject option:selected").val();
console.log("subject: " + subject);

$("#subject").change(function() {
	subject = $(this).val();
	console.log(subject);
});

var distinction = "meeting";  
$('#search').keydown(function() {
			var text = $('#search').val();
			
			$.ajax({
				url : "search.ao",
				type : "get",
				data : {
					distinction,
					text,
					subject
				},
					success : function(resp) {
						console.log("resp:"+resp);
						console.log(resp.mlist);
						console.log(resp.page);
						var output;
						var page;

						if (resp.mlist.length == 0) {
							output += "<tr>";
							output += "</tr>";
							$("tbody").html("찾는 결과가 없습니다.");
						} else {
							for (var i = 0; i < resp.mlist.length; i++) {
								console.log("길이:" + resp.mlist.length);
								console.log("susccess : "
										+ resp.mlist[i].group_name);
								console
										.log("susccess : "
												+ resp.mlist[i].group_leader);
								console.log("susccess : "
										+ resp.mlist[i].meeting_title);
								console.log("susccess : "
										+ resp.mlist[i].meeting_location);
								
								output += "<tr>";
								output += "<td><a href='grouppage.ao?group_seq="+resp.mlist[i].group_seq+"'>'" + resp.mlist[i].group_name + "'</a></td>";
								output += "<td><a href='memberpage.ao?member_email="+resp.mlist[i].group_leader+"'>'" + resp.mlist[i].group_leader + "'</a></td>";
								output += "<td>'" + resp.mlist[i].meeting_title + "'</td>";
								output += "<td>'" + resp.mlist[i].meeting_location + "'</td>";
								output += "</tr>";  
							}
							$('tbody').html(output);
							page = resp.page;
							$('#pageul').html(page);
						}
					}

				})
			})
</script>

</body>
</html>