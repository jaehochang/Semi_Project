<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/top.jsp"%>

<div id="member_wrapper">
	<div style="margin: 150px auto; width: 1000px;">
		<div>
			<select name="subject" id="subject" class="subject">
				<option value="member_email">이메일</option>
				<option value="member_name">이름</option>
			</select> <input type="search" id="search" class="search">
		</div>
		<table class="table table-condensed">
			<thead class="thead-dark">
				<tr style="font-size: 20px;">
					<th scope="col">이메일</th>
					<th scope="col">이름</th>
					<th scope="col">성별</th>
					<th scope="col">위치</th>
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
								<td id="member_email"><a
									href="memberpage.ao?member_email=${mdto.member_email }">${mdto.member_email }</a></td>
								<td>${mdto.member_name }</td>
								<td>${mdto.member_gender }</td>
								<td>${mdto.member_location }</td>
								<c:if test="${mdto.member_alarm > 0 }">
									<td class="badge" style="background-color: red;">${mdto.member_alarm }</td>
								</c:if>
							</tr>
						</c:forEach>
					</c:when>
				</c:choose>
			</tbody>
		</table>
		<nav style="margin: 0 auto;" align="center">
			<ul id="pageul" class="pagination">${page }</ul>
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
	
	var distinction = "member";
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
										+ resp.mlist[i].member_email);
								console
										.log("susccess : "  
												+ resp.mlist[i].member_name);
								console.log("susccess : "
										+ resp.mlist[i].member_joindate);
								console.log("susccess : "
										+ resp.mlist[i].member_warningnumber);
								console.log("susccess : "
										+ resp.mlist[i].member_warningdate);
								console.log("susccess : "
										+ resp.mlist[i].member_expiredate);
								
								output += "<tr>";
								output += "<td><a href='memberpage.ao?member_email="+resp.mlist[i].member_email+"'>'" + resp.mlist[i].member_email + "'</a></td>";
								output += "<td>'" + resp.mlist[i].member_name + "'</td>";
								output += "<td>'" + resp.mlist[i].member_gender + "'</td>";
								output += "<td>'" + resp.mlist[i].member_location + "'</td>";
								if(resp.mlist[i].member_alarm>0){
									output += "<td class='badge'>'" + resp.mlist[i].member_alarm + "'</td>";
								}
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
<%@include file="../include/footer.jsp"%>

</body>
</html>