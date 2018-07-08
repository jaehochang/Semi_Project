<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/top.jsp"%>

<style>
</style>
<div style="margin: 150px auto; width: 1000px;">
	<ul class="nav nav-tabs">
		<li role="presentation" class="active"><a href="memberreport.ao?subject=report_caller&text=">회원신고</a></li>
		<li role="presentation"><a href="groupreport.ao?subject=report_calleegroup&text=">그룹신고</a></li>
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
				<tr>
					<c:if test="${rdto.report_state == 0}">
						<td id="notread<%=cnt%>">읽지않음</td>
					</c:if>
					<c:if test="${rdto.report_state == 1}">
						<td id="read">읽음</td>
					</c:if>
					<td><a
						href="memberpage.ao?member_email=${rdto.report_calleemember }">${rdto.report_calleemember }</a></td>
					<td><a
						href="memberpage.ao?member_email=${rdto.report_caller }">${rdto.report_caller }</a></td>
					<td>${rdto.report_date }</td>
					<td><a href="#myModal<%=cnt %>" data-toggle="modal"
						id="myModal" onclick="show<%=cnt %>(${rdto.report_seq})">${rdto.report_reason }</a></td>
				</tr>

				<!-- mymodal -->
				<div class="modal fade" id="myModal<%=cnt%>" tabindex="-1"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">신고</h4>
							</div>
							<div class="modal-body">
								<div>
									<label>신고일시:</label><span id="date">${rdto.report_date}</span><br>
									<label>신고자:</label><span id="caller">${rdto.report_caller }</span><br>
									<label>신고당한사람:</label><span id="callee">${rdto.report_calleemember }</span><br>
									<c:if test="${rdto.report_reason ne null}">
										<label>신고내용:</label>
										<span id="reason">${rdto.report_reason }</span>
										<br>
									</c:if>
									<c:if test="${rdto.report_etcreason ne null}">
										<label>기타신고내용:</label>
										<span id="reason">${rdto.report_etcreason }</span>
										<br>
									</c:if>

									<label>블락:</label>
									<c:if test="${rdto.warningnumber == 0 }">
										<span>
											<button class="btn btn-warning btn-sm" id="block<%=cnt%>">블락</button>
										</span>
									</c:if>
									<c:if test="${rdto.warningnumber == 1 }">
										<span>
											<button class="btn btn-warning btn-sm" id="block<%=cnt%>">영구정지</button>
										</span>
									</c:if>
									<c:if test="${rdto.warningnumber == 2 }">
										<span>
											<button class="btn btn-danger btn-sm" disabled
												id="delete<%=cnt%>">삭제중</button>
										</span>
									</c:if>
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
				function show<%=cnt%>(str){
					var report_seq = str;
					var distinction = "member";
					var member_email = "${rdto.report_calleemember}";
					console.log("report_seq:"+report_seq);
					 $.ajax({
							url : "modal.ao",
							type : "get",
							data : {
								report_seq:report_seq,
								distinction:distinction,
								member_email:member_email
							} ,  
							success : function(resp) {
								$("#date").text(resp.date);
								$("#caller").text(resp.caller);
								$("#callee").text(resp.callee);
								$("#reason").text(resp.reason);
								console.log(resp.date);
								console.log(resp.caller);
								
								$("#notread<%=cnt%>").text("읽음");
								
								if(resp.warningnumber ==  0){  
									$('#block<%=cnt%>').text("블락");
								}else if(resp.warningnumber == 1){
									$('#block<%=cnt%>').text("영구정지");
								}else if(resp.warningnumber == 2){
									$('#delete<%=cnt%>').text("삭제중");
								}     
							}
						});
				}
					
 
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
					
				},
				error : function(error) {
					console.log(error);
				}
			})
			
			var member_email = "${rdto.callee}";
			var member_warningdate="${rdto.warningdate}";
			var member_expiredate="${rdto.expiredate}";
			
			$.ajax({
				url:"email.ao",
				type:"get",
				data: {
					distinction:"member",
					member_email,
					member_warningdate,
					member_expiredate
				},
				success:function(){
					console.log("성공");
				}
			})
		})
		
		
	 
 
</script>
			</c:forEach>

		</tbody>
	</table>
	<nav style="margin: 0 auto;" align="center">
		<ul id="pageul" class="pagination">${page }</ul>
	</nav>
</div>

