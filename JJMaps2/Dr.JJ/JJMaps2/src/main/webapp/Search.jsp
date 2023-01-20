<%@page import="com.smhrd.model1.MenuVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.model1.StoreVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="format-detection" content="telephone-no">
    
    <link rel="stylesheet" type="text/css" href="assets/css/storedtail.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/search.css">
    
    <title>Document</title>
    <style>

#map {
   width : 77%;
   height : 700px;
   padding-left:-100px;
   top:10px;
   
}


</style>
</head>
<body>

      <div id="logo">
         <a onClick='location.href="Main.jsp"'>쩝쩝여지도</a><br>
      </div>


   <% ArrayList<StoreVO> store_list=(ArrayList<StoreVO>)request.getAttribute("store_list");%>
   <% ArrayList<ArrayList<MenuVO>> menu_List=(ArrayList<ArrayList<MenuVO>>)request.getAttribute("menu_List");%>
   <% ArrayList<Double> Scores = (ArrayList<Double>)request.getAttribute("Scores"); %>
               
               
        <div id="headerdiv">
            <header>
               <!-- <a class="header_emt" id="main_Logo" href="Main.jsp">로고</a> --> 
                         <form action="Search">

            <div class="search">
<br>
               <input id="search_box" name="searchWord" type="text"
                  placeholder="     메뉴, 점포명, 지역명  검색 "> <input type="image"
                  id="search_img" style="border: none;"
                  src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">

            </div>
         </form>
            </header>
        </div>
        
        <div id="allwidth">
        <br><br><br>
        <div class="list_wrap">
        
        
        <% for(int i=0; i<store_list.size();i++){ %>
            <%int storeId =store_list.get(i).getStore_Id(); 
            String noimg="http://gdimg.gmarket.co.kr/1729899548/still/600?ver=1578298746";%>
               <% Double score = 0.0;
               if(Scores.get(i) !=null){
                  score= Scores.get(i);
               }   %>      
                <div class="list_one">
                            <img id="store_img<%=i%>" class="img"  src='<%=noimg %>' ">
            
                              <div class="list_open">
                     <%if (store_list.get(i).getStore_Status()>0){%>
                        <a style="font-size: 0.65em;  color:rgb(100, 100, 100);">🌞 영업중</a><br>
                        <%if(store_list.get(i).getStore_Card_Yn()>0){%>
                        <a style="font-size: 0.65em;  color:rgb(101, 100, 100);">💳 카드가능</a><br>
                        <a style="font-size: 0.65em;  color:rgb(101, 100, 100);">🛒 예약가능</a>   
                        <%} %>
                     <% }else{ %>
                        <a style="font-size: 0.65em;  color:rgb(101, 100, 100);">🌑 영업마감</a>
                     <%} %>
                     </div>


                     <div class="listtext">
                                <a class ="list_store" style="font-size: 0.8em;display: inline-block;padding-bottom:5px; color:rgb(141, 140, 140);"> <%=store_list.get(i).getStore_Cate() %></a>
                                <a class ="list_store"id="store_score" style="font-size: 0.8em;display: inline-block;"> ⭐ <%=score %> </a><br>
                                <a class ="list_store" id="store_name" style="font-size: 1em; font-weight: bold; font-family: 'NanumSquareNeo-Variable';color:rgb(20, 20, 20);"
                                href="StoreDetail?storeId=<%=storeId%>"><h3><%=store_list.get(i).getStore_Name() %></h3></a>
                                <br>
                                <a class ="list_store" id="store_Addr" href="StoreDetail?storeId=<%=storeId%>"style="font-size: 0.8em; color:rgb(80, 80, 80);display: inline-block;padding-bottom:8px;"><%=store_list.get(i).getStore_Addr() %></a><br>
                                <% int store_menu_size = menu_List.get(i).size();
                                if(store_menu_size>=4){
                                   for(int j=0;j<4;j++ ){%>
                                      <a class ="list_store" href="StoreDetail?storeId=<%=storeId%>"style="font-size: 0.75em;display: inline-block;padding-bottom:5px;  color:rgb(80, 80, 80);"><span><%=menu_List.get(i).get(j).getMenu_Name()%></span></a>
                                   <% } 
                                }else{
                                   for(int j=0;j<store_menu_size;j++ ){%>
                                  <a class ="list_store" href="StoreDetail?storeId=<%=storeId%>"style="font-size: 0.75em;display: inline-block;padding-bottom:5px;color:rgb(80, 80, 80);"> <span>#<%=menu_List.get(i).get(j).getMenu_Name()%></span></a>
                                   <% }
                                   }%>
                                    </div>

                </div>
                
                 <% }%>
                
        </div>

        <div class="map_wrap"> <a></a> 
            <div id="map"></div>
        </div>
        


    </div>
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