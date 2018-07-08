<%@ page pageEncoding="utf8"%>

<div class="modal fade" id="myModal" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h2 class="modal-title" id="exampleModalLabel">회원가입</h2>

							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">

							<!-- 이메일로 회원가입 -->
							<button id=signUpWithEmail class="btn btn-light btn-block"
								onclick="window.location.href='signUpWithEmail.jsp'">✉
								이메일로 회원가입</button>
							<div style="text-align: center;">
								<br> 또는 <br> <br>
							</div>
							<!-- 카카오톡으로 회원가입 버튼 -->
							<button id="kakao-signUp-btn" class="btn btn-warning btn-block"
								onclick="javascript:kakaoProc()">🗨 카카오 로그인</button>
							<!-- 페이스북 -->
							<button onclick="signIn()" class="btn btn-primary btn-block">f
								페이스북 로그인</button>
							<!-- Google Login API -->
							<button type=button class="btn btn-success btn-block"
								onclick="google_login_in()">g 구글 로그인</button>

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>