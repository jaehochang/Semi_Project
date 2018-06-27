<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- 카카오톡 -->
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>


<script type='text/javascript'>

	Kakao.init('9ac6c0be14b569c5fddc7ad7348d2ef7');

	Kakao.Auth.createLoginButton({
		container : '#kakao-login-btn',
		success : function(authObj) {

			Kakao.Auth.loginForm({

				success : function(authObj) {

					Kakao.API.request({
						url : '/v1/user/me',
						success : function(res) {
							console.log(res.kaccount_email);
							console.log(res.id);
							console.log(res.properties['nickname']);
							console.log(res.properties['age_range']);
							console.log(res.properties['birthday']);
							console.log(res.properties['age_range']);

							var kakaoId = res.id;
							var kakaoNickName = res.properties['nickname'];
							
							console.log("kakaoid, nickname > kakaoIdDplCheck.co")

							
							// 카톡 아이디 로그인 > 중복 체크 중복체크
										$.ajax({
											url:"kakaoIdDplCheck.co",
											data : {
												"kakaoId" : kakaoId,
												"kakaoNickName" : kakaoNickName
											},	
											complete : function(response) {
												
												console.log(response.dplChck + response);
												if(response.dplChck){
													alert("이미 존재하는 카카오톡 아이디 입니다. 아이디를 확인해주세요.");
													location.href="main.jsp";
												}else{
													alert("아이디가 사용 가능합니다!");
													location.href="kakaoSignUpPage.jsp";
												}
											}
											});
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
		},

		fail : function(error) {
			alert(JSON.stringify(error));
		}

	});

	//]]>
</script>