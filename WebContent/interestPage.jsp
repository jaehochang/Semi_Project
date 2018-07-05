<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관심사2</title>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<style>
.check
{
    opacity:0.3;
	color:#996;
	
}

</style>
<script>

$(document).ready(function(e){
	
	var checked=new Array;
	
	$(".img-check").click(function(){
		$(this).toggleClass("check");
		 var $widget = $(this),
         $button = $widget.find('button'),
         $checkbox = $widget.find('input:checkbox'),
         color = $button.data('color'),
         settings = {
             on: {
                 icon: 'icon icon-check'
             },
             off: {
                 icon: 'icon icon-unchecked'
             }
         };
	});
	
	
	
	$('#nextBt').click(function(){
		$('input[type=checkbox]:checked').each(function() {
			checked.push($(this).val());
			
			$("#hiddenTag").val(checked);
			alert($("#hiddenTag").val());
		})
		
		
		
	})
	
	
});
</script>
</head>
<body>
	<div class="container" style="height:100%">
	<div class="row">
		<form method="get" action="#">
		<div class="form-group">
		<br>
		<h1 style="text-align:center">관심사를 몇 개 골라보세요!</h1>
		<br><br>	
		<div class="col-md-3"><label class="btn btn-default" style="border:transparent"><img src="./interests/기술.PNG" class="img-rounded img-check" style="width:100%;height:100%"><input type="checkbox" name="chk1" id="item4" value="기술" class="hidden" autocomplete="off"></label><label>기술</label></div>
		<div class="col-md-3"><label class="btn btn-default" style="border:transparent"><img src="./interests/가족.PNG" class="img-rounded img-check" style="width:100%;height:100%"><input type="checkbox" name="chk2" id="item4" value="가족" class="hidden" autocomplete="off"></label><label>가족</label></div>
		<div class="col-md-3"><label class="btn btn-default" style="border:transparent"><img src="./interests/건강과웰빙.PNG"  class="img-rounded img-check" style="width:100%;height:100%"><input type="checkbox" name="chk3" id="item4" value="건강과웰빙" class="hidden" autocomplete="off"></label><label>건강과 웰빙</label></div>
		<div class="col-md-3"><label class="btn btn-default" style="border:transparent"><img src="./interests/스포츠피트니스.PNG" class="img-rounded img-check" style="width:100%;height:100%"><input type="checkbox" name="chk4" id="item4" value="스포츠피트니스" class="hidden" autocomplete="off"></label><label>스포츠/피트니스</label></div>
		<br><h4 style="color:white">MeetNow</h4>
		
		
		<div class="col-md-3"><label class="btn btn-default" style="border:transparent"><img src="./interests/학습.PNG" class="img-rounded img-check" style="width:100%;height:100%"><input type="checkbox" name="chk5" id="item4" value="학습" class="hidden" autocomplete="off"></label><label>학습</label></div>
		<div class="col-md-3"><label class="btn btn-default" style="border:transparent"><img src="./interests/사진촬영.PNG" alt="..." class="img-rounded img-check" style="width:100%;height:100%"><input type="checkbox" name="chk6" id="item4" value="사진촬영" class="hidden" autocomplete="off"></label><label>사진촬영</label></div>
		<div class="col-md-3"><label class="btn btn-default" style="border:transparent"><img src="./interests/음식.PNG" alt="..." class="img-rounded img-check" style="width:100%;height:100%"><input type="checkbox" name="chk7" id="item4" value="음식" class="hidden" autocomplete="off"></label><label>음식</label></div>
		<div class="col-md-3"><label class="btn btn-default" style="border:transparent"><img src="./interests/글쓰기.PNG" alt="..." class="img-rounded img-check" style="width:100%;height:100%"><input type="checkbox" name="chk4" id="item4" value="글쓰기" class="hidden" autocomplete="off"></label><label>글쓰기</label></div>
		<br><h4 style="color:white">MeetNow</h4>
		
		<div class="col-md-3"><label class="btn btn-default" style="border:transparent"><img src="./interests/언어와문화.PNG" alt="..." class="img-rounded img-check" style="width:100%;height:100%"><input type="checkbox" name="chk4" id="item4" value="언어와문화" class="hidden" autocomplete="off"></label><label>언어와 문화</label></div>
		<div class="col-md-3"><label class="btn btn-default" style="border:transparent"><img src="./interests/음악.PNG" alt="..." class="img-rounded img-check" style="width:100%;height:100%"><input type="checkbox" name="chk4" id="item4" value="음악" class="hidden" autocomplete="off"></label><label>음악</label></div>
		<div class="col-md-3"><label class="btn btn-default" style="border:transparent"><img src="./interests/사회운동.PNG" alt="..." class="img-rounded img-check" style="width:100%;height:100%"><input type="checkbox" name="chk4" id="item4" value="사회운동" class="hidden" autocomplete="off"></label><label>사회운동</label></div>
		<div class="col-md-3"><label class="btn btn-default" style="border:transparent"><img src="./interests/영화.PNG" alt="..." class="img-rounded img-check" style="width:100%;height:100%"><input type="checkbox" name="chk4" id="item4" value="영화" class="hidden" autocomplete="off"></label><label>영화</label></div>
		<br>
		
		
		<div class="col-md-3"><label class="btn btn-default" style="border:transparent"><img src="./interests/공상과학게임.PNG" alt="..." class="img-rounded img-check" style="width:100%;height:100%"><input type="checkbox" name="chk4" id="item4" value="공상과학게임" class="hidden" autocomplete="off"></label><label>공상과학/게임</label></div>
		<div class="col-md-3"><label class="btn btn-default" style="border:transparent"><img src="./interests/예술.PNG" alt="..." class="img-rounded img-check" style="width:100%;height:100%"><input type="checkbox" name="chk4" id="item4" value="예술" class="hidden" autocomplete="off"></label><label>예술</label></div>
		<div class="col-md-3"><label class="btn btn-default" style="border:transparent"><img src="./interests/북클럽.PNG" alt="..." class="img-rounded img-check" style="width:100%;height:100%"><input type="checkbox" name="chk4" id="item4" value="북클럽" class="hidden" autocomplete="off"></label><label>북클럽</label></div>
		<div class="col-md-3"><label class="btn btn-default" style="border:transparent"><img src="./interests/춤.PNG" alt="..." class="img-rounded img-check" style="width:100%;height:100%"><input type="checkbox" name="chk4" id="item4" value="춤" class="hidden" autocomplete="off"></label><label>춤</label></div>
		
		<br><h4 style="color:white">MeetNow</h4>
		
		<div class="col-md-3"><label class="btn btn-default" style="border:transparent"><img src="./interests/반려동물.PNG" alt="..." class="img-rounded img-check" style="width:100%;height:100%"><input type="checkbox" name="chk4" id="item4" value="반려동물" class="hidden" autocomplete="off"></label><label>반려동물</label></div>
		<div class="col-md-3"><label class="btn btn-default" style="border:transparent"><img src="./interests/취미와공예.PNG" alt="..." class="img-rounded img-check" style="width:100%;height:100%"><input type="checkbox" name="chk4" id="item4" value="취미와공예" class="hidden" autocomplete="off"></label><label>취미와공예</label></div>
		<div class="col-md-3"><label class="btn btn-default" style="border:transparent"><img src="./interests/패션과스타일.PNG" alt="..." class="img-rounded img-check" style="width:100%;height:100%"><input type="checkbox" name="chk4" id="item4" value="패션과스타일" class="hidden" autocomplete="off"></label><label>패션과스타일</label></div>
		<div class="col-md-3"><label class="btn btn-default" style="border:transparent"><img src="./interests/비즈니스.PNG" alt="..." class="img-rounded img-check" style="width:100%;height:100%"><input type="checkbox" name="chk4" id="item4" value="비즈니스" class="hidden" autocomplete="off"></label><label>비즈니스</label></div>
		
		<br><h4 style="color:white">MeetNow</h4>
		</div>
		
		<input type="hidden" id="hiddenTag">
		<input type="submit" id="nextBt" value="다음" class="btn btn-block btn-default" style="background-color:#b831d9; color:white; font-weight:bold">
		<br>
		</form>
	</div>	
</div> 
	

</body>
</html>