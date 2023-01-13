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

<style type="text/css">
.btnCalc {width: 15px; height:20px;}
</style>
</head>



<body class="menu_count">

	<%	MemberVO info = (MemberVO) (session.getAttribute("info"));	%>
	<%	StoreVO store_info = (StoreVO) request.getAttribute("store_info");	%>
	<%	ArrayList<MenuVO> menu_info = (ArrayList<MenuVO>) request.getAttribute("menu_info");	%>


<<<<<<< HEAD
	</head>
	<%MemberVO info = (MemberVO) (session.getAttribute("info"));
	 StoreVO st_info = (StoreVO)(request.getAttribute("st_info"));
	 %>
	<body class="menu_count">
		<form class= "form" = "reserveInsert" method="post">
=======
	<div id="logo">
		<a onClick='location.href="Main.jsp"'>쩝쩝여지도</a><br>
	</div>
>>>>>>> branch 'master' of https://github.com/2022-SMHRD-KDT-Bigdata3/Dr.JJ.git

	<header class="bar">
		<div id="Title">
			<h1>예약하기</h1>
		</div>
	</header>


	<form class="form" action="reserveInsert" method="post">

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
					<span id="numOut<%=i%>">0</span>
					<button id="btnMinus<%=i%>" class="btnMinus btnCalc" type="button" onclick="down1(<%=i%>)">-</button>
				</td>
			</tr>
			<%}%>
 
		</table>


		<hr style="border: solid 1px gray;">
		<div class="total_price">
			<h4>현재 주문 금액 : <span id="total">0</span></h4>
		

		</div>

		<input class="button" type=submit value="예약하기"><br> <br>
	</form>
	
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
	function up1(i){
		let num = $('#numOut'+i).text();
		num=Number(num)+1;
		$('#numOut'+i).text(num);
		
		let menuPrice=$('#menuPrice'+i).text();
		menuPrice=Number(menuPrice);
		
		let total=$('#total').text();
		total= Number(total);
		
		$('#total').text(total+menuPrice);
		
		
	}
	function down1(i){
		let num = $('#numOut'+i).text();
		if(Number(num)>0){
			num=Number(num)-1;
			$('#numOut'+i).text(num);
			
			let menuPrice=$('#menuPrice'+i).text();
			menuPrice=Number(menuPrice);
			
			let total=$('#total').text();
			total= Number(total);
			
			$('#total').text(total-menuPrice);
		}
		
		
		
	}
	
        
        
    </script>
</body>
</html>