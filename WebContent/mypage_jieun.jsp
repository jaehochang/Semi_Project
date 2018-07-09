<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE>
<html>
<head>

<meta name="google-signin-client_id"
	content="877251563587-9mm7utso3vmg921b183stb0anidpr2n6.apps.googleusercontent.com">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>My Page</title>


<link rel="stylesheet" type="text/css" href="css/mypagenav-style.css">
<link rel="stylesheet" type="text/css" href="css/bottom-style.css">
<link rel="stylesheet" type="text/css"
	href="css/mypage-section-style.css">
<link rel="stylesheet" type="text/css" href="css/animate.css">

<!-- Animtion On Sroll CDN -->
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

<!-- google api -->
<meta name="google-signin-client_id"
	content="201245295217-c7jm6q8qk7qf81smd0qfkfp3mlnr33cn.apps.googleusercontent.com">
<meta name="google-signin-scope" content="profile email">
<script src="https://apis.google.com/js/platform.js" async defer></script>


<!-- //밑에 CDN 순서 맞지 않으면 오류 발생// -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


<!-- Jquery CDN -->
<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>


<!-- fontawesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
	integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
	crossorigin="anonymous">
<link href="css/mdb.min.css" rel="stylesheet">
<!-- 위에 CDN 순서 맞지 않으면 오류 발생 -->


<style>
.badgebox
{
    opacity: 0;
    border-radius: 15px;
    font-weight:10px;
    
}

.badgebox + .badge
{
    /* Move the check mark away when unchecked */
    text-indent: -999999px;
    /* Makes the badge's width stay the same checked and unchecked */
	width: 27px;
}

.badgebox:focus + .badge
{
    /* Set something to make the badge looks focused */
    /* This really depends on the application, in my case it was: */
    
    /* Adding a light border */
    box-shadow: inset 0px 0px 5px;
    /* Taking the difference out of the padding */
}

.badgebox:checked + .badge
{
    /* Move the check mark back when checked */
	text-indent: 0;
	font-weigth:15px;
}
#imgChooser {
	width: 0;
	height: 0;
	opacity: 0;
}
#name1{
position:relative;
left:50px;
top:10px;
}
#profileaside{
position:relative;
left:140px;
top:80px;
}
#profile{
position:relative;
left:-50px;
}
#name2{
position:relative;
left:80px;
top:-30px;

}

#btn-upload{
	position:relative;
	left:-120px;
	top:10px;
	width:7px;
	height:20px;
}
#profile2{
position:relative;
left:148px;
}
#line{
position:relative;
top:-18px;
left:-50px;
width:500px;
}

#line2{
position:relative;
top:-130px;
left:-50px;
width:500px;

}
#memPic{
position:relative;
top:15px;
left:-150px;
}

#locationH3{
position:relative;
top:-240px;
left:170px;
}
#genderH3{
position:relative;
top:-190px;
left:20px;

}
#ageH3{
position:relative;
top:-138px;
left:-69px;
}
#subscribedH3{
position:relative;
top:-185px;
left:170px;
}

#emailH3{
position:relative;
top:-85px;
left:170px;

}

#profileShow{
position:relative;
left:10px;
}
#modifyProfileBt{
position:relative;
left:-20px;

}
</style>
<script>



$(document).ready(function() {
	$(document).on('change', '.badgebox', function() {
		if ($(this).prop('checked')) {
			$.ajax({
				url : "checked.interests",
				data : {
					term : "A",
					checkedBox : $(this).val()
				},
				success : function(response) {
					alert("체크 선택 보냄");
				},
				fail : function() {
					alert("NO");
				}
			})
		} else {
			$.ajax({
				url : "unchecked.interests",
				data : {
					term : "A",
					uncheckedBox : $(this).val()
				},
				success : function(response) {
				},
				fail : function() {
				}
			})
		}
	})
  var items=new Array;
	
	var checkStr = [];
	var uncheckStr = [];
	var count=0;
	var maxCount=11;
	
	
	
$('#tagText').keyup(function() {
$('#printTerm1').empty();
$('#printTerm2').empty();
var term = $(this).val();
$.ajax({
type : 'GET',
dataType:'json',
url : 'modifyInterests.interests',
data : {
term : term
},
success : function(response) {
console.log(response)
/* if(response==null){$('#printTerm1').html("검색 결과가 없습니다.");} */
uncheckStr= $.unique(response.uncheckedList); 
checkStr= $.unique(response.checkedList);
if (uncheckStr.length > 0|| checkStr.length > 0) {
for (var j = 0; j < checkStr.length; j++) {
$('#printTerm1').append("<span class=\"button-checkbox\" checked><label for=\"" + "tag" + j + "\" id=\"label" + i + "\"class=\"btn btn-outline-info btn-sm waves-effect active animated wobble\" style=\"margin:0 0 10px 0;font-weight:bold;font-size:11px\">"+ "<input id=\"tag" + j + "\" type=\"checkbox\" class=\"badgebox animated jello\" name=\"checkbox\" value=\""+ checkStr[j] + "\"   checked=\"checked\">"+ checkStr[j]+ "&nbsp;<span class=\"badge animated jello\">&check;</span></label></span>&nbsp;");
																}
for (var i = 0; i < uncheckStr.length; i++) {
$('#printTerm2').append("<span class=\"button-checkbox\"><label for=\"" + "tag" + i + "\" id=\"label" + i + "\"class=\"btn btn-outline-info btn-sm waves-effect animated wobble\" style=\"margin:0 0 10px 0;font-size:11px\">"+ "<input id=\"tag" + i + "\" type=\"checkbox\" class=\"badgebox animated jello\" name=\"checkbox\" value=\""+ uncheckStr[i] + "\">"+ uncheckStr[i]+ "&nbsp;<span class=\"badge animated jello\">&check;</span></label></span>&nbsp;");
}
} else{
alert("no result")
$('#printTerm1').html("해당 결과가 없습니다.");
}
}
});
	

});

$('#closeModalBt').click(function(){
	
	$.ajaxSettings.traditional = true;
	 $.ajax({
			url : "unchecked.interests",
			data : {removeallTerm : items},
			success : function() {
				
			},
			fail : function() {
				
			}
		})
	
})

$("#interestsmodifyBt").click(function(){
	$('input[type=checkbox]:checked').each(function() {
		items.push($(this).val());
		console.log(items);
		$("#hiddenTag").val(items);
		
	})
	
	if($("#hiddenTag").val()==null){
		alert("관심사 태그는 1개이상 선택하셔야합니다.")
		$('#printTerm1').focus();
		 $('#printTerm1').addClass('animated shake');
		return false;
	}
	
	$.ajaxSettings.traditional = true;
							 $.ajax({
									url : "unchecked.interests",
									data : {removeallTerm : items},
									success : function() {
										
									},
									fail : function() {
										
									}
								})
	$("#modifyInterests").submit();
})

});

</script>
</head>
<body>

	<!-- 이 줄 밑으로 my page 구현하기 -->
 <c:choose>
      <c:when test="${requestScope.infoUpdateSuccess==true}">
         <!-- 성공 모달 -->
         <!-- Central Modal Medium Success -->
         <div class="modal fade" id="centralModalSuccess" tabindex="-1"
            role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-notify modal-success" role="document">
               <!--Content-->
               <div class="modal-content">
                  <!--Header-->
                  <div class="modal-header">
                     <p class="heading lead">성공!</p>

                     <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                        <span aria-hidden="true" class="white-text">&times;</span>
                     </button>
                  </div>

                  <!--Body-->
                  <div class="modal-body">
                     <div class="text-center">
                        <i class="fa fa-check fa-4x mb-3 animated rotateIn"></i>
                        <p>회원정보 수정이 성공하였습니다!</p>
                     </div>
                  </div>

                  <!--Footer-->
                  <div class="modal-footer justify-content-center">
                     <a id=info-success-update-close-btn type="button"
                        data-dismiss="modal" class="btn btn-success" class=close>OK</a>
                  </div>
               </div>
               <!--/.Content-->
            </div>
         </div>
         <!-- Central Modal Medium Success-->

         <!-- cetral modal initialzing syntax 뒤에 있어야 밑의 scripts 작동함 -->

<script>
if(${requestScope.infoUpdateSuccess==true}){

   $('#centralModalSuccess').modal('show');
   
}else{

   
   
}
         
         
</script>
    </c:when>
      <c:when test="${requestScope.infoUpdateSuccess==false}">
         <!-- 담당자에게 문의하세요 -->
         <script>
location.href="Oops.jsp";

</script>
      </c:when>
   </c:choose>

   <%@ include file="include/nav/mypageNav.jsp"%>
      

	<div id="profilebox" style="box-shadow:none;">

		<div id=profilebody style="box-shadow:none">


			<div id=boxheader>
			<h3 id="profile" style="font-weight:bold;">${requestScope.userName}</h3><a data-toggle="modal"
               data-target="#modalContactForm" id="modifyProfileBt" >Edit Profile</a>
			<hr id="line">
			
			
			<!-- 프로필 사진 -->
			<img src="files/${userPicture}" id="memPic" style="height: 180px; width: 180px; display: block; margin: 0 auto; border-radius: 150px">
			<form action="upload.file?group_seq=0&page=mypage" method="post" id="writeForm" enctype="multipart/form-data">
				<input type="file" id="file" name="file" onchange="this.form.submit()" style="display:none;"/>
				<button type="button" class="btn btn-secondary"
					style="width:auto;height:auto; background-color: #f7f7f7; color: black;"
					id="btn-upload"><img src="img/photo.png" style="width:20px; padding-right: 3px;">Edit</button>
			</form>
			<!--  -->	
				
			<!-- 프로필 내용  -->	
				<div id="profileShow">
				<h4 id="locationH3">LOCATION  &nbsp;&nbsp;   ${requestScope.userLocation}  </h4>
				<h4 id="genderH3">GENDER  &nbsp;   ${requestScope.userGender}  </h4>
				<h4 id="ageH3">AGE  &nbsp;   ${requestScope.userGender}  </h4>
				<h4 id="emailH3">EMAIL  &nbsp;   ${requestScope.userEmail}  </h4>
				<h4 id="subscribedH3">SUBSCRIBED  &nbsp;   ${requestScope.payCheck}  </h4>
				<hr id="line2">
				</div>
				
				<!--  -->
			</div>	

		</div>
		
		   <div class="modal fade" id="modalContactForm" tabindex="-1"
            role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
               <div class="modal-content">
                  <div class="modal-header text-center">
                     <h4 class="modal-title w-100 font-weight-bold">회원정보 수정</h4>
                     <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                     </button>
                  </div>

                  <form action="updateUserInfo.co" method=post>
                     <div class="modal-body mx-3">
                        <div class="md-form mb-5"><br>
                           <i class="fa fa-user prefix grey-text"></i> <input type="text"
                              id="form34" class="form-control validate" name="member_name">
                           <label data-error="한글만 입력해주세요." data-success="O.K" for="form34">이름</label>
                        </div>

                        <div class="md-form mb-5"><br>
                           <i class="fa fa-location-arrow prefix grey-text"
                              aria-hidden="true"></i> <input type="text" id="form29"
                              class="form-control validate" name=member_location> <label
                              data-error="올바른 선택이 아닙니다." data-success="O.K" for="form29">지역</label>
                        </div>

                        <div class="md-form mb-5"><br>
                           <i class="fa fa-transgender prefix grey-text" aria-hidden="true"></i>


                           <input type="text" id="form24" class="form-control validate"
                              name=member_gender> <label data-error="올바른 입력이 아닙니다."
                              data-success="O.K" for="form24">성별</label>
                        </div>
                        <div class="md-form mb-5"><br>
                           <i class="fa fa-birthday-cake prefix grey-text"
                              aria-hidden="true"></i> <input type="number" id="form32"
                              class="form-control validate" name=member_age> <label
                              data-error="올바른 입력이 아닙니다. 숫자만 입력해주세요." data-success="O.K"
                              for="form32">나이</label>
                        </div>



                     </div>
                     <div class="modal-footer d-flex justify-content-center">
                        <button id=info-change-btn
                           class="btn btn-secondary btn-rounded mb-4 rgba-purple-strong waves-effect waves-light">
                           바꾸기<i class="fa fa-paper-plane-o ml-1"></i>
                        </button>

                     </div>
                  </form>

               </div>
            </div>
         </div>
		

<!-- 관심사 수정 -->
<form method="post"  id="modifyInterests" action="modifyInterests.co">
			<div class="modal fade" id="interestsModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle" style="font-weight:bold;">관심사 수정</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" >
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="height:auto">
      <input id="tagText" type="text" style="width: 150px;"
				class="form-control"  placeholder="예:스포츠 " required>
			<!-- <a class="disabled" href="javascript:void(0)" style="text-decoration: none;">*초기 관심사 값은 삭제 할 수 없습니다</a>	 -->
				<input type="hidden" id="hiddenTag" name="hiddenTag">
				<br>
      <div class="btn-group" data-toggle="buttons" id="printTerm1"
				style="width: auto; height:auto"></div>
				<div class="btn-group" data-toggle="buttons" id="printTerm2"
				style="width: auto; height:auto">
				</div>
      
       
      </div>
      
      <div class="modal-footer">
        <button type="button" id="closeModalBt" class="btn btn-default" data-dismiss="modal" style="background: white;font-weight: bold;" >닫기</button>
        <button type="button" id="interestsmodifyBt" class="btn btn-default" style=" background: white; font-weight: bold">수정</button>
      
      </div>
      
    </div>
  </div>
</div>

</form>
		<!-- aside 시작 -->
		<div class="panel panel-default" id=profileaside style="box-shadow:none; width:400px;height:300px;">
	

			<div id=interestbox>
				<h2>INTERESTS</h2><a data-toggle="modal" data-target="#interestsModal"> 편집</a>
				<div id=interests style=" width:auto; height:auto;"   >
			<c:forEach var="userInterests" items="${userInterests}">
			<button class="btn btn-secondary" style="margin:0 0 10px 0;background-color: #f7f7f7;" >${userInterests}</button>&nbsp;
			</c:forEach>
			</div>
			</div>
			
			

			
			
		</div>
	</div>


	<script>
		$("#btn-upload").click(function(e) {
			e.preventDefault();
			$('#file').click();
		});
	</script>

	<c:if test="${fileResult >=1 }">
		<script>
			var val = "${systemName}";
			
			$.ajax({
				url : "test.file",
				type : "get",
				data : {value : val},
				success : function(resp) {

					var contents = resp.html;
					
					console.log(contents);
				},
				error : function(request, status, error) {
					console
							.log(request.status + " : " + status + " : "
									+ error);
				},
				complate : function() {
					console.log("ajax 종료");
				}
			});
		</script>
	</c:if>

	<!-- 	footer -->
	<%@ include file="include/bottom.jsp"%>

<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
	<!-- <script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
	<script src="./resources/docs/dist/js/bootstrap.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script.
	
		src="./resources/docs/assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>