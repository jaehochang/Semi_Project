<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>

<link rel="navtylesheet.css" type="text/stylesheet">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet" />
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/css/bootstrap.min.css"
	rel="stylesheet" />
<!---------------------------------  -->
 
<!--  animate css -->
   <link rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css"
  integrity="sha384-OHBBOqpYHNsIqQy8hL1U+8OXf9hH6QRxi0+EODezv82DfnZoV7qoHAZDwMwEJvSw"
  crossorigin="anonymous">

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

<!-- <script src="jquery-1.11.3.js"></script> -->
<!-- <script src="js/jquery.validate.min.js"></script> -->

<style>
nav {
	border-radius: 10px;
	padding: 18px;
	margin: 0;
	width: 100%;
}

#nav-ul {
	list-style: none;
	padding: 0;
	margin: 0;
	width: 100%;
}

#nav-ul li {
	display: inline-block;
	margin: 0px 7px 0px 7px;
}

a {
	color: dimgrey;
	transition-duration: 1.5s;
}

a:hover {
	transition-duration: 1.5s;
	color: violet;
	text-shadow: 1px 2px 15px grey;
}

a, a:hover, a:checked, a:visited, a:link, a:active {
	text-decoration: none;
}

li:nth-child(1) {
	padding-right: 65%;
}

li:nth-child(2) {
	padding-right: 15px;
}
#row1,#row2,#row3,#row4{
position:relative;
left:178px;
}


#bg-video {
	top: 0px;
	left: 0px;
	position: absolute;
	width: 100%;
}

#locationChangeBt:hover {
	text-decoration: underline;
}

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

#photoName {
	position: relative;
	left: 120px;
	top: 60px;
}

#h3 {
	position: relative;
	left: 28px;
	top: 5px;
	font-weight: bold;
}

#h4 {
	position: relative;
	top: 10px;
	left: 33px
}

#timeline {
	position: relative;
	top: -250px;
	left: 500px;
}

#nextBt {
	position: relative;
	top: -260px;
	left: 880px;
}


.btn btn-success{

}
/*  */
/* ==========================================================================
   Author's custom styles
   ========================================================================== */
.timeline {
	list-style: none;
	padding: 20px 0 20px;
	position: relative;
}

/* .timeline:before {
        top: 0;
        bottom: 0;
        position: absolute;
        content: " ";
        width: 6px;
        background-color: #eeeeee;
        left: 50%;
        margin-left: -1.5px;
    } */
.timeline>li {
	margin-bottom: 20px;
	position: relative;
}

.timeline>li:before, .timeline>li:after {
	content: " ";
	display: table;
}

.timeline>li:after {
	clear: both;
}

.timeline>li:before, .timeline>li:after {
	content: " ";
	display: table;
}

.timeline>li:after {
	clear: both;
}

.timeline>li>.timeline-panel {
	width: 46%;
	float: left;
	border: 1px solid #d4d4d4;
	border-radius: 2px;
	padding: 20px;
	position: relative;
	-webkit-box-shadow: 0 1px 6px rgba(0, 0, 0, 0.175);
	box-shadow: 0 1px 6px rgba(0, 0, 0, 0.175);
}

.timeline>li>.timeline-panel:before {
	position: absolute;
	top: 26px;
	right: -15px;
	display: inline-block;
	border-top: 15px solid transparent;
	border-left: 15px solid #ccc;
	border-right: 0 solid #ccc;
	border-bottom: 15px solid transparent;
	content: " ";
}

.timeline>li>.timeline-panel:after {
	position: absolute;
	top: 27px;
	right: -14px;
	display: inline-block;
	border-top: 14px solid transparent;
	border-left: 14px solid #fff;
	border-right: 0 solid #fff;
	border-bottom: 14px solid transparent;
	content: " ";
}

/* .timeline > li > .timeline-badge {
            color: #fff;
            width: 50px;
            height: 50px;
            line-height: 50px;
            font-size: 1.4em;
            text-align: center;
            position: absolute;
            top: 16px;
            left: 50%;
            margin-left: -25px;
            background-color: #999999;
            z-index: 100;
            border-top-right-radius: 50%;
            border-top-left-radius: 50%;
            border-bottom-right-radius: 50%;
            border-bottom-left-radius: 50%;
        } */

/* .timeline > li.timeline-inverted > .timeline-panel {
            float: right;
        } */
.timeline>li.timeline-inverted>.timeline-panel:before {
	border-left-width: 0;
	border-right-width: 15px;
	left: -15px;
	right: auto;
}

.timeline>li.timeline-inverted>.timeline-panel:after {
	border-left-width: 0;
	border-right-width: 14px;
	left: -14px;
	right: auto;
}

/* .timeline-badge.primary {
    background-color: #2e6da4 !important;
}

.timeline-badge.success {
    background-color: #3f903f !important;
}

.timeline-badge.warning {
    background-color: #f0ad4e !important;
}

.timeline-badge.danger {
    background-color: #d9534f !important;
}

.timeline-badge.info {
    background-color: #5bc0de !important;
} */
.timeline-title {
	margin-top: 0;
	color: inherit;
}

.timeline-body>p, .timeline-body>ul {
	margin-bottom: 0;
}

.timeline-body>p+p {
	margin-top: 5px;
}

@media ( max-width : 767px) {
	ul.timeline:before {
		left: 40px;
	}
	ul.timeline>li>.timeline-panel {
		width: calc(100% - 90px);
		width: -moz-calc(100% - 90px);
		width: -webkit-calc(100% - 90px);
	}
	ul.timeline>li>.timeline-badge {
		left: 15px;
		margin-left: 0;
		top: 16px;
	}
	ul.timeline>li>.timeline-panel {
		float: right;
	}

	/*    ul.timeline > li > .timeline-panel:before {
            border-left-width: 0;
            border-right-width: 15px;
            left: -15px;
            right: auto;
        }

        ul.timeline > li > .timeline-panel:after {
            border-left-width: 0;
            border-right-width: 14px;
            left: -14px;
            right: auto;
        } */
}

.chat {
	list-style: none;
	margin: 0;
	padding: 0;
}

.chat li {
	margin-bottom: 10px;
	padding-bottom: 5px;
	border-bottom: 1px dotted #B3A9A9;
}

.chat li.left .chat-body {
	margin-left: 60px;
}

.chat li.right .chat-body {
	margin-right: 60px;
}

.chat li .chat-body p {
	margin: 0;
	color: #777777;
}

.panel .slidedown .glyphicon, .chat .glyphicon {
	margin-right: 5px;
}

.panel-body {
	overflow-y: scroll;
	height: 250px;
}

::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
	background-color: #F5F5F5;
}

::-webkit-scrollbar {
	width: 12px;
	background-color: #F5F5F5;
}

::-webkit-scrollbar-thumb {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, .3);
	background-color: #555;
}
.error{
color: red;
}

input[type=checkbox]:checked + .check-box,
.check-box.checked { border-color: #34b93d; }

input[type=checkbox]:checked + .check-box::after,
.check-box.checked::after {
  height: 50px;
  -moz-animation: dothabottomcheck 0.2s ease 0s forwards;
  -o-animation: dothabottomcheck 0.2s ease 0s forwards;
  -webkit-animation: dothabottomcheck 0.2s ease 0s forwards;
  animation: dothabottomcheck 0.2s ease 0s forwards;
}

input[type=checkbox]:checked + .check-box::before,
.check-box.checked::before {
  height: 120px;
  -moz-animation: dothatopcheck 0.4s ease 0s forwards;
  -o-animation: dothatopcheck 0.4s ease 0s forwards;
  -webkit-animation: dothatopcheck 0.4s ease 0s forwards;
  animation: dothatopcheck 0.4s ease 0s forwards;
}
</style>
<script>

	$(document).on('change', '.badgebox', function() {
		
		
		
		if ($(this).prop('checked')) {
			
			$.ajax({
				url : "checked.autocomplete",
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
				url : "unchecked.autocomplete",
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

	
	$(document).ready(function() {
$('#nextBt').click(function(){
	var group_seq=$('#group_seq').val();

	$('#groupCreateConfirm').submit();
	
})
	
	

						var items = new Array;

						var tmp = [];
						var checkStr = [];
						var checkStr2=[];
						var checkStrArr=[];
						var uncheckStr = [];
						var uncheckStr2=[];
						var uncheckStrArr=[];
						var filterArr=[];
						var count=0;
						var maxCount=11;
						
						$('#tagText').keyup(function() {
											$('#printTerm1').empty();
											$('#printTerm2').empty();

											
											
											
											var term = $(this).val();

											$.ajax({
												type : 'GET',
														url : 'tag.autocomplete',
														data : {
															term : term
														},
														success : function(response) {

															
															if(response==null){$('#printTerm1').html("검색 결과가 없습니다.");}
															
															uncheckStr= $.unique(response.uncheckedList);
															checkStr= $.unique(response.checkedList);
															
												
															if (uncheckStr.length > 0|| checkStr.length > 0) {

																for (var j = 0; j < checkStr.length; j++) {
																	$('#printTerm1').append("<span class=\"button-checkbox\"><label for=\"" + "tag" + j + "\" id=\"label" + i + "\"class=\"btn btn-default btn-sm animated wobble\" style=\"border:1px solid gray; background:white; color:black; margin:0 0 10px 0;font-weight:bold\">"+ "<input id=\"tag" + j + "\" type=\"checkbox\" class=\"badgebox animated jello\" name=\"checkbox\" value=\""+ checkStr[j] + "\"   checked=\"checked\">"+ checkStr[j]+ "&nbsp;<span class=\"badge animated jello\">&check;</span></label></span>&nbsp;");
																}

																for (var i = 0; i < uncheckStr.length; i++) {
																	$('#printTerm2').append("<span class=\"button-checkbox\"><label for=\"" + "tag" + i + "\" id=\"label" + i + "\"class=\"btn btn-default btn-sm animated wobble\" style=\"border:1px solid gray; background:white; color:black; margin:0 0 10px 0\">"+ "<input id=\"tag" + i + "\" type=\"checkbox\" class=\"badgebox animated jello\" name=\"checkbox\" value=\""+ uncheckStr[i] + "\">"+ uncheckStr[i]+ "&nbsp;<span class=\"badge animated jello\">&check;</span></label></span>&nbsp;");

																}

															} else{
																alert("no result")
																$('#printTerm1').html("해당 결과가 없습니다.");

															}

														},

														
														
														
														
													});

										});



						$('#eventText').on('mouseleave',function(){
							if (!$('#eventText').val()) {
								$('#showText').html("이름에 힌트를 좀 더 추가해 보세요");
								$('#showText').css("color", "red");
								$('#eventText').addClass('animated shake');
							}else{
								$('#showText').html("");
							}
							
						})
						
						$('#eventText').on('keyup',function(){
							var gN=$('#eventText').val();
							
							$.ajax({
								url:"groupNameCheck.group",
								type:"get",
								data:{groupName:gN}, 
								success:function(response){
								if(response.length>0){
									$("#showText").html(response);
									$('#showText').css("color", "red");
									$('#eventText').addClass('animated shake');
								    $('#eventText').val("");
									
								}
								},
								error:function(){
									console.log("에러 발생!");
								}
								
							});
							
							
						})

						/*------------------------------------------  */

						$('#contents').on('mouseleave',function(){
							if (!$('#contents').val()) {
								$('#textAreaWarning').html("최소 50자 이상 입력하세요");
								$('#textAreaWarning').css("color", "red");
								$('#contents').addClass('animated shake');
								
							}else{
								$('#textAreaWarning').text("");
							}
						});

						

						/*  ---------------이벤트 적용------------------- */

						

						$("#fourthBt").click(function() {
							$('#hiddenLo').val($('#labelID').text());
							
							 var cntEPT = $('input:checkbox[name=checkbox]:checked').length;
						
							 while(items.length>0){
								   items.pop();
								   
							   }
								$('input[type=checkbox]:checked').each(function() {
									items.push($(this).val());
									console.log(items);
									$("#hiddenTag").val(items);
									
								})
								
								
	                              if(cntEPT<1){
									
									$('#printTerm2').html("태그 선택은 1개이상 선택하셔야합니다.")
									$('#printTerm2').focus();
									$('#printTerm2').css("color", "red");
									$('#printTerm2').css("border-color", "red");
									 $('#printTerm2').addClass('animated shake');
									return false;
									
								}
								
								if(cntEPT>10){
									alert("태그 선택은 10개 까지 선택 가능합니다.");
									console.log(items.length);
									$('#printTerm2').html("태그 선택은 10개 까지 선택 가능합니다.")
									$('#printTerm2').focus();
									$('#printTerm2').css("color", "red");
									$('#printTerm2').css("border-color", "red");
									$('#printTerm2').addClass('animated shake');
									return false;
								} 

							 if (!$('#eventText').val()) {
								$('#showText').html("이름에 힌트를 좀 더 추가해 보세요");
								$('#showText').css("color", "red");
								$('#eventText').css("border-color", "red");
								$('#eventText').addClass('animated shake');
								$('#eventText').focus();
								console.log("event text validation")
								return false;
								
								
							}
							 if(!$('#contents').val()){
								$('#textAreaWarning').html("최소 50자 이상 입력하세요");
								$('#textAreaWarning').css("color", "red");
								$('#contents').css("border-color", "red");
								$('#contents').addClass('animated shake');
								$('#contents').focus();
								
								console.log("contents validation")
								return false;
							}else if($('#contents').val().length<51){
								
								$('#textAreaWarning').html("최소 50자 이상 입력하세요");
								$('#textAreaWarning').css("color", "red");
								$('#contents').css("border-color", "red");
								$('#contents').addClass('animated shake');
								$('#contents').focus();
								
								return false;
							}else if($('#contents').val().length>3000){
								$('#textAreaWarning').html("최대 3000자까지만 입력가능합니다");
								$('#textAreaWarning').css("color", "red");
								 $('#contents').addClass('animated shake');
								 $('#contents').focus();
								 return false;
							}else{
							
								/* return true; */
							}

						 
						  $.ajaxSettings.traditional = true;
							 $.ajax({
									url : "unchecked.autocomplete",
									data : {removeallTerm : items},
									success : function(response) {
										
									},
									fail : function() {
										
									}
								})
							
							
							$("#create").submit();

						})

					});
</script>



</head>


<body>

	<nav>

		<ul id=nav-ul >
			<li><a href="main.jsp"><img
					src="https://i.imgur.com/axIYcKj.png"
					style="height: 50px; width: 150px;"></a>
			<li><a href="#">탐색</a>
			<li><a href="#">메시지</a>
			<li><a href="#">알림</a>
			<li><a href="#"><span class="glyphicon glyphicon-user"
					aria-hidden="true"></span></a>
		</ul>
	</nav>