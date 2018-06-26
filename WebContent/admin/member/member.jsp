<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/top.jsp"%>
<%
	int cnt = 1;
%>
<div id="member_wrapper">
	<div style="margin-top: 150px;">
		<div>
		<script>
			function changeSelect() {
				var target = document.getElementById("subject");
				var seltarget = target.options[target.selectedIndex].value;
				console.log(seltarget);
			}
		</script>
			<select name="subject" id="subject" onchange="changeSelect()">
				<option value="member_email" selected>이메일</option>
				<option value="member_name">이름</option>
			</select>
			<input type="search" id="search">
		</div>
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">아이디</th>
					<th scope="col">이름</th>
					<th scope="col">가입날짜</th>
					<th scope="col">블락횟수</th>
					<th scope="col">경고상태</th>
					<th scope="col">블락날짜</th>
					<th scope="col">블락만기날짜</th>
					<th scope="col">경고주기</th>
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
							<%cnt++;%>
								<td id="member_email<%=cnt%>">${mdto.member_email }</td>
								<td>${mdto.member_name }</td>
								<td>${mdto.member_joindate }</td>
								<td id="blocknum<%=cnt%>">${mdto.member_warningnumber }회</td>
								<c:if test="${mdto.member_betweendate > 0 || mdto.member_betweendate == 0}">
									<td id="statenormal<%=cnt%>">정상</td>
								</c:if>
								<c:if test="${mdto.member_betweendate < 0}">
									<td id="stateblock<%=cnt%>">블락</td>
								</c:if>
								<td id="warningdate<%=cnt%>">${mdto.member_warningdate }</td>
								<td id="expiredate<%=cnt%>">${mdto.member_expiredate }</td>
								<td>
									<c:if
										test="${mdto.member_warningnumber == 0 || mdto.member_warningnumber == 1}">
										<button type="button" id="block<%=cnt%>" class="btn btn-warning">블락</button>
									</c:if> 
									<c:if test="${mdto.member_warningnumber == 2}">
										<button type="button" id="delete<%=cnt%>" class="btn btn-danger">삭제</button>
									</c:if>
									<c:if test="${mdto.member_warningnumber == 3}">
										<button type="button" id="deleteproc<%=cnt%>" class="btn btn-danger"
										disabled>삭제중</button>
									</c:if>
								</td>
							</tr>  
							<script>
	
	$(document).ready(function() {
		/* $('#search').keyup(function(){
			var text=$('#search').val();
			$.ajax({
				url:"search.ao",
				type:"get",
				data:{
					value:text
				},
				success:function(resp){
				}
			})
		}) */
		$('#delete<%=cnt%>').click(function() {
			console.log("즐즐즐");
			var member_email = $("#member_email<%=cnt%>").text();
			console.log("delete: "+member_email);

			$.ajax({
				url : "warning.ao",
				type : "get",
				data : {
					value : member_email
				},
				success : function(resp) {
					console.log("delete resp.number: "+resp.number);
					console.log("delete resp.bdate: "+resp.bdate);
					$("#blocknum<%=cnt%>").text(resp.number+"회");
					$("#warningdate<%=cnt%>").text(resp.warning_date);  
					$("#expiredate<%=cnt%>").text(resp.expire_date);

					if(resp.number==3){
						$("#delete<%=cnt%>").text("삭제중");
						var id = $("#delete<%=cnt%>").attr("id","deleteproc<%=cnt%>");
						$("#deleteproc<%=cnt%>").attr('disabled','disabled');
					}
				},
				error : function(error) {
					console.log(error);
				}
			})
		})
		
		$('#block<%=cnt%>').click(function() {
			var member_email = $("#member_email<%=cnt%>").text();
			console.log(member_email);

			$.ajax({
				url : "warning.ao",
				type : "get",
				data : {
					value : member_email
				},
				success : function(resp) {
					console.log(resp.number);
					console.log(resp.bdate);
					$("#blocknum<%=cnt%>").text(resp.number+"회");
					$("#warningdate<%=cnt%>").text(resp.warning_date);  
					$("#expiredate<%=cnt%>").text(resp.expire_date);

					if(resp.bdate < 0){
						console.log("0보다 작다");
						$("#statenormal<%=cnt%>").text("블락");
					}  
					  
					if(resp.number==2){
						$("#block<%=cnt%>").addClass("btn btn-danger");
						$("#block<%=cnt%>").text("삭제");
						var id = $("#block<%=cnt%>").attr("id","delete<%=cnt%>");
					}
				},
				error : function(error) {
					console.log(error);
				}
			})
		})
	
	})
	</script>
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


</body>
</html>