<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Page</title>
</head>
<body>

<%@ include file="include/nav/mypageNav.jsp"%>
		

	<section>
		<div class=container>
			<h2>${name}</h2>

		</div>

	</section>
	<aside>
		<img src="xbox.png"
			style="height: 100px; width: 100px; display: inline-block;"> <span>change
			your photo</span>

	</aside>
	<footer> </footer>




</body>
</html>