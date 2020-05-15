<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="/css/content.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">



<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>함께 갈 수 있는 곳</title>

<script
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=zpg6saeiva&submodules=geocoder"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>




</head>
<body>

	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<div class="container">
			<div class="container mt-3">
				<h3>
					<code>우리가 함께 갈 수 있는 장소</code>
				</h3>
				<div>
					<a class="btn btn-primary" data-toggle="collapse"
						href="#collapseExample1"> 수영장 </a> <a class="btn btn-primary"
						data-toggle="collapse" href="#collapseExample2"> 공원</a> <a
						class="btn btn-primary" data-toggle="collapse"
						href="#collapseExample3"> 쇼핑몰</a> <a class="btn btn-primary"
						data-toggle="collapse" href="#collapseExample4"> 카페</a> <a
						class="btn btn-primary" data-toggle="collapse"
						href="#collapseExample5"> 호텔</a>
				</div>
				<div class="collapse" id="collapseExample1">
					<div class="card card-body">
						개떼놀이터<br>스타독스<br>딩고카페<br>파라다이스독
					</div>
				</div>
				<div class="collapse" id="collapseExample2">
					<div class="card card-body">
						월드컵공원<br>보라매공원<br>개판오분전<br>수락반려견 놀이터<br>노원
						마들스타디움
					</div>
				</div>
				<div class="collapse" id="collapseExample3">
					<div class="card card-body">
						IFC<br>스타필드 고양
					</div>
				</div>
				<div class="collapse" id="collapseExample4">
					<div class="card card-body">상상다방</div>
				</div>
				<div class="collapse" id="collapseExample4">
					<div class="card card-body">
						카푸치노 호텔<br>오크우드 프리미어 인천<br>비스타 워커힐 호텔
					</div>
				</div>
			</div>



		</div>
	</div>
	<br>

	<script>
		$(document).ready(function() {
			$('#btn1').on('click', function() {
				let collapses = $('div.container').find('.collapse');
				collapses.each(function() {
					$(this).collapse('toggle');
				});
			});
		});
	</script>

	<div id="play" style="width: 95%; height: 500px;"></div>
	<script>
		var HOME_PATH = window.HOME_PATH || '.';

		var position1 = new naver.maps.LatLng(37.66624, 127.187882);
		var position2 = new naver.maps.LatLng(37.780495, 126.715696);
		var position3 = new naver.maps.LatLng(37.235487, 127.054918);
		var position4 = new naver.maps.LatLng(36.993873, 127.193349);
		var position5 = new naver.maps.LatLng(37.569254, 126.878524);
		
		var map = new naver.maps.Map('play', {
			center : position1,
			zoom : 19
		});

		var markerOptions1 = {
			position : position1.destinationPoint(90, 15),
			map : map,
			icon : {
				url : '/img/map.png',
				size : new naver.maps.Size(50, 52),
				origin : new naver.maps.Point(0, 0),
				anchor : new naver.maps.Point(25, 26)
			}
		};
		
		var markerOptions2 = {
				position : position2.destinationPoint(90, 15),
				map : map,
				icon : {
					url : '/img/map.png',
					size : new naver.maps.Size(50, 52),
					origin : new naver.maps.Point(0, 0),
					anchor : new naver.maps.Point(25, 26)
				}
			};
		var markerOptions3 = {
				position : position3.destinationPoint(90, 15),
				map : map,
				icon : {
					url : '/img/map.png',
					size : new naver.maps.Size(50, 52),
					origin : new naver.maps.Point(0, 0),
					anchor : new naver.maps.Point(25, 26)
				}
			};
		var markerOptions4 = {
				position : position4.destinationPoint(90, 15),
				map : map,
				icon : {
					url : '/img/map.png',
					size : new naver.maps.Size(50, 52),
					origin : new naver.maps.Point(0, 0),
					anchor : new naver.maps.Point(25, 26)
				}
			};
		var markerOptions5 = {
				position : position5.destinationPoint(90, 15),
				map : map,
				icon : {
					url : '/img/map.png',
					size : new naver.maps.Size(50, 52),
					origin : new naver.maps.Point(0, 0),
					anchor : new naver.maps.Point(25, 26)
				}
			};
		var marker1 = new naver.maps.Marker(markerOptions1);
		var marker2 = new naver.maps.Marker(markerOptions2);
		var marker3 = new naver.maps.Marker(markerOptions3);
		var marker4 = new naver.maps.Marker(markerOptions4);
		var marker5 = new naver.maps.Marker(markerOptions5);

		var contentString1 = [
				'<div class="iw_inner">',
				'<h3>개떼놀이터</h3>',
				'<p>경기 남양주시 진건읍 사릉로 280번길 7<br/>',
				'<img src="'+ HOME_PATH +'/img/play1.png" width="300" height="80" alt="개떼놀이터" class="thumb" /><br/>',
				'   </p>', '</div>' ].join('');

		var contentString2 = [
				'<div class="iw_inner">',
				'<h3>스타독스</h3>',
				'<p>경기 파주시 탄현면 국화향길 10-40<br/>',
				'<img src="'+ HOME_PATH +'/img/play2.png" width="300" height="80" alt="스타독스" class="thumb" /><br/>',
				'   </p>', '</div>' ].join('');
		
		var contentString3 = [
			'<div class="iw_inner">',
			'<h3>딩고카페</h3>',
			'<p>경기 수원시 영통구 태장로 54번길 166<br/>',
			'<img src="'+ HOME_PATH +'/img/play3.png" width="300" height="80" alt="딩고카페" class="thumb" /><br/>',
			'   </p>', '</div>' ].join('');
		var contentString4 = [
			'<div class="iw_inner">',
			'<h3>파라다이스독</h3>',
			'<p>경기 안성시 공도읍 대신두길 28 <br/>',
			'<img src="'+ HOME_PATH +'/img/play4.png" width="300" height="80" alt="파라다이스독" class="thumb" /><br/>',
			'   </p>', '</div>' ].join('');
		var contentString5 = [
			'<div class="iw_inner">',
			'<h3>월드컵공원</h3>',
			'<p>서울 마포구 하늘공원로 108-1(평화의 주차장 옆)<br/>',
			'<img src="'+ HOME_PATH +'/img/play5.png" width="300" height="80" alt="월드컵공원" class="thumb" /><br/>',
			'   </p>', '</div>' ].join('');
		
		var infowindow1 = new naver.maps.InfoWindow({
			content : contentString1,
			maxWidth : 300,
			backgroundColor : "#eee",
			borderColor : "#2db400",
			borderWidth : 2,
			anchorSize : new naver.maps.Size(30, 30),
			anchorSkew : true,
			anchorColor : "#eee",
			pixelOffset : new naver.maps.Point(20, -20)
		});

		naver.maps.Event.addListener(marker1, "click", function(e) {
			if (infowindow1.getMap()) {
				infowindow1.close();
			} else {
				infowindow1.open(map, marker1);
			}
		});

		var infowindow2 = new naver.maps.InfoWindow({
			content : contentString2,
			maxWidth : 300,
			backgroundColor : "#eee",
			borderColor : "#2db400",
			borderWidth : 2,
			anchorSize : new naver.maps.Size(30, 30),
			anchorSkew : true,
			anchorColor : "#eee",
			pixelOffset : new naver.maps.Point(20, -20)
		});

		naver.maps.Event.addListener(marker2, "click", function(e) {
			if (infowindow2.getMap()) {
				infowindow2.close();
			} else {
				infowindow2.open(map, marker2);
			}
		});
		
		var infowindow3 = new naver.maps.InfoWindow({
			content : contentString3,
			maxWidth : 300,
			backgroundColor : "#eee",
			borderColor : "#2db400",
			borderWidth : 2,
			anchorSize : new naver.maps.Size(30, 30),
			anchorSkew : true,
			anchorColor : "#eee",
			pixelOffset : new naver.maps.Point(20, -20)
		});

		naver.maps.Event.addListener(marker3, "click", function(e) {
			if (infowindow3.getMap()) {
				infowindow3.close();
			} else {
				infowindow3.open(map, marker3);
			}
		});
		var infowindow4 = new naver.maps.InfoWindow({
			content : contentString4,
			maxWidth : 300,
			backgroundColor : "#eee",
			borderColor : "#2db400",
			borderWidth : 2,
			anchorSize : new naver.maps.Size(30, 30),
			anchorSkew : true,
			anchorColor : "#eee",
			pixelOffset : new naver.maps.Point(20, -20)
		});

		naver.maps.Event.addListener(marker4, "click", function(e) {
			if (infowindow4.getMap()) {
				infowindow4.close();
			} else {
				infowindow4.open(map, marker4);
			}
		});
		var infowindow5 = new naver.maps.InfoWindow({
			content : contentString5,
			maxWidth : 300,
			backgroundColor : "#eee",
			borderColor : "#2db400",
			borderWidth : 2,
			anchorSize : new naver.maps.Size(30, 30),
			anchorSkew : true,
			anchorColor : "#eee",
			pixelOffset : new naver.maps.Point(20, -20)
		});

		naver.maps.Event.addListener(marker5, "click", function(e) {
			if (infowindow5.getMap()) {
				infowindow5.close();
			} else {
				infowindow5.open(map, marker4);
			}
		});
	</script>


	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>