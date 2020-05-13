<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="/css/content.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>함께 갈 수 있는 곳</title>
<script
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=zpg6saeiva&submodules=geocoder"></script>
</head>
<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<div id="content">
			<h2>우리가 함께 갈 수 있는 장소</h2>
			<script>

		window.onload = function() {
			var map = new naver.maps.Map('map', {
				center : new naver.maps.LatLng(37.533807, 126.896772),
				zoom : 17,
				zoomControl : true,
				zoomControlOptions : {
					position : naver.maps.Position.TOP_RIGHT,
					style : naver.maps.ZoomControlStyle.SMALL
				}
			});
			var marker = new naver.maps.Marker({//latitude 위도, longitude경도
				position : new naver.maps.LatLng(37.533807, 126.896772),
				map : map
			});
			//최초 중심지의 주소
			var contentString = [ "<div class='iw_inner'>", "<h3>KH정보교육원</h3>",
					"<p>서울시 영등포구 선유로2동 57이레빌딩 19F</p>", "</div>" ].join("");
			var infoWindow = new naver.maps.InfoWindow();
			naver.maps.Event.addListener(marker, "click", function(e) {
				if (infoWindow.getMap()) {
					infoWindow.close();
				} else {
					infoWindow = new naver.maps.InfoWindow({
						content : contentString
					});
					infoWindow.open(map, marker);
				}
			});
			naver.maps.Event.addListener(map,"click",function(e) {
				marker.setPosition(e.coord);
				if (infoWindow != null) {
					if (infoWindow.getMap()) {
						infoWindow.close();
					}
				}
				naver.maps.Service.reverseGeocode({
					location: new naver.maps.LatLng(e.coord.lat(),e.coord.lng()),
				},
				function(status,response){
					if(status !== naver.maps.Service.Status.OK){
						return alert("못찾겠어");
					}
					var result = response.result;
					items = result.items;//items 배열
					address = items[2].address;
					contentString =["<div class='iw_inner'>","<p>"+address+"</p>","</div>"].join("");
				}
				);
			});
		
		</script>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>