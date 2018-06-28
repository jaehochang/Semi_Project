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

#bg-video {
	top: 0px;
	left: 0px;
	position: absolute;
	width: 100%;
}

#locationChangeBt:hover {
	text-decoration: underline;
}

.badgebox {
	opacity: 0;
}

.badgebox+.badge {
	/* Move the check mark away when unchecked */
	text-indent: -999999px;
	/* Makes the badge's width stay the same checked and unchecked */
	width: 27px;
}

.badgebox:focus+.badge {
	/* Set something to make the badge looks focused */
	/* This really depends on the application, in my case it was: */
	/* Adding a light border */
	box-shadow: inset 0px 0px 5px;
	/* Taking the difference out of the padding */
}

.badgebox:checked+.badge {
	/* Move the check mark back when checked */
	text-indent: 0;
}
#photoName{
position:relative;
left:120px;
top:60px;
}
#h3{
position:relative;
left:28px;
top:5px;
font-weight:bold;
}
#h4{
position:relative;
top:10px;

left:33px
}
#timeline{
position:relative;
top:-250px;
left:500px;

}
#nextBt{
position:relative;
top:-260px;
left:880px;
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

    .timeline > li {
        margin-bottom: 20px;
        position: relative;
    }

        .timeline > li:before,
        .timeline > li:after {
            content: " ";
            display: table;
        }

        .timeline > li:after {
            clear: both;
        }

        .timeline > li:before,
        .timeline > li:after {
            content: " ";
            display: table;
        }

        .timeline > li:after {
            clear: both;
        }

        .timeline > li > .timeline-panel {
            width: 46%;
            float: left;
            border: 1px solid #d4d4d4;
            border-radius: 2px;
            padding: 20px;
            position: relative;
            -webkit-box-shadow: 0 1px 6px rgba(0, 0, 0, 0.175);
            box-shadow: 0 1px 6px rgba(0, 0, 0, 0.175);
        }

            .timeline > li > .timeline-panel:before {
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

            .timeline > li > .timeline-panel:after {
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

            .timeline > li.timeline-inverted > .timeline-panel:before {
                border-left-width: 0;
                border-right-width: 15px;
                left: -15px;
                right: auto;
            }

            .timeline > li.timeline-inverted > .timeline-panel:after {
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

.timeline-body > p,
.timeline-body > ul {
    margin-bottom: 0;
}

    .timeline-body > p + p {
        margin-top: 5px;
    }

@media (max-width: 767px) {
    ul.timeline:before {
        left: 40px;
    }

    ul.timeline > li > .timeline-panel {
        width: calc(100% - 90px);
        width: -moz-calc(100% - 90px);
        width: -webkit-calc(100% - 90px);
    }

    ul.timeline > li > .timeline-badge {
        left: 15px;
        margin-left: 0;
        top: 16px;
    }

    ul.timeline > li > .timeline-panel {
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



.chat
{
    list-style: none;
    margin: 0;
    padding: 0;
}

.chat li
{
    margin-bottom: 10px;
    padding-bottom: 5px;
    border-bottom: 1px dotted #B3A9A9;
}

.chat li.left .chat-body
{
    margin-left: 60px;
}

.chat li.right .chat-body
{
    margin-right: 60px;
}


.chat li .chat-body p
{
    margin: 0;
    color: #777777;
}

.panel .slidedown .glyphicon, .chat .glyphicon
{
    margin-right: 5px;
}

.panel-body
{
    overflow-y: scroll;
    height: 250px;
}

::-webkit-scrollbar-track
{
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
    background-color: #F5F5F5;
}

::-webkit-scrollbar
{
    width: 12px;
    background-color: #F5F5F5;
}

::-webkit-scrollbar-thumb
{
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);
    background-color: #555;
}

</style>
<script>
	$(document).ready(function() {
         
		var items = [];
		
		$('#tagText').keyup(function() {
			var term = $(this).val();
			$.ajax({
				type : 'GET',
				url : 'tag.autocomplete',
				data : {
					term : term
				},
				success : function(response) {
					$('#printTerm').html(response);
					console.log("전달 성공!");
				},

			});

		});

		
		/* $('#create').validate({
			 rules: {
				 eventText: { required: true, minlength: 10 },
				 textArea: { required: true, minlength: 50  },
	            
	            },
	            messages: {
	            	eventText: {
	                    required: "이름에 힌트를 좀 더 추가해 보세요",
	                    
	               },
	                textArea: { required: "최소 50자 이상 입력하세요" },
	                
	            },
	            submitHandler: function (create) {
	            	 create.submit(); 
	            },
	            success: function (e) { 
	                alert("노이어 ㅋㅋㅋㅋ")
	                }
	            
			
			
		}) */
		
		 $('#eventText').mouseleave(function() {
			if ($('#eventText').val() == '') {
				$('#showText').html("이름에 힌트를 좀 더 추가해 보세요");
			} else {
				$('#showText').html("");

			}
		}); 

		/*------------------------------------------  */
		
		 $('#textArea').mouseleave(function() {
			if ($('#textArea').val() == '') {
				$('#textAreaWarning').html("최소 50자 이상 입력하세요");
			} else {
				$('#textAreaWarning').html("");

			}
		}); 
		
		/*  ---------------이벤트 적용------------------- */

		
			 $("#fourthBt").click(function(){  

				 
              $('#hiddenLo').val($('#labelID').text());  
              
			 $('input[type=checkbox]:checked').each(function(){
				 items.push($(this).val());
				 console.log(items);
				 $("#hiddenTag").val(items);
				 
			}) 
			
           $("#create").submit();
		
			 })
		
		

		
		
		
	}); 
</script>
</head>


<body>

	<nav>

		<ul id=nav-ul>
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





