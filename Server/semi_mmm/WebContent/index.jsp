<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
body {
	z-index: 1;
	margin: 0 auto;
}
#wrapper {
	width: 100%;
	margin: 0 auto;
	z-index: 2;
	position: relative;
}
#content {
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
	width: 1300px;
	z-index: 500;
	overflow: hidden;
}
.container {
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
}
 /* Make the image fully responsive */
 .carousel-inner img {
    width: 100%;
    height: 400px;
  }
  #carousel-area {
  width:100%;
  }
  #content>div {
  width: 410px;
  height: 500px;
  display: inline-block;
  }
</style>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MMM</title>
</head>

<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<div id="carousel-area">
			<div id="demo" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ul class="carousel-indicators">
					<li data-target="#demo" data-slide-to="0" class="active"></li>
					<li data-target="#demo" data-slide-to="1"></li>
					<li data-target="#demo" data-slide-to="2"></li>
				</ul>
				<!-- The slideshow -->
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="/img/doghos.png" alt="Los Angeles">
					</div>
					<div class="carousel-item">
						<img src="/img/doghos.png" alt="Chicago">
					</div>
					<div class="carousel-item">
						<img src="/img/doghos.png" alt="New York">
					</div>
				</div>
				<!-- Left and right controls -->
				<a class="carousel-control-prev" href="#demo" data-slide="prev">
					<span class="carousel-control-prev-icon"></span>
				</a> <a class="carousel-control-next" href="#demo" data-slide="next">
					<span class="carousel-control-next-icon"></span>
				</a>
			</div>
		</div>
	<div id="content">
		<div id="community">
		<div id="free-comm"><p>이곳을 자유 게시판 미리보기<p><p>이곳을 자유 게시판 미리보기<p><p>이곳을 자유 게시판 미리보기<p><p>이곳을 자유 게시판 미리보기<p><p>이곳을 자유 게시판 미리보기<p></div>
		<div id="free-comm"><p>이곳을 후기 게시판 미리보기<p><p>이곳을 자유 게시판 미리보기<p><p>이곳을 자유 게시판 미리보기<p><p>이곳을 자유 게시판 미리보기<p><p>이곳을 자유 게시판 미리보기<p></div>
		</div>
		<div id="market">
		<p>이곳을 번개장터 미리보기<p>
		</div>
	<div id="dessert-show">
	<p>이곳을 디저트 샵<p></div>
		</div>
	
	
	
	</div>
		
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
</body>

</html>
