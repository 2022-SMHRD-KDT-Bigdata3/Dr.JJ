
/**
 * 운행 경로 추가
 * @param : 운행 경로 정보
 *    
 */
var paths;
function drawRouteOnMap(routeStopArr) { //경로 정보가 저장된 Array 
 paths.setMap(null); // 이전경로를 삭제
 
 routeStopArr = routeStopArr.reverse(); // 이전에 reverse 되어서 넘어옴 
 if(routeStopArr.length > 0){//위도와 경도 정보가 array로 넘어온다면 필요 x
  var pointList = []; //경로저장  Array 
  for(var i=0; i < routeStopArr.length; i++){
   var stop = routeStopArr[i];      
 
   //구글에서 사용하는 좌표가 아니므로 변경하는 부분(필요 x)
   var bb = top.KaTechToWgs84New(stop.COORD_KATEC_Y, stop.COORD_KATEC_X);
 
   pointList.push({lat: bb.la, lng: bb.lo}); //경로를 위한 정보   
  }    
  
  paths = new google.maps.Polyline({ //경로 정보
           path: pointList,
           geodesic: true,
           strokeColor: 'red',
           strokeOpacity: 1.0,
           strokeWeight: 3.0,
           icons : [{ //방향을 알기 위한 화살표 표시
            icon : {path : google.maps.SymbolPath.BACKWARD_CLOSED_ARROW}
    , offset  : '100%'
    , repeat : '100px'
           }]
     });
  paths.setMap(map);//경로를 그려야 하는 map object를 주면 된다.  
 }
}
 
/**
 * 운행경로 삭제
 * @param  :
 *    
 */
function removeRoute(){
 if(typeof paths !== 'undefined'){
  paths.setMap(null);
 }
}
 
