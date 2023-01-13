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
    
    <link rel="stylesheet" type="text/css" href="assets/css/search.css">
    <link rel="stylesheet" type="text/css" href="assets/css/storedtail.css" />
    
    <title>Document</title>
    <style>

#map, #map2 {
	width : 1000px;
	height : 700px;
}
</style>
</head>
<body>

		<div id="logo">
			<a onClick='location.href="Main.jsp"'>쩝쩝여지도</a><br>
		</div>


	<% ArrayList<StoreVO> store_list=(ArrayList<StoreVO>)request.getAttribute("store_list");%>
	<% ArrayList<ArrayList<MenuVO>> menu_List=(ArrayList<ArrayList<MenuVO>>)request.getAttribute("menu_List");%>
					
					
        <div id="headerdiv">
            <header>
               <!-- <a class="header_emt" id="main_Logo" href="Main.jsp">로고</a> --> 
                <form class="header_emt " id="main_form" action="Search" >
                        <input name="searchWord" class="header_emt search" type="text" placeholder="검색어 입력">
                        <input class="header_emt search" type="submit" value="검색">
                    </form>
            </header>
        </div>
        
        <div id="allwidth">
            <div id="map2"></div>
        <div class="list_wrap">
        
        
        
        
        <% for(int i=0; i<store_list.size();i++){ %>
     		 <%int storeId =store_list.get(i).getStore_Id(); %>
								
                <div class="list_one">
                    <table>
                        <tr>
                            <td>
                            <img id="store_img<%=i%>" src="assets/css/images/samplefood.JPG">
                            </td>
                            
                            <td>
                                <a class ="list_store"> <%=store_list.get(i).getStore_Cate() %></a><br>
                                <a class ="list_store" id="store_name" href="StoreDetail?storeId=<%=storeId%>"><h3><%=store_list.get(i).getStore_Name() %></h3></a>
                                <a class ="list_store"id="store_score"> ⭐ 3.5(2명) </a><br>
                                <a class ="list_store" id="store_Addr" href="StoreDetail?storeId=<%=storeId%>"><%=store_list.get(i).getStore_Addr() %></a><br>
                                <% int store_menu_size = menu_List.get(i).size();
                                if(store_menu_size>=4){
	                                for(int j=0;j<4;j++ ){%>
	                                	<a class ="list_store" href="StoreDetail?storeId=<%=storeId%>"><span>#<%=menu_List.get(i).get(j).getMenu_Name()%></span></a>
	                                <% } 
                                }else{
                                	for(int j=0;j<store_menu_size;j++ ){%>
	                               <a class ="list_store" href="StoreDetail?storeId=<%=storeId%>"> <span>#<%=menu_List.get(i).get(j).getMenu_Name()%></span></a>
	                                <% }
                                	}%>
                            
                            </td>
                        </tr>
                    </table>
                </div>
                
                 <% }%>
                
        </div>

        <div class="map_wrap"> <a></a> 
            <div id="map"></div>
        </div>
        


    </div>
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
//Url 포트 에러시 실행한 브라우저 창에 나온 포트번호로 번호만 바꾸면 됨!
			downloadUrl('http://localhost:14510/JJMap/output.xml', function(data) {
						var xml = data.responseXML;
						var markers = xml.documentElement.getElementsByTagName('marker');
						Array.prototype.forEach.call(markers, function(markerElem) {
									var name = markerElem.getAttribute('store_name');
									var address = markerElem.getAttribute('store_addr');
									var cate = markerElem.getAttribute('store_cate');
									var point = new google.maps.LatLng(
											parseFloat(markerElem.getAttribute('latitude')),
											parseFloat(markerElem.getAttribute('longitude')));
									
									var infowincontent = document.createElement('div');
									var strong = document.createElement('storng');
									strong.textContent = name;
									infowincontent.appendChild(strong);
									infowincontent.appendChild(document.createElement('br'));
									
									var text = document.createElement('text');
									text.textContent = address+" , "+cate;
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
					
					callback(request, request.status);
				}
			};
			request.open('GET',url, true);
			request.send(null);
		}
		
		

	</script>

</body>
</html>