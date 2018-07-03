<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- 카카오톡 -->
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>


<script type='text/javascript'>
	document.getElementById("kakaoLoginBtn").onclick = function() {

		Kakao.init('9ac6c0be14b569c5fddc7ad7348d2ef7');

		Kakao.Auth
				.loginForm({

					success : function(authObj) {

						Kakao.API
								.request({
									url : '/v1/user/me',
									success : function(res) {
										console.log(res.kaccount_email);
										console.log(res.id);
										console.log(res.properties['nickname']);
										console
												.log(res.properties['age_range']);
										console.log(res.properties['birthday']);
										console
												.log(res.properties['age_range']);

										var kakaoId = res.id;
										var kakaoNickName = res.properties['nickname'];

										// 카톡 아이디 로그인 > AJAX > 회원가입 유무 파악 controller

										document
												.getElementById("hiddenKakaoId").value = kakaoId;

										var valCheck = document
												.getElementById("hiddenKakaoId").value;
										console.log("valCheck : " + valCheck);

										document.forms["sendkakaoIdToController"]
												.submit();

									},
									fail : function(error) {
										alert(JSON.stringify(error));
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
	//]]>
</script>

<form action="kakaoIdDplCheck.co" name=sendkakaoIdToController
	method=post>
	<input id=hiddenKakaoId type=hidden name=kakao_id> <input
		id=hiddenKakaoNickName type=hidden name=kakao_nickname> <input
		id="hiddenKakaoIdSend" type="hidden" type=submit>
</form>


