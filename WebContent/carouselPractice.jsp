<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script>
$(document).ready(function() {
	  $('#media').carousel({
	    pause: true,
	    interval: false,
	  });
	});
</script>
<style>
/* carousel */
.media-carousel 
{
  margin-bottom: 0;
  padding: 0 40px 30px 40px;
  margin-top: 30px;
}
/* Previous button  */
.media-carousel .carousel-control.left 
{
  left: -12px;
  background-image: none;
  background: none repeat scroll 0 0 #222222;
  border: 4px solid #FFFFFF;
  border-radius: 23px 23px 23px 23px;
  height: 40px;
  width : 40px;
  margin-top: 30px
}
/* Next button  */
.media-carousel .carousel-control.right 
{
  right: -12px !important;
  background-image: none;
  background: none repeat scroll 0 0 #222222;
  border: 4px solid #FFFFFF;
  border-radius: 23px 23px 23px 23px;
  height: 40px;
  width : 40px;
  margin-top: 30px
}
/* Changes the position of the indicators */
.media-carousel .carousel-indicators 
{
  right: 50%;
  top: auto;
  bottom: 0px;
  margin-right: -19px;
}
/* Changes the colour of the indicators */
.media-carousel .carousel-indicators li 
{
  background: #c0c0c0;
}
.media-carousel .carousel-indicators .active 
{
  background: #333333;
}
.media-carousel img
{
  width: 100%;
  height: 100%;
}
/* End carousel */
</style>
</head>
<body>
<div class="container">
  <div class="row">
    <h2>Media Slider Carousel BS3</h2>
  </div>
  <div class='row'>
    <div class='col-md-10'>
      <div class="carousel slide media-carousel" id="media">
        <div class="carousel-inner">
          <div class="item  active">
            <div class="row">
              <div class="col-md-4">
                <a class="thumbnail" href="#"><img alt="" src="./image/manse.jpeg"></a>
              </div>          
              <div class="col-md-4">
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
              <div class="col-md-4">
                <a class="thumbnail" href="#"><img alt="" src="http://placehold.it/150x150"></a>
              </div>        
            </div>
          </div>
          <div class="item">
            <div class="row">
              <div class="col-md-4">
                <a class="thumbnail" href="#"><img alt="" src="http://placehold.it/150x150"></a>
              </div>          
              <div class="col-md-4">
                <a class="thumbnail" href="#"><img alt="" src="http://placehold.it/150x150"></a>
              </div>
              <div class="col-md-4">
                <a class="thumbnail" href="#"><img alt="" src="http://placehold.it/150x150"></a>
              </div>        
            </div>
          </div>
          <div class="item">
            <div class="row">
              <div class="col-md-4">
                <a class="thumbnail" href="#"><img alt="" src="http://placehold.it/150x150"></a>
              </div>          
              <div class="col-md-4">
                <a class="thumbnail" href="#"><img alt="" src="http://placehold.it/150x150"></a>
              </div>
              <div class="col-md-4">
                <a class="thumbnail" href="#"><img alt="" src="http://placehold.it/150x150"></a>
              </div>      
            </div>
          </div>
        </div>
        <a data-slide="prev" href="#media" class="left carousel-control">‹</a>
        <a data-slide="next" href="#media" class="right carousel-control">›</a>
      </div>                          
    </div>
  </div>
</div>
</body>
</html>