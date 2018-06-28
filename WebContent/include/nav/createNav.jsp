<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script src="js/jquery.validate.min.js"></script>

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

		
		$('#create').validate({
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
	            
			
			
		})
		
		/* $('#eventText').mouseleave(function() {
			if ($('#eventText').val() == '') {
				$('#showText').html("이름에 힌트를 좀 더 추가해 보세요");
			} else {
				$('#showText').html("");

			}
		}); */

		/*------------------------------------------  */
		
		/* $('#textArea').mouseleave(function() {
			if ($('#textArea').val() == '') {
				$('#textAreaWarning').html("최소 50자 이상 입력하세요");
			} else {
				$('#textAreaWarning').html("");

			}
		}); */
		
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



</body>

</html>



