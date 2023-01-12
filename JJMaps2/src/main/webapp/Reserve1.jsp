<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.smhrd.model1.ReservationVO"%>
<%@page import="com.smhrd.model1.StoreVO"%>
<!DOCTYPE html>
<html lang="en">
<head>
		<title>현재 예약</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no " />
		 <link rel="stylesheet" type="text/css" href="assets/css/storedtail.css" />	 
	   </head>


   <body class="is-preload">
		  <div id="logo">
			 <a  onClick='location.href="Main.jsp"'>쩝쩝여지도</a><br>
		  </div>
	   
		  <header class="bar">
				<div id="Title">
				   <h1>현재 예약</h1>
				</div>
		  </header>


	<br>
	<br>
	<br>

	<%
	ReservationVO rNumber = (ReservationVO) session.getAttribute("rNumber");
	StoreVO storeName = (StoreVO) session.getAttribute("storeName");
	StoreVO storeAddr = (StoreVO) session.getAttribute("storeAddr");
	if (rNumber == null) {
	%>
	<div id="conteiner">
		<div id="innerconteiner">
			<div>😢</div>
			<div>현재 예약된 주문이 없습니다</div>
		</div>
	</div><br><br><br><br><br><br><br>
	<form class="form">
		<button type="button" onClick='location.href="Renovation.jsp"'>주문하러 가기</button>
	</form>
	<%
	} else {
	%>
	<h1><%=storeName%></h1>
	<h3><%=storeAddr%></h>

		<div>
			<!-- value 값이 시간에 따라 증가하는 형식으로 코드를 짜봐야할 것 같습니당 -->
			<progress value="0" max="100"></progress>
		</div>

		<p>사장님이 열심히 조리중💦💦</p>


		<div id="conteiner">
			<div id="innerconteiner">
				<div>조리가 시작된 메뉴는 주문 수정 및 취소가 어렵습니다.</div>
				<div>부득이한 상황시 점포와 직접 통화하시기 바랍니다.</div>
			</div>
		</div>
		<%
		}
		%>
		
		
	
		<footer id = "footer">@JJUPJJUPBAKSA</footer>  
	
</body>
</html>