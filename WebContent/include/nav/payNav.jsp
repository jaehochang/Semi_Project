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
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>


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

}
.box {
  background:#fff;
  transition:all 0.2s ease;
  border:2px dashed #dadada;
  margin-top: 10px;
  box-sizing: border-box;
  border-radius: 5px;
  background-clip: padding-box;
  padding:0 20px 20px 20px;
  min-height:340px;
}

.box:hover {
  border:2px solid #525C7A;
}

.box span.box-title {
    color: #fff;
    font-size: 24px;
    font-weight: 300;
    text-transform: uppercase;
}

.box .box-content {
  padding: 16px;
  border-radius: 0 0 2px 2px;
  background-clip: padding-box;
  box-sizing: border-box;
}
.box .box-content p {
  color:#515c66;
  text-transform:none;
}

.radio {
    padding-left: 20px; }
.radio label {
    display: inline-block;
    position: relative;
    padding-left: 5px; }
.radio label::before {
    content: "";
    display: inline-block;
    position: absolute;
    width: 17px;
    height: 17px;
    left: 0;
    margin-left: -20px;
    border: 1px solid #cccccc;
    border-radius: 50%;
    background-color: #fff;
    -webkit-transition: border 0.15s ease-in-out;
    -o-transition: border 0.15s ease-in-out;
    transition: border 0.15s ease-in-out; }
.radio label::after {
    display: inline-block;
    position: absolute;
    content: " ";
    width: 11px;
    height: 11px;
    left: 3px;
    top: 3px;
    margin-left: -20px;
    border-radius: 50%;
    background-color: #555555;
    -webkit-transform: scale(0, 0);
    -ms-transform: scale(0, 0);
    -o-transform: scale(0, 0);
    transform: scale(0, 0);
    -webkit-transition: -webkit-transform 0.1s cubic-bezier(0.8, -0.33, 0.2, 1.33);
    -moz-transition: -moz-transform 0.1s cubic-bezier(0.8, -0.33, 0.2, 1.33);
    -o-transition: -o-transform 0.1s cubic-bezier(0.8, -0.33, 0.2, 1.33);
    transition: transform 0.1s cubic-bezier(0.8, -0.33, 0.2, 1.33); }
.radio input[type="radio"] {
    opacity: 0; }
.radio input[type="radio"]:focus + label::before {
    outline: thin dotted;
    outline: 5px auto -webkit-focus-ring-color;
    outline-offset: -2px; }
.radio input[type="radio"]:checked + label::after {
    -webkit-transform: scale(1, 1);
    -ms-transform: scale(1, 1);
    -o-transform: scale(1, 1);
    transform: scale(1, 1); }
.radio input[type="radio"]:disabled + label {
    opacity: 0.65; }
.radio input[type="radio"]:disabled + label::before {
    cursor: not-allowed; }
.radio.radio-inline {
    margin-top: 0; }
    


#Bt{
 background-color:#b831d9;
}
.btn btn-block btn-default, .btn btn-block btn-default:hover, .btn btn-block btn-default:active, .btn btn-block btn-default:visited {
    background-color: #8064A2;
}
#payBox,#payBox2{
position:relative;
left:340px;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>

	$(document).ready(function() {
	
		$('#Bt2').click(function() {
			var IMP = window.IMP; 
		IMP.init('imp14365188');
		IMP.request_pay({
			pg:'kakaopay',
			amount:'1000',
			pay_method:'card',
			merchant_uid:'merchant_'+new Date().getTime(),
            name:'주문명:결제테스트',	
            buyer_email:'plmn8550@naver.com',
            buyer_name : '홍길동',
            buyer_tel:'010-6402-6090',
            buyer_addr:'서울특별시 영등포구 당산동',
            buyer_postcode:'123-456',
            m_redirect_url:'payEnd.group'
		
		}, function(response) {
			//결제 후 호출되는 callback함수
			if (response.success) { //결제 성공
				console.log(response);
			var msg='결제가 완료되었습니다.';
			msg+='고유ID : '+response.imp_uid;
			msg+='상점 거래ID : '+response.merchant_uid;
			msg+='결제 금액 : '+response.paid+amount;
			msg+='카드 승인번호 : '+response.apply_num;
			
			// 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
	        // jQuery로 HTTP 요청
	        jQuery.ajax({
	            url: "https://www.myservice.com/payments/complete", // 가맹점 서버
	            method: "POST",
	            headers: { "Content-Type": "application/json" },
	            data: {
	                imp_uid: rsp.imp_uid,
	                merchant_uid: rsp.merchant_uid
	            }
	        }).done(function (data) {

	        })
			
			} else {
				var msg='결제에 실패하였습니다.';
				msg+='에러내용 : '+response.error_msg;
				
			}
			alert(msg);
		})

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