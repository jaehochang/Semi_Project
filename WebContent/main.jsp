<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="include/top.jsp"%>

<div class="jumbotron" style="background-color: #b548d0">
	<div class="container">

<!-- 		<video src="./video/MeetNow.mp4" autoplay="autoplay" loop="loop" width="100%" height="100%"> -->
			<h1 id="" style="color: white;">무엇을 좋아하시나요?</h1>
			<p style="color: white;">MeetNow로 한 걸음 더 나아가기</p>
			<p>
				<a class="btn btn-primary btn-lg" href="#" role="button">가입하기&raquo;</a>
			</p>
<!-- 		</video> -->
	</div>
</div>
<div class="carousel-reviews broun-block">


<div class="container">
        <div class="row">
            <div id="carousel-reviews" class="carousel slide" data-ride="carousel">
            
                <div class="carousel-inner">
                    <div class="item active">
	<c:forEach var="items" items="${result}">
			<div class="col">
				<div class="col-xs-12 col-sm-4">
					<div class="card">
						<time datetime="2014-09-20" class="icon">
					  		<strong>6월</strong>
					  		<span>20</span>
						</time>
						<a class="img-card" href=""> <img src="./image/Tulips.jpg" />
						</a> 
						<div class="card-content">
						<br />
							<div class="">${items.attend_date}</div>
							<h2 class="card-title">
							<a href="http://www.fostrap.com/"> 
								${items.board_title}
							</a>
							</h4>
							<p class="img-member"><img class="" src="./image/manse.jpeg" alt="Focus Lab"></p>
								<div class="">주최자 : ${items.group_leader}</div>
								<div class="">주최그룹 : ${items.group_name}</div>
														
						</div>
					</div>
				</div>
			</div>
	</c:forEach>
	
	<div class="col">
		<div class="col-xs-12 col-sm-4">
			<div class="card">
				<a class="img-card" href="http://www.fostrap.com/"> <img
					src="./image/Tulips.jpg" />
				</a> <br />
				<div class="card-content">
					<h4 class="card-title">
						<a href="http://www.fostrap.com/"> Your title card </a>
					</h4>
					<div class="">Your description card!!</div>
				</div>
				<div class="card-read-more">
					<a class="btn btn-link btn-block" href="http://www.fostrap.com/">
						Read More </a>
				</div>
			</div>
		</div>
	</div>
</div>

                    </div>
                    </div>
                    </div>
                    </div>
                    </div>



				 


<%@ include file="include/bottom.jsp"%>