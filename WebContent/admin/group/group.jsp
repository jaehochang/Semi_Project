<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/top.jsp"%>

<div id="member_wrapper">
	<div style="margin: 150px auto; width: 1000px;">
		<div>
			<select name="subject" id="subject" class="subject">
				<option value="group_name">그룹명</option>
				<option value="group_name">그룹위치</option>
			</select> <input type="search" id="search" class="search">
		</div>
		<table class="table table-condensed">
			<thead class="thead-dark">
				<tr style="font-size: 20px;">
					<th scope="col">그룹명</th>
					<th scope="col">그룹장</th>
					<th scope="col">그룹위치</th>
					<th scope="col">회원수</th>
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
								<td><a href="grouppage.ao?group_seq=${gdto.group_seq}">${gdto.group_name }</a></td>
								<td>${gdto.group_leader }</td>
								<td>${gdto.group_location }</td>
								<td>회원수</td>
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

	var distinction = "group";
	$('#search').keydown(function(){
			var text = $('#search').val();
				$.ajax({
					url : "search.ao",
					type : "get",
					data : {
						distinction,
						subject,
						text
					},
					success : function(resp) {
						var output;  
						var page;

						if (resp.length == 0) {
							output += "<tr>";
							output += "</tr>";
							$("tbody").html("찾는 결과가 없습니다.");
						} else {
							for (var i = 0; i < resp.glist.length; i++) {
								console.log("길이:" + resp.glist.length);
								output += "<tr>";
								output += "<td><a href='grouppage.ao?group_seq="+resp.glist[i].group_seq+"'>'" + resp.glist[i].group_name + "'</a></td>";
								output += "<td>'" + resp.glist[i].group_leader + "'</td>";
								output += "<td>'" + resp.glist[i].group_location + "'</td>";
								if(resp.glist[i].group_alarm>0){
									output += "<td class='badge'>'" + resp.glist[i].group_alarm + "'</td>";
								}
								output += "</tr>";
							}
							$('tbody').html(output);
							page=resp.page;
							$('#pageul').html(page);
						}
					}

				})
			})   
</script>

</body>
</html>