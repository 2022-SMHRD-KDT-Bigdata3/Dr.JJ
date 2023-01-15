<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.model1.ReservationVO"%>
<%@page import="com.smhrd.model1.StoreVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="assets/css/storedtail.css" />
<title>Basket.html</title>
</head>
<body>
	<!-- 헤더 -->
	session.setAttribute("reserve_store_id",store_Id );
	session.setAttribute("reserve_menu_id",reserve_list );
	session.setAttribute("reserve_menu_cnt", menu_Cnt_list);

	<%	ReservationVO Storeinfo = (ReservationVO) session.getAttribute("ReservationVO");	%>
	<%	ArrayList<Long> reserve_menu_id = (ArrayList<Long>) session.getAttribute("reserve_menu_id");	%>
	<%	ArrayList<Long> reserve_menu_cnt = (ArrayList<Long>) session.getAttribute("reserve_menu_cnt");	%>
	<div id="logo">
		<a onClick='location.href="Main.jsp"'>쩝쩝여지도</a><br>
	</div>
<div class='head' id="logo">
			<a onClick='location.href="Main.jsp"'>쩝쩝여지도</a><br>
		</div>
		<div class='head head_left'>
			<%
			if (info != null) {
				if (info.getUser_Code().equals("1")) {
				out.print("<a class=' head_text' href='Mystore.jsp'>오늘영업</a>");}
				out.print("<a class=' head_text' id='mypage' href='Mypage.jsp'>마이페이지</a></li>");
				out.print("<a class=' head_text' id='logout' href='LogoutService'>로그아웃</a></li>");

				// smart 1234 -> usercode 0(일반이용자)
				// ssss 1234 -> usercode 1(점포이용자)

			} else {
				out.print("<a class='head_text' id='login' href='Login.jsp'>로그인</a></li>");
				out.print("<a class='head_text' id='join' href='Join.jsp'>회원가입</a></li>");
			}
			%> 
			</div>
	<header>
		<div id="Title">장바구니</div>

	</header>

	<div class="box_dashed">
		<div>
			<ul>
				<li class="alram">접수가 완료되면 어렵 블라블라</li>
				<li class="alram">할말을 쓰자 블라블라</li>
			</ul>
		</div>
	</div>

	<hr width="100%" color="black">
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<!-- 장바구니에 음식이 없을 때(단 음식점은 한 곳에서만 가능) -->
	<div class="basket">
		<a>장바구니가 비어있습니다.</a>
	</div>

	<!-- 장바구니에 음식이 있을 때(단 음식점은 한 곳에서만 가능) -->

	<div class="basket">
		<ul class="basket-list">
			<li class="basket-item"><input type="checkbox"></input>
				<div class="item">주문</div>
				<div class="item-dtail">주문 상세설명</div>
				<div class="item-price">주문 가격</div></li>

		</ul>

	</div>



	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<div class="del">
		<button>주문전체취소</button>
		<button>주문선택취소</button>


	</div>
	<br>
	<footer id="footer">@JJUPJJUPBAKSA</footer>
</body>
</html>