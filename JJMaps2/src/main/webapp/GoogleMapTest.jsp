<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.smhrd.db1.*,java.util.*, java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C/DTD HTML 4.01 Transitional/EN" "http://www.w3.org/TR/html14/loose.dtd">
<%

%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	width: 100%;
	height: 100%;
}

#map, #map2 {
	width: 1000px;
	height: 700px;
}
</style>
</head>
<body>
	<h1>DB좌표 받아오기</h1>
	<button> 현재위치 조회 </button>
<button id="start"> 위치추적시작버튼 </button> 
<button id="stop"> 위치추적중단버튼 </button> 
<div></div>
	<div id="map"></div>
	<hr>

	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDEPJDeugq2FzPRXwKhL0m7tmCiDz-9p1c&callback=initMap">
		
	</script>
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
	<script type="text/javascript">
	var myLatLng=pos
	$(document).ready(function(){
		$('button').on('click',function(){
			window.navigator.geolocation.getCurrentPosition(success, error);//()를 붙여 자동호출하는것 x
		})
	})
	
	function success(position){
		$('div').text("내 위치 위도 = " + position.coords.latitude
				+" 내 위치 경도 = " + position.coords.longitude);
		myLatLng =(position.coords.latitude, position.coords.longitude);
	}
	function error(err){
		$('div').text("조회 실패 ==>" + err.code);
	}
	$(document).ready(function(){
		$('#start').on('click',function(){
			id = window.navigator.geolocation.watchPosition(success, error, {
				enableHighAccuracy : true,
				maximumAge : 0
			});
		})	
		$('#stop').on('click',function(){
			window.navigator.geolocation.clearWatch(id);
			$('div').text("위치추적 중단합니다.");
		})
	})
     
	
		function initMap() {
			var map = new google.maps.Map(document.getElementById('map'), {
				center : myLatLng,
				zoom : 11,
				mapTypeControl: true,
		          panControl: true,
		          zoomControl: true
			});

			
			var infoWindow = new google.maps.InfoWindow({
				content: document.getElementById("info-content"),
			});
			

			//Url 포트 에러시 실행한 브라우저 창에 나온 포트번호로 번호만 바꾸면 됨!
			downloadUrl('http://localhost:14510/JJMap/output.xml', function(
					data) {
				var xml = data.responseXML;
				var markers = xml.documentElement
						.getElementsByTagName('marker');
				Array.prototype.forEach.call(markers, function(markerElem) {
					var name = markerElem.getAttribute('store_name');
					var address = markerElem.getAttribute('store_addr');
					var cate = markerElem.getAttribute('store_cate');
					var point = new google.maps.LatLng(parseFloat(markerElem
							.getAttribute('latitude')), parseFloat(markerElem
							.getAttribute('longitude')));

					var infowincontent = document.createElement('div');
					var strong = document.createElement('storng');
					strong.textContent = name;
					infowincontent.appendChild(strong);
					infowincontent.appendChild(document.createElement('br'));

					var text = document.createElement('text');
					text.textContent = address + " , " + cate;
					infowincontent.appendChild(text);

					var marker = new google.maps.Marker({
						map : map,
						position : point,
					});
					marker.addListener('mouseover', function() {
						infoWindow.setContent(infowincontent);
						infoWindow.open(map, marker);
					});
					marker.addListener('click', function() {

						//중심 위치를 클릭된 마커의 위치로 변경
						map.setCenter(this.getPosition());

						//마커 클릭 시의 줌 변화
						map.setZoom(14);
						if (marker.getAnimation() == null) {
							marker.setAnimation(google.maps.Animation.BOUNCE);
						} else {
							marker.setAnimation(null);
						}
					});

				});
			});
		}
		function downloadUrl(url, callback) {
			var request = window.ActiveXObject ? new ActiveXObject(
					'Microsoft.XMLHTTP') : new XMLHttpRequest;

			request.onreadystatechange = function() {
				if (request.readyState == 4) {

					callback(request, request.status);
				}
			};
			request.open('GET', url, true);
			request.send(null);
		}
	</script>

</body>
</html>