<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/top.jsp"%>
<style>
tr {
	font-size: 20px;
}
</style>
<div>
	<div class="admin_memberpage"
		style="width: 700px; margin: 0 auto; margin-top: 100px;">
		<table class="table table-condensed">
			<thead>
				<tr>
					<td style="font-size: 30px;"><strong>회원정보</strong></td>
				</tr>
			</thead>
			<tbody>
				<tr style="font-size: 18px;">
					<td style="width: 50%;">이메일:</td>
					<td id="member_email">${mdto.member_email }</td>
				</tr>
				<tr>
					<td>비밀번호:</td>
					<td>${mdto.member_pwd }</td>
				</tr>
				<tr>
					<td>이름:</td>
					<td id="member_name">${mdto.member_name }</td>
				</tr>
				<tr>
					<td>성별:</td>
					<td>${mdto.member_gender }</td>
				</tr>
				<tr>
					<td>위치:</td>
					<td>${mdto.member_location }</td>
				</tr>
				<tr>
					<td>가입일:</td>
					<td>${mdto.member_joindate }</td>
				</tr>
				<tr>
					<td>경고횟수:</td>
					<td id="blocknum">${mdto.member_warningnumber }</td>
				</tr>
				<tr>
					<td>블락상태:</td>
					<c:if test="${mdto.member_betweendate < 0 }">
						<td id="blockstate">블락</td>
					</c:if>
					<c:if test="${mdto.member_betweendate >=0 }">
						<td id="blockstate">정상</td>
					</c:if>
				</tr>
				<tr>
					<td>블락날짜:</td>
					<td id="warningdate">${mdto.member_warningdate }</td>
				</tr>
				<tr>
					<td>블락만료일:</td>
					<td id="expiredate">${mdto.member_expiredate }</td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="admin_member_gi" style="margin: 50px auto; width: 700px;">
		<table class="table table-condensed">
			<thead>
				<tr>
					<td style="font-size: 30px;">그룹 & 관심사</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="width: 50%;">관심사</td>
					<td>${mdto.member_interests }</td>
				</tr>
				<tr>
					<td>가입된 그룹</td>
					<td>${gmdto.group_name }</td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="admin_member_report">
		<table class="table table-condensed"
			style="margin: 50px auto; width: 700px;">
			<thead>
				<tr>
					<td style="font-size: 30px;">신고기록</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>신고일시</td>
					<td>신고자</td>
					<td>신고내용</td>
				</tr>
				<tr>
					<td>${rdto.report_date }</td>
					<td>${rdto.report_caller}</td>
					<td>${rdto.report_reason }</td>
					<td>${rdto.report_etcreason }</td>
					<c:if test="${rdto.report_reason eq null }">
						<td>${rdto.report_etcreason }</td>
					</c:if>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<script>
	/* $(document).ready(function() {
		$("#member_email").click(function() {
			$.ajax({
				url:"email.ao",
				type:"get",
				data:{
					${mdto.member_email}
				},
				success:function(resp){
					alert(${mdto.member_email}+" 님께 email을 성공적으로 보냈습니다.");
				}
			})
		})

		$("#block").click(function(e) {
			var distinction = "member";
			var member_email = $("#member_email").text();
			console.log("delete: " + member_email);

			$.ajax({
				url : "warning.ao",
				type : "get",
				data : {
					distinction,
					member_email
				},
				success : function(resp) {
					console.log("delete resp.warningnumber:" + resp.warningnumber);
					console.log("delete resp.betweendate:" + resp.betweendate);
					$("#blocknum").text(resp.warningnumber + "회");
					$("#warningdate").text(resp.warningdate);
					$("#expiredate").text(resp.expiredate);

					if (resp.warningnumber == 1) {
						$("#block").text("영구정지");
						/* $("#block").attr("id", "permanentblock"); */
					}
					
					if (resp.warningnumber == 2) {
						$("#block").addClass("btn-danger");
						$("#block").removeClass("btn-warning")
						$("#block").text("삭제중");
						$("#block").addClass("disabled");
						$("#block").attr("id", "delete");
					}
					
					if (resp.betweendate < 0) {
						console.log("0보다 작다");
						$("#blockstate").text("블락");
					}
					if (resp.betweendate >= 0) {
						console.log("0보다 작다");
						$("#blockstate").text("정상");
					}
				},
				error : function(error) {
					console.log(error);
				}
			})
		}) */
	})
</script>
</body>
</html>