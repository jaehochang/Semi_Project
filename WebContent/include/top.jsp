<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
  <head>
  	 <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="./resources/docs/favicon.ico">

    <title>meet now</title>

  
    <link href="./resources/docs/dist/css/bootstrap.min.css" rel="stylesheet">


    <link href="./resources/docs/examples/jumbotron/jumbotron.css" rel="stylesheet">


    <script src="./resources/docs/assets/js/ie-emulation-modes-warning.js"></script>

  </head>
  <script>
  		$(document).ready(function(){
  			
  			$("#login").click(function(){
  				$(location).attr("href", "LoginController.co");
  				
  			});
  			$("#logout").click(function(){
  				
  				$(location).attr("href", "LogoutController.co");
  			});
  			
  		});
  </script>

  <body>
  
  	 <script>

  	 </script>
    <nav class="navbar navbar-inverse navbar-fixed-top" style="background-color: white; border: none; align-content: right">
      <div id="wrapper" class="container">
        <div id="header" class="navbar-header">
       
        </div>
        <c:choose>
        	<c:when test="${sessionScope.loginId == null}">
        <div id="navbar" class="navbar-collapse collapse">
          <form action="LoginController.co" method="post" class="navbar-form navbar-right">
            <div class="form-group">
              <input type="text" name="email" placeholder="Email" class="form-control">
            </div>
            <div class="form-group">
              <input type="password" name="pw"placeholder="Password" class="form-control">
            </div>
            <button id="login" type="submit" class="btn btn-warning">로그인</button>
          </form>
          
        </div><!--/.navbar-collapse -->
        </c:when>
        <c:otherwise>
         <div id="navbar" class="navbar-collapse collapse">
         	${sessionScope.loginId} 님 환영합니다.
        	 <button id="logout" type="button" class="btn btn-warning">로그아웃</button>
        	</div>
        </c:otherwise>
        
      </c:choose>
      </div>
    </nav>
   
    </head>
    <body>
    
</body>
</html>