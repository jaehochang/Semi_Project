<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/top.jsp"%>

<style>
</style>
<div style="margin: 150px auto; width: 1000px;">
	<ul class="nav nav-tabs">
		<li role="presentation"><a href="memberreport.ao">회원신고</a></li>
		<li role="presentation" class="active"><a href="groupreport.ao">그룹신고</a></li>
		<li role="presentation"><a href="deleteproc.ao">휴지통</a></li>
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
			<c:forEach var="rdto" items="${rlist }">
				<c:if test="${rdto.warningnumber ne 2 }">
					<%
						cnt = cnt + 1;
					%>
					<tr>
						<c:if test="${rdto.report_state == 0}">
							<td id="read<%=cnt%>">읽지않음</td>
						</c:if>
						<c:if test="${rdto.report_state == 1}">
							<td>읽음</td>
						</c:if>
						<td><a href="grouppage.ao?group_seq=${rdto.seq }">${rdto.report_calleegroup }</a></td>
						<td><a
							href="memberpage.ao?member_email=${rdto.report_caller }">${rdto.report_caller }</a></td>
						<td>${rdto.report_date }</td>

						<td><a href="#myModal" data-toggle="modal" id="myModal"
							onclick="show<%=cnt %>(${rdto.report_seq})">${rdto.report_reason }</a></td>
					</tr>


					<!-- modalmodal -->
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
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
										<label>신고일시:</label><span id="date">${rdto.report_date }</span><br>
										<label>신고자:</label><span id="caller">${rdto.report_caller}</span><br>
										<label>신고당한사람:</label><span id="callee">${rdto.report_calleegroup }</span><br>
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
	 var distinction = "group";
	 var group_name="${rdto.report_calleegroup }";
	 console.log("report_seq:"+report_seq);
	 
	 $.ajax({
			url : "modal.ao",
			type : "get",
			data : {
				report_seq:report_seq,
				distinction:distinction,
				group_name:group_name
					
			} ,  
			success : function(resp) {
				$("#date").text(resp.date);
				$("#caller").text(resp.caller);
				$("#callee").text(resp.callee);
				$("#reason").text(resp.reason);
				console.log(resp.date);
				console.log(resp.caller);
				
				$("#read<%=cnt%>").text("읽음");
				
				if(resp.warningnum == 0){  
					$('#block<%=cnt%>').text("블락");
				}else if(resp.warningnum == 1){
					$('#block<%=cnt%>').text("영구정지");
				}else if(resp.warningnum == 2){
					$('#delete<%=cnt%>').text("삭제중");
				}   
			}
		});
 	}
 
	 $("#block<%=cnt%>").click(function(e) {
		 console.log("num:"+ ${rdto.warningnumber});
		 	console.log("클릭해서 들어오긴하냐");
			var distinction = "group";
			var group_name = "${rdto.report_calleegroup}";
			console.log("delete: " + group_name);

			$.ajax({
				url : "warning.ao",
				type : "get",
				data : {
					distinction,
					group_name
				},
				success : function(resp) {
				/* 	console.log("delete resp.warningnumber:" + resp.warningnumber);
					console.log("delete resp.betweendate:" + resp.betweendate);
					$("#blocknum").text(resp.warningnumber + "회");
					$("#warningdate").text(resp.warningdate);
					$("#expiredate").text(resp.expiredate); */

					if (resp.warningnumber == 1) {
						$("#block<%=cnt%>").text("영구정지");
					}
					
					if (resp.warningnumber == 2) {
						$("#block<%=cnt%>").addClass("btn-danger");
						$("#block<%=cnt%>").removeClass("btn-warning")
						$("#block<%=cnt%>").text("삭제중");
						$("#block<%=cnt%>").addClass("disabled");
						$("#block<%=cnt%>").attr("id", "delete")
					}
					
				},
				error : function(error) {
					console.log(error);
				}
			})
			
			var group_leader = "${rdto.callee}";
			var group_warningdate="${rdto.warningdate}";
			var group_expiredate="${rdto.expiredate}";
			
			$.ajax({
				url:"email.ao",
				type:"get",
				data: {
					distinction:"group",
					group_leader,
					group_warningdate,
					group_expiredate
				},
				success:function(){
					console.log("성공");
				}
			})
		})
	 
 
</script>
				</c:if>
			</c:forEach>
		</tbody>
	</table>
</div>
