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
	width : 100%;
	height : 100%;
}

#map, #map2 {
	width : 1000px;
	height : 700px;
}
</style>
</head>
<body>
	<h1>DB좌표 받아오기</h1>

	<div id="map"></div>
	<hr>

    	<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDEPJDeugq2FzPRXwKhL0m7tmCiDz-9p1c&callback=initMap"
	>	
	</script>
	<script type="text/javascript">

		function initMap() {
			var map = new google.maps.Map(document.getElementById('map'), {
				center : new google.maps.LatLng(35.15, 126.8),
				zoom : 11
			});
			var infoWindow = new google.maps.InfoWindow;

			downloadUrl('http://localhost:14510/JJMap/output.xml', function(data) {
						var xml = data.responseXML;
						var markers = xml.documentElement.getElementsByTagName('marker');
						console.log(markers)
						Array.prototype.forEach.call(markers, function(markerElem) {
									var name = markers.getAttribute('store_name');
									var address = markers.getAttribute('store_addr');
									var point = new google.maps.LatLng(
											Double.parseDouble(markers.getAttribute('latitude')),
											Double.parseDouble(markers.getAttribute('longitude')));
									
									var infowincontent = document.createElement('div');
									var strong = document.createElement('storng');
									strong.textContent = name;
									infowincontent.appendChild(strong);
									infowincontent.appendChild(document.createElement('br'));
									
									var text = document.createElement('text');
									text.textContent = address
									infowincontent.appendChild(text);

									var marker = new google.maps.Marker({
										map:map,
										position : point,
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
				if(request.readyState == 4){
					request.onreadystatechange = doNothing;
					callback(request, request.status);
				}
			};
			request.open('GET',url, true);
			request.send(null);
		}
		function doNoting(){
			return null;
		}
	</script>

</body>
</html>