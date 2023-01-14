<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.smhrd.model1.MenuVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.smhrd.model1.MemberVO"%>
<%@ page import="com.smhrd.model1.StoreVO"%>
<!DOCTYPE HTML>
<html>
<head>
<title>예약하기</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
<link rel="stylesheet" type="text/css" href="assets/css/storedtail.css" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>


<style type="text/css">
.btnCalc {width: 15px; height:20px;}
.hidden{display:none}
.numOut{width: 15px;}

</style>
</head>



<body class="menu_count">

	<%	MemberVO info = (MemberVO) (session.getAttribute("info"));	%>
	<%	StoreVO store_info = (StoreVO) request.getAttribute("store_info");	%>
	<%	ArrayList<MenuVO> menu_info = (ArrayList<MenuVO>) request.getAttribute("menu_info");	%>


	<div id="logo">
		<a onClick='location.href="Main.jsp"'>쩝쩝여지도</a><br>
	</div>

	<header class="bar">
		<div id="Title">
			<h1>예약하기</h1>
		</div>
	</header>


	<form class="form" action="reserveInsert"  method="post">
		<input class="hidden" name="store_Id" value="<%=store_info.getStore_Id()%>" type="text" >
		<input class="hidden" name="user_Id" value="<%=info.getUser_Id()%>" type="text">
		<div class="info">
			<div class="info">
				<img src="images/profil_img.jpg"> <br>

				<h2><%=store_info.getStore_Name()%></h2>
				<br>
			</div>
		</div>

		<h4 class="menu">MENU</h4>

		<!--메뉴수량 선택-->
		<table border="1px solid black" width="350px">

			<%for (int i = 0; i < menu_info.size(); i++) {%>
			<tr>
			
				<input id="reserve_Check<%=i%>" class="hidden" name="reserve_list" type="checkbox" readonly="readonly" value="<%=menu_info.get(i).getMenu_Id()%>">
				<td rowspan="3"><%=(i + 1)%></td>
				<td rowspan="3">사진</td>
				<td><H3 class="menu_name"><%=menu_info.get(i).getMenu_Name()%></H3></td>
			</tr>
			<tr>
				<td><span><%=menu_info.get(i).getMenu_details()%></span></td>
			</tr>
			<tr>
				<td>가격 : <span id="menuPrice<%=i%>"><%=menu_info.get(i).getMenu_Price()%></span>원
				</td>
				<td>
					<button id="btnPlus<%=i%>" class="btnPlus btnCalc" type="button" onclick="up1('<%=i%>')">+</button>
					<input id="numOut<%=i%>" class="numOut" name="food_count" value="0" >
					<button id="btnMinus<%=i%>" class="btnMinus btnCalc" type="button" onclick="down1('<%=i%>')">-</button>
				</td>
			</tr>
			<%}%>
 
		</table>


		<hr style="border: solid 1px gray;">
		<div class="total_price">
			<h4>현재 주문 금액 : <span id="total">0</span></h4><br>
		</div>
		
		<!--시간 계산 -->
		<% 
		   //현재 시간 계산
		   Date nowTime = new Date(); 
		   SimpleDateFormat sf = new SimpleDateFormat("HH:mm");
		   String time=sf.format(nowTime).toString();
		   int now_h = Integer.parseInt(time.substring(0, 2));
		   out.print("now_h:"+now_h);//검증 후 삭제
		   int now_m = Integer.parseInt(time.substring(3)); 
		   out.print("now_m:"+now_m);//검증 후 삭제
		   int now=((now_h*60)+now_m);
		   out.print("now:"+now);//검증 후 삭제
		   
		   //개점 시간 계산
		   int opne_h = Integer.parseInt(store_info.getStore_Open_Dt().substring(0, 2));
		   int opne_m = Integer.parseInt(store_info.getStore_Open_Dt().substring(3));
		   int opne=((opne_h*60)+opne_m);

		   // 폐점 시간 계산
		   int close_h = Integer.parseInt(store_info.getStore_Close_Dt().substring(0, 2));
		   int close_m = Integer.parseInt(store_info.getStore_Close_Dt().substring(3));%>


		
		<input id="r_time"  type = "hidden" name="r_time" value="<%= sf.format(nowTime) %>"> 

		<%if(now<opne) {
			opne=opne + store_info.getCook_time();
			opne_m = opne % 60;
			opne_h = (opne - opne_m)/60; %>
			<input id="pic_OK_opne" type="hidden" value="<%=opne%>" >
			<input id="pic_OK_close" type="hidden" value="<%=((close_h*60)+close_m)%>" >
			<h4>픽업 가능 시간 : <span ><%=opne_h%>:<%=opne_m<10?"0"+opne_m:opne_m%>부터  
			<%=close_h%>:<%=close_m<10?"0"+close_m:close_m%> 까지!</span></h4><br>
			<input id="p_time" name="p_time" type = "time" 
			min="<%=opne_h%>:<%=opne_m%>" 
			max="<%=close_h%>:<%=close_m%>" name="p_time">에 가지러 갈게요
		<%}else{
			now=now + store_info.getCook_time();
			out.print("now+Cook_time:"+now);//검증 후 삭제
			now_m = now % 60;
			now_h = (now - now_m)/60;%>
			<input id="pic_OK_opne" type="hidden" value="<%=now%>" >
			<input id="pic_OK_close" type="hidden" value="<%=((close_h*60)+close_m)%>" >
		<h4>픽업 가능 시간 : <span ><%=now_h%>:<%=now_m<10?"0"+now_m:now_m%> 부터 <%=close_h%>:<%=close_m<10?"0"+close_m:close_m%> 까지!</span></h4><br>
			<input id="p_time" name="p_time" type = "time" 
			min="<%=now_h%>:<%=now_m%>" 
			max="<%=close_h%>:<%=close_m%>" name="p_time">에 가지러 갈게요
		
		<%}%>
		
		<br><br><br>
		<input type="submit" value="예약하기" >

		<br> <br>
	</form>
	
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
	function up1(i){
		let num = $('#numOut'+i).val();
		num=Number(num)+1;
		$('#numOut'+i).val(num);
		
		let menuPrice=$('#menuPrice'+i).text();
		menuPrice=Number(menuPrice);
		
		let total=$('#total').text();
		total= Number(total);
		
		$('#total').text(total+menuPrice);
		$('#reserve_Check'+i).prop("checked",true);
	}
	
	
	function down1(i){
		let num = $('#numOut'+i).val();
		if(Number(num)>0){
			num=Number(num)-1;
			$('#numOut'+i).val(num);
			
			let menuPrice=$('#menuPrice'+i).text();
			menuPrice=Number(menuPrice);
			
			let total=$('#total').text();
			total= Number(total);
			
			$('#total').text(total-menuPrice);
		}
		num = $('#numOut'+i).val();
		if(Number(num)==0){
			$('#reserve_Check'+i).prop("checked",false);
		}

	}
	
	 
		
	   $(document).ready(function() {
	        $('.form').submit(function() {
	        	 let ptime =$('#p_time').val();
	        	 console.log('ptime 원본:'+ptime);
	        	  ptime_h=Number(ptime.substring(0,2));
	        	 console.log('ptime 시:'+ptime_h);
	        	  ptime_m=Number(ptime.substring(3));
	        	 console.log('ptime 분:'+ptime_m);
	        	  ptime=(ptime_h*60)+ptime_m;
	        	 console.log('ptime 계산:'+ptime);
	        	 let pic_OK_opne = $('#pic_OK_opne').val();
	        	 console.log('pic_OK_opne:'+pic_OK_opne);
	        	 let pic_OK_close = $('#pic_OK_close').val();
	        	 console.log('pic_OK_close:'+pic_OK_close);
	        	 
	            if ($('#total').text() === '0') {
	            	 Swal.fire({
	                     icon: '',
	                     title: '',
	                     text: '주문할 메뉴를 골라주세요📌',
	                     confirmButtonColor: '#FD6F22'
	                 });
	                return false;
	            }else if(ptime<pic_OK_opne||pic_OK_close<ptime){

	            	 Swal.fire({
	                     icon: '',
	                     title: '',
	                     text: '픽업 시간을 확인해주세요📌',
	                     confirmButtonColor: '#FD6F22'
	                 });

		                return false;
	            };
	        }); // end submit()
	    }); // end ready()

	
	    
        
    </script>
</body>
</html>