<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- 카카오톡 api cdn 필수-->
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>


<script type='text/javascript'>
			$("#kakao-signUp-btn")
			.click(
					function() {

						Kakao
								.init('9ac6c0be14b569c5fddc7ad7348d2ef7');

						Kakao.Auth
								.loginForm({

									success : function(
											authObj) {

										Kakao.API
												.request({
													url : '/v1/user/me',
													success : function(
															res) {

														var kakaoEmail = prompt(
																"카카오톡으로 진행시 이메일 입력이 필요합니다.",
																"");

														var regex = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

														if (regex
																.test(kakaoEmail)) {

											
															console
																	.log(res.properties)
															console
																	.log(res.kaccount_email);
															console
																	.log(res.id);
															console
																	.log(res.properties['nickname']);
															console
																	.log(res.properties['profile_image']);

															var kakaoId = res.id;
															var kakaoNickName = res.properties['nickname'];
															var kakaoPhoto = res.properties['profile_image'];

															console
																	.log("kakaoEmail : "
																			+ kakaoEmail);

															document
																	.getElementById("hiddenKakaoId").value = kakaoId;
															document
																	.getElementById("hiddenKakaoNickName").value = kakaoNickName;
															document
																	.getElementById("hiddenKakaoPhoto").value = kakaoPhoto;

															document
																	.getElementById("hiddenKakaoEmail").value = kakaoEmail;

															document.forms["sendkakaoIdToController"]
																	.submit();

															var valCheck = document
																	.getElementById("hiddenKakaoId").value;

														} else {
															alert("카카오톡을 통한 진행은 반드시 올바른 이메일 입력이 필요합니다.");
															location
																	.reload();
														}
													}
												});
									},
									fail : function(
											errorObj) {
										console
												.log(authObj)
									},
									persistAccessToken : true,
									persistRefreshToken : false
								});
					});
</script>



<form action="signUpWithKakao.co" name=sendkakaoIdToController
	method=post>
	<input id=hiddenKakaoId type=hidden name=kakao_id> <input
		id=hiddenKakaoEmail type=hidden name=kakao_email> <input
		id=hiddenKakaoNickName type=hidden name=kakao_nickname> <input
		id=hiddenKakaoPhoto type=hidden name=kakao_photo> <input
		id=hiddenKakaoIdSend type="hidden" type=submit>
</form>


