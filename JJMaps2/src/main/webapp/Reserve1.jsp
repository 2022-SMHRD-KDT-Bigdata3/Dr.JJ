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
</head>


<body class="is-preload">
	<%
	ReservationVO now_reserve = (ReservationVO) session.getAttribute("now_reserve");
	ArrayList<ReserveDetailsVO> now_reserve_menu = (ArrayList<ReserveDetailsVO>) session.getAttribute("now_reserve_menu");
	ArrayList<String> now_menu_Name_list = (ArrayList<String>) session.getAttribute("now_menu_Name_list");
	StoreVO now_reserve_store = (StoreVO) session.getAttribute("now_reserve_store");%>
	<%= now_reserve.getStore_Id()%>
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

<%if(now_reserve==null || now_reserve.getIsCooking()==0 ){ %>

현재 주문한 예약이 없습니다😓<br>
<a href="Main.jsp">주문하러 가기</a>
<%}else{ %>
	<h1><%=now_reserve_store.getStore_Name()%></h1>
	<h3><%=now_reserve_store.getStore_Addr()%></h>

<input type="hidden" id="p_Time" value="<%=now_reserve.getP_time()%>" >
<input type="hidden" id="r_Time" value="<%=now_reserve.getR_time()%>" >
<input type="hidden" id="c_Time" value="<%=now_reserve_store.getCook_time()%>" >
		<div >
			<!-- value 값이 시간에 따라 증가하는 형식으로 코드를 짜봐야할 것 같습니당 -->
			<progress id="progress" value="0" max="100"></progress>
		</div>
		<p id=progress_text>사장님이 열심히 조리중💦💦</p><br><br>

<form class="form">


<h5>주문 메뉴와 수량</h5>
	<%
	int total=0;

	for (int i=0; i<now_menu_Name_list.size();i++){ 
		

	String menu_name = now_menu_Name_list.get(i);
	int price = now_reserve_menu.get(i).getMenu_Price();
	Long cnt= now_reserve_menu.get(i).getMenu_Cnt();
	total += (price*cnt);%>
	
	<span>주문 메뉴 : <%=menu_name%> (<%=price%> 원) -- <%=cnt%>개 </span>
	
	<%}%>

<span>총 주문 금액: <%=total %></span>

		<div>
			<div class="box_login">
				<ul>
					<li id="null" style="color: #FD6F22; font-weight: bold;">
					조리가 시작된 메뉴는 주문 수정 및 취소가 어렵습니다.</li>
					<li class="little2">부득이한 상황시 점포와 직접 통화하시기 바랍니다.</li>
				</ul>
			</div>
		</div>
		
		
		
		
</form>

<%}%>
	<footer id="footer">@JJUPJJUPBAKSA</footer>
	
	
	
	
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		
	<script type="text/javascript">
		$(function() {
			 let ptime =$('#p_Time').val();
        	 	console.log('ptime 원본:'+ptime);
        	 let ptime_h=Number(ptime.substring(0,2));
        		 console.log('ptime 시:'+ptime_h);
        	 let ptime_m=Number(ptime.substring(3));
        	 	console.log('ptime 분:'+ptime_m);
        	 let ptime=(ptime_h*60)+ptime_m;
        	 	console.log('ptime 총 분:'+ptime);
        	 	
   			 let rTime =$('#r_Time').val();
     	 		console.log('rtime 원본:'+rTime);
	     	 let rtime_h=Number(rTime.substring(0,2));
	     		 console.log('rtime 시:'+rtime_h);
	     	 let rtime_m=Number(rTime.substring(3));
	     	 	console.log('rtime 분:'+rtime_m);
	     	 let rtime=(rtime_h*60)+rtime_m;
	     	 	console.log('rtime 총 분:'+rtime);
				
   			 let cTime =$('#c_Time').val();
   			cTime=Number(cTime);
			
			
			timer = setInterval(function() { 
				$.ajax({
					url : "Timer",
					method : "POST",   //  데이터 전송 방식
					data : {"ptime": ptime ,"rtime":rtime}, //데이터를 보냄
					dataType : "JSON", // 결과 데이터를 받기
					cache : false,
					success : function(data) {
						 $("#progress").val(data.prograss[0]);
						 
						let prograss_min= data.prograss[1];
						if(prograss_min>=cTime){
							
					  $("#progress_text").text("예약 접수 완료! 픽업 잊지마세요😉");
						}else if(prograss_min>0){
					  $("#progress_text").text("사장님이 열심히 조리중💦💦");
							
						}else{
					  $("#progress_text").text("픽업이 완료되었습니다😊");
						}
					}
				});

			}, 10000); //10000 ->10초 1000->1초

		});
	</script>
	</body>
</html>