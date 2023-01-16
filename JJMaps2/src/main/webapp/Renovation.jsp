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
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />


<style type="text/css">
.btnCalc {width: 20px; height:20px;
display: inline-flex;
align-items:center; 
justify-content: center;}
.hidden{display:none}
.numOut{width: 15px;
 text-align: center;}


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
     padding-right: 20px;
    text-align: right;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
  }
  #mainBody{max-width: 800px;
  min-width: 300px;
  			 text-align: center; 
  			     margin-left: auto;
    margin-right: auto;}
    #pic_div{
     text-align: center;
    width:100px;
    height:100px;
     border-radius: 20px;
     border: 0.1em solid  rgb(185, 185, 185);
    }
.head{
display: inline-block;}
.head_left{float: right;
padding-top: 11px;}
.head_text{
 display: inline-block;
 padding-right: 10px;
 color: rgb(141, 140, 140); 
 letter-spacing :0.009em; 
 font-size: 0.9em;}

</style>
</head>



<body class="menu_count">

	<%	MemberVO info = (MemberVO) (session.getAttribute("info"));	%>
	<%	StoreVO store_info = (StoreVO) request.getAttribute("store_info");	%>
	<%	ArrayList<MenuVO> menu_info = (ArrayList<MenuVO>) request.getAttribute("menu_info");	%>


	
	<div class='head' id="logo">
			<a onClick='location.href="Main.jsp"'>쩝쩝여지도</a><br>
		</div>
		<div class='head head_left'>
			<%
			if (info != null) {
				out.print("<a class=' head_text' id='mypage' href='Mypage.jsp'>마이페이지</a></li>");
				out.print("<a class=' head_text' id='logout' href='LogoutService'>로그아웃</a></li>");

			}
			%> 
			</div>
	

	<header class="bar">
		<div id="Title">
			<h1>예약하기</h1>
		</div>
		
	</header>

<br>
<br>
<br>

	<div class="info" style="   margin-left: auto;
    margin-right: auto;
    text-align: center;">
		
	<img style="width=1px;"src="https://cdn-icons-png.flaticon.com/128/8339/8339313.png">
	<br><br>
	<span class="inline" style="font-size: 0.94em;display: block; color:rgb(141, 140, 140);">Category | <%=store_info.getStore_Cate() %></span><br>
	<div class="inline" id="null" style="max-width:800px;min-width:300px;height: 70px;">	<span style="height: 2px; display: block; font-size: 1.8em; font-weight: bold; "><%=store_info.getStore_Name() %></span></div>
	<a  href="https://map.kakao.com/link/roadview/<%=store_info.getLatitude()%>,<%=store_info.getLongitude()%>">

	<div class="inline">
	<span class="material-symbols-outlined" style=" display:inline-block; color:rgb(70, 70, 70);top:10px;">location_on</span>
	<span  style="font-size: 1em; height: 20px; display: inline-block; font-weight: bold;color:rgb(70, 70, 70);"><%=store_info.getStore_Addr() %></span></a><br>
	</div><br>
		</div>



	<form class="form" action="reserveInsert"  method="post">
		<input class="hidden" name="store_Id" value="<%=store_info.getStore_Id()%>" type="text" >
		<input class="hidden" name="user_Id" value="<%=info.getUser_Id()%>" type="text">
		

		<h4 class="menu">MENU</h4>
<div id="mainBody">
		<!--메뉴수량 선택-->
		<table class="type05">

      
			<%for (int i = 0; i < menu_info.size(); i++) {%>
			<tr>
			
				<input id="reserve_Check<%=i%>" class="hidden" name="reserve_list" type="checkbox" readonly="readonly" value="<%=menu_info.get(i).getMenu_Id()%>">
				<td><span style=" height: 110px ; display: table-cell; vertical-align: middle"><%=(i + 1)%></span></td>
				<td><div id="pic_div" style=" height: 110px ; display: table-cell; vertical-align: middle;">
				<%=menu_info.get(i).getMenu_Pic1() %></div></td>
				<td><span class="menu_name" style="color: rgb(32, 32, 32); font-size: 1.05em; font-weight: bold; "><%=menu_info.get(i).getMenu_Name()%></span><br>
				<span style="color: rgb(141, 140, 140); font-size: 0.8em;"><%=menu_info.get(i).getMenu_details()%></span>
				<span style="height: 12px; display: block;"><br></span>
				
				가격 : <span id="menuPrice<%=i%>"><%=menu_info.get(i).getMenu_Price()%></span>원<br>
				
					<button id="btnMinus<%=i%>" class="btnMinus btnCalc" type="button" onclick="down1('<%=i%>')">-</button>
					<input id="numOut<%=i%>" class="numOut " name="food_count" value="0" >
					<button id="btnPlus<%=i%>" class="btnPlus btnCalc" type="button" onclick="up1('<%=i%>')">+</button>
				</td>
			</tr>
			<%}%>
 
		</table>
	


		<hr style="border: solid 1px  #FD6F22;">
		<div class="total_price">
			<span style="display: block; padding-top: 10px; font-size: 1em; font-weight: bold; " >현재 주문 금액 : <span id="total">0</span>원</span><br>
		</div>
		
		<!--시간 계산 -->
		<% 
		   //현재 시간 계산
		   Date nowTime = new Date(); 
		   SimpleDateFormat sf = new SimpleDateFormat("HH:mm");
		   String time=sf.format(nowTime).toString();
		   int now_h = Integer.parseInt(time.substring(0, 2));
		   int now_m = Integer.parseInt(time.substring(3)); 
		   int now=((now_h*60)+now_m);
		   
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
			<input id="p_time" name="p_time" type = "time" 
			min="<%=opne_h%>:<%=opne_m%>" 
			max="<%=close_h%>:<%=close_m%>" name="p_time"> 에 가지러 갈게요<br>
				<span style="display: block; padding-top: 11px;color: rgb(141, 140, 140); font-size: 0.93em;">픽업 가능 시간은
				<%=opne_h%>:<%=opne_m<10?"0"+opne_m:opne_m%>부터  
				<%=close_h%>:<%=close_m<10?"0"+close_m:close_m%> 까지 입니다.</span> 
		<%}else{
			now=now + store_info.getCook_time();
			now_m = now % 60;
			now_h = (now - now_m)/60;%>
			<input id="pic_OK_opne" type="hidden" value="<%=now%>" >
			<input id="pic_OK_close" type="hidden" value="<%=((close_h*60)+close_m)%>" >
			<input id="p_time" name="p_time" type = "time" 
			min="<%=now_h%>:<%=now_m%>" 
			max="<%=close_h%>:<%=close_m%>" name="p_time"> 에 가지러 갈게요<br>
				<span style="display: block; padding-top: 11px;color: rgb(141, 140, 140); font-size: 0.93em;">픽업 가능 시간은
				<%=now_h%>:<%=now_m<10?"0"+now_m:now_m%> 부터 
				<%=close_h%>:<%=close_m<10?"0"+close_m:close_m%> 까지 입니다.</span>
		
		<%}%>
		
		<br><br>
		<input type="submit" value="예약하기" 
		style="font-size: 1.3em; font-weight: bold; ">

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