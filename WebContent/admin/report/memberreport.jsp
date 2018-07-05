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
				<td>#</td>
				<td>신고받은사람</td>
				<td>신고한사람</td>
				<td>신고시간</td>
				<td>신고내용</td>
			</tr>
		</thead>
		<tbody>
			<%
				int cnt = 0;
			%>
			<c:forEach var="rdto" items="${list }">
				<%
					cnt = cnt + 1;
				%>
				<script>
			var report_seq = ${rdto.report_seq};
			var distinction = "member";
			var member_email = "${rdto.report_calleemember}";
			 $.ajax({
					url : "getnum.ao",
					type : "get",
					data : {
						distinction:distinction,
						report_seq: report_seq,
						member_email:member_email
					} ,  
					success : function(resp) {
						console.log("resp.warningnumber : "+resp.warningnumber);
						var warningnumber = resp.warningnumber;
						if(warningnumber ==  "0"){  
							$('#block<%=cnt%>').text("블락");
						}else if(warningnumber == "1"){
							$('#block<%=cnt%>').text("영구정지");
						}else if(warningnumber == "2"){
							$('#delete<%=cnt%>').text("삭제중");
						}   
					}
				});
			</script>


				<tr>
					<c:if test="${rdto.report_state == 0}">
						<td id="notread<%=cnt%>">읽지않음</td>
					</c:if>
					<c:if test="${rdto.report_state == 1}">
						<td id="read<%=cnt%>">읽음</td>
					</c:if>
					<td><a
						href="memberpage.ao?member_email=${rdto.report_calleemember }">${rdto.report_calleemember }</a></td>
					<td><a
						href="memberpage.ao?member_email=${rdto.report_caller }">${rdto.report_caller }</a></td>
					<td>${rdto.report_date }</td>
					<td><a href="#myModal<%=cnt%>" data-toggle="modal"
						id="mymodal<%=cnt%>">${rdto.report_reason }</a></td>
				</tr>

				<div class="modal fade" id="myModal<%=cnt%>" tabindex="-1"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">신고신고</h4>
							</div>
							<div class="modal-body">
								<div>
									<label>신고일시:</label><span id="date">${rdto.report_date}</span><br>
									<label>신고자:</label><span id="caller">${rdto.report_caller }</span><br>
									<label>신고당한사람:</label><span id="callee">${rdto.report_calleemember }</span><br>
									<label>신고내용:</label><span id="reason">${rdto.report_reason }</span><br>
									<label>블락:</label><span>
										<button class="btn btn-warning btn-sm" id="block<%=cnt%>"></button>
									</span>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>

				<script>

	$('#mymodal<%=cnt%>').click(function(){
		$("#notread<%=cnt%>").text("읽음"); 
		var distinction = "member";
		var report_seq = ${rdto.report_seq};
		var member_email = "${rdto.report_calleemember}";
		$.ajax({
			url : "modal.ao",
			type : "get",
			data : {
				distinction:distinction,
				report_seq:report_seq,
				member_email:member_email
			},
			success : function(resp) {
				console.log("성공");
			}
		})
	})
 
	 $("#block<%=cnt%>").click(function() {
		 	console.log("클릭해서 들어오긴하냐");
			var distinction = "member";
			var member_email = "${rdto.report_calleemember}";
			console.log("delete: " + member_email);

			$.ajax({
				url : "warning.ao",
				type : "get",
				data : {
					distinction,
					member_email
				},
				success : function(resp) {
				/* 	console.log("delete resp.warningnumber:" + resp.warningnumber);
					console.log("delete resp.betweendate:" + resp.betweendate);
					$("#blocknum").text(resp.warningnumber + "회");
					$("#warningdate").text(resp.warningdate);
					$("#expiredate").text(resp.expiredate); */
				console.log("성공");
					if (resp.warningnumber == 1) {
						$("#block<%=cnt%>").text("영구정지");
						/* $("#block").attr("id", "permanentblock"); */
					}
					
					if (resp.warningnumber == 2) {
						$("#block<%=cnt%>").addClass("btn-danger");
						$("#block<%=cnt%>").removeClass("btn-warning")
						$("#block<%=cnt%>").text("삭제중");
						$("#block<%=cnt%>").addClass("disabled");
						$("#block<%=cnt%>").attr("id", "delete");
					}
					
					if (resp.betweendate < 0) {
						console.log("0보다 작다");
						$("#blockstate<%=cnt%>").text("블락");
					}
					if (resp.betweendate >= 0) {
						console.log("0보다 크다");
						$("#blockstate<%=cnt%>").text("정상");
					}
				},
				error : function(error) {
					console.log(error);
				}
			})
		})
	 
 
</script>
			</c:forEach>
		</tbody>
	</table>
</div>

