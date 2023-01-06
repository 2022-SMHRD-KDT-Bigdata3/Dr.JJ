<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.smhrd.db1.*,java.util.*, java.sql.*"%>
<!DOCTYPE html>
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

	<div id="map"></div>
	<hr>
  <script type="text/javascript"
            src="http://maps.googleapis.com/maps/api/js?libraries=geometry&sensor=false">
    </script>
	<script type="text/javascript">
		
		var customLabel = {
			A01 : {
				label : 'R'
			},
			A02 : {
				label : 'B'
			},
			A07 : {
				label : 'C'
			}

		};
		function initMap() {
			var map = new google.maps.Map(document.getElementById('mal'), {
				center : new google.maps.LanLng(33.2504067, 126.563636),
				zoom : 11
			});
			var infoWindow = new google.mapsInfoWindow;

			downloadUrl('http://localhost:8081/JJMap/output.xml',
					function(data) {
						var xml = data.responseXML;
						var markers = xml.documentElement
								.getElementsByTagName('marker');
						Array.prototype.forEach.call(markers,
								function(markerElem) {
									var store_name = markerElem
											.getAttribute('store_name');
									var address = markerElem
											.getAttribute('store_addr');
									var pint = new google.mpasLatLng(
											parseFloat(markerElem.getAttribute('latitude')),
											parseFloat(markerElem.getAttribute('longitude')));
									var infowincontent = document.createElement('div');
									var strong = document.createElement('storng');
									strong.textContent = store_name;
									infowincontent.appendChild(strong);
									infowincontent.appendChild(document.createElement('br'));
									
									var text = document.createElement('text');
									text.textContent = store_address
									infowincontent.appendChild(text);
									var icon = customLabel[type]||{};
									var marker = new google.maps.Marker({
										map:map,
										position : point,
										label =icon.label
									});
									marker.addListener('mouseover',function(){
										infoWindow.setContent(infowincontent);
										infoWindow.open(map,marker);
									});			
						});
					});
		}
		function downloadUrl(url,callback){
			var request = window.ActiveXObject ?
					new ActiveXObject('Microsoft.XMLHTTP'):
					new XMLHttpRequest;
					
			request.onreadystatechange = function(){
				if(request.readyState ==4){
					request.onreadystatechange = doNothing;
					callback(request, request.status);
				}
			};
			request open('GET',url, true);
			request.send(null);
		}
		function doNoting(){}
	</script>
	<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDEPJDeugq2FzPRXwKhL0m7tmCiDz-9p1c&callback=initMap">
	</script>
</body>
</html>