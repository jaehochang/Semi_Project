<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- 카카오톡 -->
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>


<script type='text/javascript'>
	window.onload = function() {
		document.getElementById("kakao-signUp-btn").onclick = function() {

			Kakao.init('9ac6c0be14b569c5fddc7ad7348d2ef7');

			Kakao.Auth
					.loginForm({
						success : function(authObj) {
							Kakao.API
									.request({
										url : '/v1/user/me',
										success : function(res) {
											console.log(1);
											console.log(res.kaccount_email);
											console.log(res.id);
											console
													.log(res.properties['nickname']);
											var kakaoId = res.id;
											var kakaoNickName = res.properties['nickname'];

											document
													.getElementById("hiddenKakaoId").value = kakaoId;

											document.getElementById("hiddenKakaoNickName").value = kakaoNickName;
											
											
											var valCheck = document
													.getElementById("hiddenKakaoId").value;
											console.log("valCheck : "
													+ valCheck);

											document.forms["sendkakaoIdToController"]
													.submit();

										}
									});
						},
						fail : function(errorObj) {
							console.log(authObj)
						},
						persistAccessToken : true,
						persistRefreshToken : false
					});
		}
	}
	//]]>
</script>

<form action="kakaoIdDplCheck.co" name=sendkakaoIdToController
	method=post>
	<input id=hiddenKakaoId type=hidden name=kakao_id> <input
		id=hiddenKakaoNickName type=hidden name=kakao_nickname> <input
		id="hiddenKakaoIdSend" type="hidden" type=submit>
</form>

