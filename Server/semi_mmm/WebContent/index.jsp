<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
#content>div {
margin:0 auto;
}
</style>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MMM</title>
</head>

<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container"  style="overflow:hidden;">
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
						<img src="/img/doghos.png" alt="병원이래">
					</div>
					<div class="carousel-item">
						<img src="/img/dogpark.png" alt="공원이래">
					</div>
					<div class="carousel-item">
						<img src="/img/parkwan.png" alt="박완규잉">
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
		<div id="content" style="margin: 0 auto; width: 100%; height: 800px;padding:30px; display:flex;">
		<div id="hoone">
		<p style="font-size:30px; font-weight:bold;">유기견 후원</p>
					<img src="/img/index.png" style="width:500px; height: 700px; cursor:pointer;" onclick="location.href='https://www.wadiz.kr/web/campaign/detail/18944'">	
			</div>
			<div id="gang">
			<p style="font-size:30px; font-weight:bold;">강형욱 프리미엄 훈육</p>
			<img src="/img/gang.png" style="width:500px; height: 500px; cursor:pointer;" onclick="location.href='https://www.bodeum.co.kr/html/edu_movie/teach/edu_detail_package.php?idx=58'">	
				</div>
	</div>
		<div id="read" style="padding:80px; margin:0 auto;">
			<p style="font-size:30px; font-weight:bold;">강아지 시그널</p>
			<img src="/img/dogsig.png" style="cursor:pointer; width:1300px; height: 500px;" onclick="location.href='https://www.dogmate.co.kr/blog/2018/11/19/%EA%B0%95%EC%95%84%EC%A7%80%EC%9D%98-%EC%96%B8%EC%96%B4-%EC%B9%B4%EB%B0%8D%EC%8B%9C%EA%B7%B8%EB%84%90-%ED%95%B4%EC%84%9D%EB%B2%95/'">	
				</div>
	<br><br><br><br><br><br><br>
	</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
