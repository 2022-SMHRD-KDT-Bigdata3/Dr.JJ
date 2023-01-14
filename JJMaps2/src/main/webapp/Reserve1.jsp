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


	<h1><%=now_reserve_store.getStore_Name()%></h1>
	<h3><%=now_reserve_store.getStore_Addr()%></h>

		<div >
			<!-- value 값이 시간에 따라 증가하는 형식으로 코드를 짜봐야할 것 같습니당 -->
			<progress value="0" max="100"></progress>
		</div>

		<p>사장님이 열심히 조리중💦💦</p><br><br>

<form class="form">
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


		<footer id="footer">@JJUPJJUPBAKSA</footer>
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script>
		
	</script>
</body>
</html>