<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.smhrd.model1.ReserveDetailsVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.smhrd.model1.ReservationVO"%>
<%@page import="com.smhrd.model1.StoreVO"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>현재 예약</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no " />
<link rel="stylesheet" type="text/css" href="assets/css/storedtail.css" />
<style type="text/css">
table.type04 {
    border-collapse: separate;
    width: 100%;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    margin : 20px 10px;
  }
  table.type04 th {
    width: 40%;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    padding-left: 20px;
    border-bottom: 1px solid #ccc;
  }
  table.type04 td {
    width: 100%;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
  }
  table.type05 {
    border-collapse: separate;
     width: 100%;
    border-spacing: 1px;
    text-align: center;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    margin : 20px 10px;
  }
  table.type05 th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
  }
  table.type05 td {
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
  }
  #mainBody{max-width: 600px;
  min-width: 300px;
  			 text-align: center;
  			     margin-left: auto;
    margin-right: auto;}
  </style>
</head>


<body class="is-preload">
	<%
	ReservationVO now_reserve = (ReservationVO) session.getAttribute("now_reserve");
	ArrayList<ReserveDetailsVO> now_reserve_menu = (ArrayList<ReserveDetailsVO>) session.getAttribute("now_reserve_menu");
	ArrayList<String> now_menu_Name_list = (ArrayList<String>) session.getAttribute("now_menu_Name_list");
	StoreVO now_reserve_store = (StoreVO) session.getAttribute("now_reserve_store");%>
	<div id="logo">
		<a onClick='location.href="Main.jsp"'>쩝쩝여지도</a><br>
	</div>

	<header class="bar">
		<div id="Title">
			<h1>현재 예약</h1>
		</div>
	</header>
	<br>
	<br>
	<br>
<div id="mainBody">
<%if(now_reserve==null || now_reserve.getIsCooking()==0 ){ %>

현재 주문한 예약이 없습니다😓<br>
<a href="Main.jsp">주문하러 가기</a>
<%}else{ %>


<input type="hidden" id="p_Time" value="<%=now_reserve.getP_time()%>" >
<input type="hidden" id="r_Time" value="<%=now_reserve.getR_time()%>" >
<input type="hidden" id="c_Time" value="<%=now_reserve_store.getCook_time()%>" >
<br>
	<br>
<h4>주문 진행 현황</h4>
		<div class="bar-container">
			<!-- value 값이 시간에 따라 증가하는 형식으로 코드를 짜봐야할 것 같습니당 -->
			<progress class="progressTag" id="progress" value="0" max="100"></progress>
		</div>
		<p id=progress_text></p><br><br>



<table class="type04">

<%	  Date nowTime = new Date(); 
SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일  "); 
SimpleDateFormat rn = new SimpleDateFormat("yyyyMMdd"); 
String today=sf.format(nowTime).toString();
String rnum=rn.format(nowTime).toString();
%>
        <tr>
          <th scope="column">
	          <span>주문 번호</span><br>
	          <span>주문 시간</span><br>
	          <span>픽업 시간</span>
          </th>
          <td>
	          <span><%=rnum%>_<%=now_reserve.getR_number() %></span><br>
	          <span><%=today %> <%=now_reserve.getR_time()%></span><br>
	          <span><%=today %> <%=now_reserve.getP_time()%></span>
          </td>
        </tr>
        
        <tr>
          <th scope="column">
	          <span>점포 이름</span><br>
	          <span>점포 위치</span><br>
	          <span>점포 연락처</span>
          </th>
          <td>
	          <span><%=now_reserve_store.getStore_Name()%></span><br>
	          <a href="https://map.kakao.com/link/roadview/<%=now_reserve_store.getLatitude()%>,<%=now_reserve_store.getLongitude()%>"><%=now_reserve_store.getStore_Addr()%></a><br>
	          <span><%=now_reserve_store.getStore_Tel()%></span>
          </td>
        </tr>
 </table>
 
 <table class="type05">
  <tr>
          <th>메뉴</th> <th>가격</th> <th>주문 수량</th> 
        </tr>
 <%
	int total=0;

	for (int i=0; i<now_menu_Name_list.size();i++){ 
		
	String menu_name = now_menu_Name_list.get(i);
	int price = now_reserve_menu.get(i).getMenu_Price();
	Long cnt= now_reserve_menu.get(i).getMenu_Cnt();
	total += (price*cnt);%>
	 <tr>
          <td><%=menu_name%></td><td><%=price%> 원</td><td><%=cnt%>개</td>
     </tr>
	
	<%}%>
</table>


    <table class="type04">
        <tr>
          <th scope="column">총 주문 금액</th>
          <td><%=total %> 원</td>
        </tr>
      </table>


		<div>
			<div class="box_login">
				<ul>
					<li id="null" style="color: #FD6F22; font-weight: bold;">
					조리가 시작된 메뉴는 주문 수정 및 취소가 어렵습니다.</li>
					<li class="little2">부득이한 상황시 점포와 직접 통화하시기 바랍니다.</li>
				</ul>
			</div>
		</div>
		

<%} //else 닫는 괄호%>
</div>
	<footer id="footer">@JJUPJJUPBAKSA</footer>
	
	
	
	
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		
	<script> // 프로그래스 바 
	
	var time = 60000; //1초(1000) * 60
	setInterval("tag()", time);
	
    function tag () {

        let ptime =$('#p_Time').val();
        console.log(ptime);
        ptime=(Number(ptime.substring(0,2)))*60 + Number(ptime.substring(3));//픽업시간 계산
        
        let rtime =$('#r_Time').val();
        console.log(rtime);
        rtime=(Number(rtime.substring(0,2)))*60 + Number(rtime.substring(3)); //예약시간 계산
        
        var today = new Date();   
        var hours = ('0' + today.getHours()).slice(-2); 
        var minutes = ('0' + today.getMinutes()).slice(-2);
        console.log(hours+":"+minutes);
        let now_Time =(Number(hours))*60 + Number(minutes); //현재시간 계산
        console.log(now_Time);
        
        let cTime =$('#c_Time').val();
        cTime=Number(cTime);//조리준비시간


        let prograss_fulltime = (ptime-rtime);
        console.log("전체 과정 : "+prograss_fulltime);
        let ing_time=(now_Time-rtime);
        console.log("지나간 시간"+ing_time);
	    let prograss_per = (ing_time /prograss_fulltime)*100 ;
        console.log("현재 몇 퍼"+prograss_per);

        let progress = document.querySelector('.progressTag');

        
            progress.value = prograss_per;
            if ( progress.value < progress.max){
                	console.log("ptime :"+ptime+ " now_Time : "+now_Time + "p-now:"+(ptime - now_Time));
                	console.log("cTime :"+cTime);
                if((prograss_fulltime - ing_time)>cTime){
                    $('#progress_text').text("예약 접수 완료! 픽업 잊지마세요😉"+now_Time);
                }else if((prograss_fulltime - ing_time)>0){
                    $('#progress_text').text("사장님이 열심히 조리중💦💦"+now_Time);                    
                }else{
                    $('#progress_text').text("픽업이 완료되었습니다😊");
                }

            } else { 
            progress.value = progress.max;
                    $('#progress_text').text("픽업이 완료되었습니다😊");
            }
      
    }

tag()
</script>
	</body>
</html>