<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.smhrd.model1.ReservationVO"%>
<%@page import="com.smhrd.model1.StoreVO"%>
<%@page import="com.smhrd.model1.MemberVO"%>
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

<body>
	<% MemberVO info = (MemberVO)(session.getAttribute("info"));%>
	<% StoreVO Storeinfo = (StoreVO)(session.getAttribute("Storeinfo")); %>
<div>
		<h2>예약확인</h2>
		<button id="listBtn">예약 조회하기</button>
		<table>
			<tbody>
				<tr>
					<td>주문순번</td>
					<td>예약자</td>
					<td>예약시간</td>
					<td>픽업시간</td>
					<td>메뉴</td>
					<td>수량</td>
					<td>삭제</td>
				</tr>
			</tbody>
			<tbody id="Reservation">
			</tbody>
		</table>
	</div>



</body>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	function loadReserve(){
	$.ajax({
		url: "StoreReserve",
		method: "POST",
		dataType : "JSON",
		success : resultJson,
		error : errFun
	})
	}
	function resultJson(data){
		console.log(data);
		var html = "";
		for(var i -0;i<data.length;i++){
			html += "<tr>";
			html += "<td>"+(i+1)+"</td>";
			html += "<td>"+data[i].user_id+"</td>";
			html += "<td>"+data[i].rTime+"</td>";
			html += "<td>"+data[i].pTime+"</td>";
			html += "<td>"+data[i].storeMenu+"</td>";
			html += "<td>"+data[i].storePrice+"</td>";
			html += "<td<a href='javascript:removeMessage("+data[i].rNumber+");'>삭제</a></td>";
		}
		$("#Reservation").html(html);
	}
	function errFun(){
		console.log("통신실패ㅜㅜㅜㅜㅜㅜㅠ픂퓨ㅠ퓨ㅠㅍ");
	}
</script>
</html>