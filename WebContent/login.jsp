<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>


<!-- google api -->
<meta name="google-signin-scope" content="profile email">
<script src="https://apis.google.com/js/platform.js" async defer></script>

<meta name="google-signin-client_id"
   content="29772503024-a0vbpecnn40g77lm6r1coi2sg7c1rmr5.apps.googleusercontent.com">


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MeetNow 로그인</title>


<link rel="stylesheet" type="text/css" href="css/bottom-style.css">
<link rel="stylesheet" type="text/css" href="css/mypagenav-style.css">
<link rel="stylesheet" type="text/css" href="css/login-style.css">
<link rel="stylesheet" type="text/css"
   href="css/login-failure-modal.css">

<!-- Animated  -->
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">

<!-- Modal Icon -->
<link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round"
   rel="stylesheet">
<link rel="stylesheet"
   href="https://fonts.googleapis.com/icon?family=Material+Icons">


<!-- Jquery CDN -->
<script src="https://code.jquery.com/jquery-3.3.1.js"
   integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
   crossorigin="anonymous"></script>

<!-- BootStrap CDN -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- fontawesome -->
<link rel="stylesheet"
   href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
   integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
   crossorigin="anonymous">

<!-- 카카오톡 -->
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

<!-- 페이스북 -->
<script language="javascript"
   src="http://connect.facebook.net/ko_KR/all.js"></script>


</head>
<body>



   <c:choose>


      <c:when test="${requestScope.emailRspSuccess}">

         <div id="emailFindingSuccess" class="modal fade">
            <div class="modal-dialog modal-confirm">
               <div class="modal-content">
                  <div class="modal-header">
                     <div class="icon-box">
                        <i class="material-icons">&#xE876;</i>
                     </div>
                     <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">&times;</button>
                  </div>
                  <div class="modal-body text-center">
                     <h1>전송!</h1>
                     <p>입력하신 이메일로 비밀번호가 전송되었습니다.</p>

                     <button class="btn btn-success btn-block" data-dismiss="modal"
                        data-dismiss="modal" style="background-color: grey;"
                        style="background-color:grey;"
                        onclick="window.location.href='login.jsp'">로그인하기</button>

                  </div>
               </div>
            </div>
         </div>

         <script type="text/javascript">
            $("#emailFindingSuccess").modal('show');
         </script>




      </c:when>
      
      <c:when test="${requestScope.emailRspSuccess==false}">

         <div id="emailFindingFailure" class="modal fade">
            <div class="modal-dialog modal-confirm">
               <div class="modal-content">
                  <div class="modal-header">
                     <div class="icon-box">
                        <i class="material-icons">&#xE5CD;</i>
                     </div>
                     <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">&times;</button>
                  </div>
                  <div class="modal-body text-center">
                     <h1>비밀번호 찾기 실패!</h1>
                     <p>입력하신 정보가 정확하지 않습니다!</p>

                     <button class="btn btn-success btn-block" data-dismiss="modal"
                        data-dismiss="modal" style="background-color: grey;"
                        style="background-color:grey;" onclick="$(this).modal('toggle')">닫기</button>

                  </div>
               </div>
            </div>
         </div>

         <script type="text/javascript">
            $("#emailFindingFailure").modal('show');
         </script>
      </c:when>



      <c:when test="${requestScope.kakaoIdAlreadyExist==true}">



         <!-- Modal  -->
         <div id="kakaoIdExist" class="modal fade">
            <div class="modal-dialog modal-confirm">
               <div class="modal-content">
                  <div class="modal-header">
                     <div class="icon-box">
                        <i class="material-icons">&#xE876;</i>
                     </div>
                     <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">&times;</button>
                  </div>
                  <div class="modal-body text-center">
                     <h1>성공!</h1>
                     <p>로그인 성공!</p>

                     <button class="btn btn-success btn-block" data-dismiss="modal"
                        data-dismiss="modal" style="background-color: grey;"
                        style="background-color:grey;"
                        onclick="window.location.href='interestPage.jsp'">둘러보기</button>

                  </div>
               </div>
            </div>
         </div>

         <script type="text/javascript">
            $("#kakaoIdExist").modal('show');
         </script>


      </c:when>


      <c:when test="${requestScope.loginSuccess==true}">


         <div id="loginSuccessModal" class="modal fade">
            <div class="modal-dialog modal-confirm">
               <div class="modal-content">
                  <div class="modal-header">
                     <div class="icon-box">
                        <i class="material-icons">&#xE876;</i>
                     </div>
                     <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">&times;</button>
                  </div>
                  <div class="modal-body text-center">
                     <h1>성공!</h1>
                     <p>로그인에 성공하였습니다.</p>
                     <button class="btn btn-success btn-block" data-dismiss="modal"
                        style="background-color: grey;"
                        onclick="window.location.href='interestPage.jsp'">둘러보기</button>
                  </div>
               </div>
            </div>
         </div>

         <script type="text/javascript">
            $("#loginSuccessModal").modal('show');
         </script>


      </c:when>


      <c:when test="${requestScope.signUpSuccess==true}">

         <div id="loginSuccessModal" class="modal fade">
            <div class="modal-dialog modal-confirm">
               <div class="modal-content">
                  <div class="modal-header">
                     <div class="icon-box">
                        <i class="material-icons">&#xE876;</i>

                     </div>
                     <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">&times;</button>
                  </div>
                  <div class="modal-body text-center">
                     <h1>성공!</h1>
                     <p>회원가입에 성공하였습니다.</p>
                     <button class="btn btn-success btn-block" data-dismiss="modal"
                        onclick="window.location.href='interestPage.jsp'">계속</button>
                  </div>
               </div>
            </div>
         </div>

         <script type="text/javascript">
            $("#loginSuccessModal").modal('show');
         </script>

      </c:when>



      <c:when test="${requestScope.emailExist==true}">
         <!--       회원가입 아이디 중복  -->



         <!-- Modal  -->
         <div id="signUpFailModal" class="modal fade">
            <div class="modal-dialog modal-confirm">
               <div class="modal-content">
                  <div class="modal-header">
                     <div class="icon-box">
                        <i class="material-icons">&#xE5CD;</i>
                     </div>
                     <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">&times;</button>
                  </div>
                  <div class="modal-body text-center">
                     <h1>실패!</h1>
                     <p>회원정보가 갖고 있는 이메일로 이미 가입된 계정이 존재합니다.</p>

                     <!--                   <button class="btn btn-success btn-block" data-dismiss="modal" -->
                     <!--                      onclick="window.location.href='signUpPlusWithKakao.jsp'">다른 이메일 사용</button> -->

                     <button class="btn btn-success btn-block" data-dismiss="modal"
                        onclick="$(this).modal('toggle');">다시 로그인</button>

                  </div>
               </div>
            </div>
         </div>

         <script type="text/javascript">
            $("#signUpFailModal").modal('show');
         </script>


      </c:when>


      <c:when test="${requestScope.loginResult==false}">
         <!-- Login Failure Modal -->
         <div id="loginFailModal" class="modal fade">
            <div class="modal-dialog modal-confirm">
               <div class="modal-content">
                  <div class="modal-header">
                     <div class="icon-box">
                        <i class="material-icons">&#xE5CD;</i>
                     </div>
                     <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">&times;</button>
                  </div>
                  <div class="modal-body text-center">
                     <h1>실패!</h1>
                     <p>회원정보가 올바르지 않습니다!</p>
                     <button class="btn btn-success btn-block" data-dismiss="modal"
                        onclick="$(this).modal('toggle');">다시 로그인</button>
                  </div>
               </div>
            </div>
         </div>

         <script type="text/javascript">
            $("#loginFailModal").modal('show');
         </script>
      </c:when>


      <c:when test="${requestScope.emailRspSuccess}">
         <script>
            alert("이메일 전송이 완료되었습니다.");
         </script>
      </c:when>

   </c:choose>



   <nav>
      <%@ include file="include/nav/mypageNav.jsp"%>
   </nav>


   <div class="panel panel-default" style="width: 100%; margin: 0;">
      <div class="panel-body" style="width: 50%; margin: 0 auto;">
         <div id=loginheader style="margin-bottom: 15px;">
            <h2>로그인</h2>
         </div>
      
         <div id=loginbody class="panel-body"
            style="border-bottom: 1px solid #ddd;">
            <form action="login.co" method=post>

               <div class="form-group animated fadeIn">
                  <label for=member_email>이메일 주소</label> <input class=form-control
                     type=email id=member_email min=4
                     pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$"
                     title="이메일 형태로 입력하셔야 합니다." placeholder="example@gmail.com"
                     required name=member_email max=50 width=auto>
               </div>
               <div class="form-group animated fadeIn">
                  <label for=pwd>비밀번호</label> <input id=pwd min=3 type=password
                     max=13 name=pwd class=form-control required width=auto>
                  <div style="display: block; margin-top: 10px;"></div>
               </div>

               <button id=loginCheck class="btn btn-default btn-block"
                  style="font-size: 15px;">로그인</button>
            </form>

<!-- SNS 로그인 시작 -->

               <!--                <button id=emailFind class="btn btn-default btn-block" -->
               <!--                   style="font-size: 15px;">이메일 찾기</button> -->

               <button id=pwFind class="btn btn-default btn-block"
                  data-toggle="modal" data-target="#idInputModal"
                  style="font-size: 15px;">비밀번호 찾기</button>

               <!-- 비밀번호 찾기 버튼 누를 시 >> 모달 팝업 >> 이메일을 적으시면 해당 이메일로 비밀번호가 전송됩니다. (form으로 만들어야할듯) -->
               <script>
                  $(document).$("#pwFind").click(function() {

                  })
               </script>

               <!-- Button trigger modal -->

               <!-- Modal -->

               <div class="modal fade" id="idInputModal" tabindex="-1"
                  role="dialog" aria-labelledby="exampleModalLabel"
                  aria-hidden="true">
                  <div class="modal-dialog" role="document">
                     <div class="modal-content">
                        <div class="modal-header">
                           <h5 class="modal-title" id="exampleModalLabel">비밀번호 찾기</h5>
                           <button type="button" class="close" data-dismiss="modal"
                              aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                           </button>
                        </div>


                        <div class="modal-body">
                           <label for=email-input style="margin-bottom:15px">입력한 메일로 비밀번호가 전송 됩니다.</label>
                           <form id=pwFinderForm method=post action="pwFinder.co">
                              <input id="email-input" class=form-control name=finder-email
                                 placeholder="example@email.com">
                              <button id="pwFinderBtn" class="btn btn-secondary"
                                 style="margin-top: 15px;" data-dismiss="modal">확인</button>
                           </form>
                        </div>

                     </div>
                  </div>
               </div>
            </div>
         </div>

         <script>
            document.getElementById("pwFinderBtn").onclick = function() {
               document.getElementById("pwFinderForm").submit();
            }
         </script>





         <!-- SNS 로그인 시작 -->
         <br>
         <p style="text-align: center">또는 SNS로 로그인하세요.</p>

         <div id=snsLoginBtns style="margin: 0 auto; width: 45%; margin-bottom: 50px;width: 45%;">

            <div>
               <%@ include file="signUpWithKakao.jsp"%>
               <%@ include file="signUpWithFaceBook.jsp"%>
               <%@ include file="signUpWithGoogle.jsp"%>
            </div>

            <!-- 이메일로 회원가입 -->

            <button id="kakao-signUp-btn-main" class="btn btn-warning btn-block">카카오
               로그인</button>
            <button id=fbLoginBtn class="btn btn-primary btn-block"
               onclick="javascript:signIn()">페이스북 로그인</button>
            <button id=ggLoginBtn class="btn btn-success btn-block"
               onclick="javascript:google_login_in()">구글 로그인</button>

            <script>
               $("#kakao-signUp-btn-main")
                     .click(
                           function() {

                              Kakao
                                    .init('9ac6c0be14b569c5fddc7ad7348d2ef7');

                              Kakao.Auth
                                    .loginForm({

                                       success : function(authObj) {

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
                                       fail : function(errorObj) {
                                          console.log(authObj)
                                       },
                                       persistAccessToken : true,
                                       persistRefreshToken : false
                                    });
                           });
            </script>
         </div>
      </div>


   <script>
      if (id == "" || pw == "") {
         $("#emptyinput").modal();
      }

      $("#loginbtn").click(function() {
         var id = $("#member_email").val();
         var pw = $("#pwd").val();

         $.ajax({
            url : "logincheck.co",
            type : "post",
            data : {
               id : id,
               pw : pw
            },
            success : function(resp) {
               //boolean이 true일때 로그인 안되는 모달창
               //boolean이 false일때 로그인 성공
               //                var bool = resp.bool;
               console.log("성공")
               console.log(resp.id);
               console.log(resp.pw);
               console.log(resp.bool);
               console.log(resp.bdate)
               if (resp.bool) {
                  $("#blockid").modal();
                  $("#modaltext").text("사용까지" + resp.bdate + "일 남았습니다.");
               } else {
                  location.href = "CIHLogin.co?member_email=" + resp.id;
               }
            },
            error : function() {
               console.log("에러발생");
            }
         })
      })
   </script>



   <!-- footer -->

   <%@ include file="include/bottom.jsp"%>


</body>
</html>