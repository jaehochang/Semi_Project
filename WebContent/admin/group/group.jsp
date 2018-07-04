<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/top.jsp"%>

<div id="member_wrapper">
	<div style="margin: 150px auto; width: 1000px;">
		<div>
			<!-- <select name="subject" id="subject">
				<option value="group_name">그룹며</option>
			</select>  -->
			<input type="search" id="search" style="width:300px;height:30px;">
		</div>
		<table class="table table-condensed">
			<thead class="thead-dark">
				<tr style="font-size: 20px;">
					<th scope="col">#</th>
					<th scope="col">그룹명</th>
					<th scope="col">그룹장</th>
					<th scope="col">그룹위치</th>
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
						<c:forEach var="gdto" items="${list }">
							<tr>
								<td id="group_name"></td>
								<td id="group_name">
								<a href="grouppage.ao?group_seq=${gto.group_name }">${gto.group_name }</a></td>
								<td>${gdto.group_leader }</td>
								<td>${gdto.group_location }</td>
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