<%@ page import="com.smhrd.model1.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE HTML>

<html>
<head>
<title>main</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
<meta name="format-detection" content="telephone-no">
<link rel="stylesheet" type="text/css" href="assets/css/jjmain.css">

<style type="text/css">
.search {
  top: 130px;
  position: relative;
  width: 300px;
}


#map {
	width : 80%;
	height : 700px;
	position:relative;
	align : center;
	padding-left: 100px;
}

#search_box {
  width:100%;
  height: 25px;
  font-size: 15px;
  border: 0;
  border-radius: 40px;
  outline: none;
  padding-left: 10px;
  background-color: rgb(233, 233, 233);
   opacity:0.87;
}

#search_img {
  position : absolute;
  width: 17px;
  top: 3px;
  right: -7px;
  margin: 0;
}

#logo{
width:100%;
heigh:80px;
display: inline-block;
position: relative;
}
#logo > a{text-align:center;
	color: #FD6F22;
	font-family: 'RixInooAriDuriR';
	font-size: 40px;}


.head{
display: inline-block;}
.head_left{float: right;
position:relative;
margin-top:8px;}
.head_text{
 padding-right: 10px;
 color: rgb(141, 140, 140);
 letter-spacing :0.009em; 
 font-size: 0.9em;}
 
</style>




<body>
	<%
	MemberVO info = (MemberVO) (session.getAttribute("info"));
	%>

	<header>
	
		<div  id="logo"  style="margin-top: 10px;">
			<a style=" font-size:2.15em;">쩝쩝여지도</a> <br>
			<span id="main_st" style="
    font-weight: bold; font-size:0.8em;font-family: 'NanumSquareNeo-Variable'; letter-spacing :0.7px;" >당신의 맛있는 지도</span>

		</div>
		<!-- 로그인 여부 판별-->
		<div class='head head_left'>
<br>
	<%
		if(info !=null &&info.getUser_Nick().equals("admin")){
			out.print("<a href='CreateXml' method='post'>점포정보 최신화하기</a>");
		}
		%>
			<%
			if (info != null) {
				if (info.getUser_Code().equals("1")) {
					out.print("<a class='head_text' href='Mystore.jsp'>오늘영업</a>");
				}
				out.print("<a class='head_text'  id='mypage' href='Mypage.jsp'>마이페이지</a></li>");
				out.print("<a  class='head_text' id='logout' href='LogoutService'>로그아웃</a></li>");

				// smart 1234 -> usercode 0(일반이용자)
				// ssss 1234 -> usercode 1(점포이용자)

			} else {
				out.print("<a class='head_text' id='login' href='Login.jsp'>로그인</a></li>");
				out.print("<a class='head_text' id='join' href='Join.jsp'>회원가입</a></li>");
			}
			%> 
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js"
  integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx" crossorigin="anonymous"></script>

		</div>
	</header>
	
	<div class="Header_Init_Section">
		<div id="header_img">
		
			<form action="Search">

				<div class="search">
				
					<input id="search_box" name="searchWord" type="text" placeholder="     메뉴, 점포명, 지역명  검색 ">
					<input type="image" id="search_img" style="border:none;"
					src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">

				</div>
			</form>
		</div>

	</div>



	<!-- 여기까지 헤더 -->

	
	<br>
	<main>
	<header class="like">
		<div class="love">
			<span style="font-family: 'NanumSquareNeo-Variable';letter-spacing :7px; color:  #0E5049" >JJMAPS</span>

		</div>
	</header>
	<br><br><br>
	<div class="map_wrap"> <a></a> 
            <div id="map"></div>
        </div>
        		
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	</main>
	<footer id="footer">@JJUPJJUPBAKSA</footer>
	 <script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDEPJDeugq2FzPRXwKhL0m7tmCiDz-9p1c"
	>	
	</script>
	<script type="text/javascript">

	function success({ coords, timestamp }) {
		 console.log('coords', coords);
       latitude = coords.latitude;   // 위도
       longitude = coords.longitude; // 경도
		console.log(latitude);       
 		initMap(latitude,longitude);
   }
   function getUserLocation() {
       if (!navigator.geolocation) {
           throw "위치 정보가 지원되지 않습니다.";
       }
       navigator.geolocation.watchPosition(success);
   }
   getUserLocation()	
	
		var customLabel = {
			붕어빵 : {
				label : 'B'
			},
			타코야끼 : {
				label : 'T'
			},
			분식 : {
				label : 'V'
			},
			분식류 : {
				label : 'V'
			},
			타꼬야끼 : {
				label : 'T'
			},
			호떡 : {
				label : 'H'
			},
			기타 : {
				label : 'G'
			}
		};

		function initMap() {
			var map = new google.maps.Map(document.getElementById('map'), {
				center : new google.maps.LatLng(latitude, longitude),
				zoom : 11,
				mapTypeControl : true,
				panControl : true,
				zoomControl : true
			});

			var infoWindow = new google.maps.InfoWindow({
				content : document.getElementById("info-content"),
			});

			//Url 포트 에러시 실행한 브라우저 창에 나온 포트번호로 번호만 바꾸면 됨!
			downloadUrl('http://localhost:14510/JJMap/output.xml', function(
					data) {
				console.log(data);
				var xml = data.responseXML;
				console.log(xml);
				var markers = xml.documentElement
						.getElementsByTagName('stores');
				console.log(markers);
				Array.prototype.forEach.call(markers, function(markerElem) {
					var name = markerElem.getAttribute('store_name');
					var address = markerElem.getAttribute('store_addr');
					var cate = markerElem.getAttribute('store_cate');
					var point = new google.maps.LatLng(parseFloat(markerElem
							.getAttribute('latitude')), parseFloat(markerElem
							.getAttribute('longitude')));
					console.log(name, point);
					var infowincontent = document.createElement('div');
					var strong = document.createElement('storng');
					strong.textContent = name;
					infowincontent.appendChild(strong);
					infowincontent.appendChild(document.createElement('br'));

					var text = document.createElement('text');
					text.textContent = address + " , " + cate;
					infowincontent.appendChild(text);
					var icon = customLabel[cate] || {};
					var marker = new google.maps.Marker({
						map : map,
						position : point,
						label : icon.label
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