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
	<div id="locationField">
		<input id="autocomplete" placeholder="Enter your address" type="text">
	</div>

	<input class="field" id="lat" />
	<input class="field" id="lng" />
	<div id="map"></div>
	<hr>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCkUOdZ5y7hMm0yrcCQoCvLwzdM6M8s5qk&libraries=places&callback=initAutocomplete"
		async defer></script>
	<script type="text/javascript">
		var placeSearch, autocomplete;
		function initAutocomplete() {
			// Create the autocomplete object, restricting the search to geographical
			// location types.
			autocomplete = new google.maps.places.Autocomplete((document
					.getElementById('autocomplete')), {
				types : [ 'geocode' ]
			});
			// When the user selects an address from the dropdown, populate the address
			// fields in the form.
			autocomplete.addListener('place_changed', fillInAddress);
		}
		function fillInAddress() {
			// Get the place details from the autocomplete object.
			var place = autocomplete.getPlace();
			document.getElementById("lat").value = place.geometry.location
					.lat();
			document.getElementById("lng").value = place.geometry.location
					.lng();
		}
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
									var pint = new google.mpasLatLng()
								})
					})
		}
	</script>
</body>
</html>