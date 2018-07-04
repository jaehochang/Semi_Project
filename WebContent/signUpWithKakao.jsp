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
											
											console.log(res.properties)
											console.log(res.kaccount_email);
											console.log(res.id);
											console.log(res.properties['nickname']);
											alert(res.properties['profile_image']);
											
											
											var kakaoId = res.id;
											var kakaoNickName = res.properties['nickname'];
											var kakaoPhoto = res.properties['profile_image'];
											
											document
													.getElementById("hiddenKakaoId").value = kakaoId;
											document
													.getElementById("hiddenKakaoNickName").value = kakaoNickName;
											document
													.getElementById("hiddenKakaoPhoto").value = kakaoPhoto;

											var valCheck = document
													.getElementById("hiddenKakaoId").value;
											
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

<!-- <form action="signUpWithKakao.co" name=sendkakaoIdToController -->
<!-- 	method=post> -->


<form action="signUpPlusWithKakao.jsp" name=sendkakaoIdToController
	method=post>
	<input id=hiddenKakaoId type=hidden name=kakao_id> <input
		id=hiddenKakaoEmail type=hidden name=kakao_email> <input
		id=hiddenKakaoNickName type=hidden name=kakao_nickname> <input
		id=hiddenKakaoPhoto type=hidden name=kakao_photo> <input
		id=hiddenKakaoIdSend type="hidden" type=submit>
</form>

