<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/top.jsp"%>

<div id="member_wrapper">
	<div style="margin: 150px auto; width: 1000px;">
		<div>
			<select name="subject" id="subject">
				<option value="member_email">이메일</option>
				<option value="member_name">이름</option>
			</select> <input type="search" id="search">
		</div>
		<table class="table table-condensed">
			<thead class="thead-dark">
				<tr style="font-size: 20px;">
					<th scope="col">이메일</th>
					<th scope="col">이름</th>
					<th scope="col">성별</th>
					<th scope="col">위치</th>
					<th scope="col">알림</th>
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
								<td id="member_email">
								<a href="memberpage.ao?member_email=${mdto.member_email }">${mdto.member_email }</a></td>
								<td>${mdto.member_name }</td>
								<td>${mdto.member_gender }</td>
								<td>${mdto.member_location }</td>
								<c:if test="${mdto.member_alarm > 0 }">
									<td class="badge" style="background-color: red;">${mdto.member_alarm }</td>
								</c:if>
								<c:if test="${mdto.member_alarm == 0 }">
								<td></td>
								</c:if>
							</tr>
						</c:forEach>
					</c:when>
				</c:choose>

				<tr>
					<td colspan=5 align=center>${page }</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<script>
	var subject = $("#subject option:selected").val();
	console.log("subject: " + subject);

	$("#subject").change(function() {
		subject = $(this).val();
		console.log(subject);
	});

	$('#search').keydown(
			function() {
				var text = $('#search').val();
				var value = {
					text : text,
					subject : subject
				}
				$.ajax({
					url : "search.ao",
					type : "get",
					data : value,
					success : function(resp) {
						var output;

						if (resp.length == 0) {
							output += "<tr>";
							output += "</tr>";
							$("tbody").html("찾는 결과가 없습니다.");
						} else {
							for (var i = 0; i < resp.length; i++) {
								console.log("길이:" + resp.length);
								console.log("susccess : "
										+ resp[i].member_email);
								console
										.log("susccess : "
												+ resp[i].member_name);
								console.log("susccess : "
										+ resp[i].member_joindate);
								console.log("susccess : "
										+ resp[i].member_warningnumber);
								console.log("susccess : "
										+ resp[i].member_warningdate);
								console.log("susccess : "
										+ resp[i].member_expiredate);
								
								output += "<tr>";
								output += "<td><a href='memberpage.ao?member_email="+resp[i].member_email+"'>'" + resp[i].member_email + "'</a></td>";
								output += "<td>'" + resp[i].member_name + "'</td>";
								output += "<td>'" + resp[i].member_gender + "'</td>";
								output += "<td>'" + resp[i].member_location + "'</td>";
								if(resp[i].member_alarm>0){
									output += "<td class='badge'>'" + resp[i].member_alarm + "'</td>";
								}
								output += "</tr>";
								/* output += "<tr>";
								output += "<td>'" + resp[i].page + "'</td>";
								output += "<tr>"; */
							}
							$('tbody').html(output);
						}
					}

				})
			})
</script>

</body>
</html>