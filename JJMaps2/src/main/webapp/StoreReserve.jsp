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
<div>
		<h2>예약확인</h2>
		<button id="listBtn" onclick="loadReserve()">예약 조회하기</button>
		<table>
			<tbody>
				<tr>
					<th>주문순번</th>
					<th>예약자</th>
					<th>예약시간</th>
					<th>픽업시간</th>
					<th>메뉴</th>
					<th>수량</th>
					<th>삭제</th>
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
		url: "StoreReservation",
		method: "POST",
		data:{"rd_Id":rd_Id,
			"menu_Id":menu_Id,
			"r_Number":r_Number,
			"menu_Cnt":menu_Cnt,
			"menu_Price":menu_Price
		},
		datatype :"Json",
		success : resultJson,
		error : errFun
	})
	}
	function resultJson(data){
		console.log(data);
		var html = "";
		for(var i =0;i<data.length;i++){
			html += "<tr>";
			html += "<td>"+(i+1)+"</td>";
			html += "<td>"+data.documents[i].menu_Id+"</td>";
			html += "<td>"+data.documents[i].r_Number+"</td>";
			html += "<td>"+data.documents[i].menu_Cnt+"</td>";
			html += "<td>"+data.documents[i].menu_Price+"</td>";
			html += "<td><a href='javascript:removeMessage("+data[i].rNumber+");'>삭제</a></td>";
		}
		$("#Reservation").html(html);
	}
	function errFun(request,error){
		console.log("통신실패ㅜㅜㅜㅜㅜㅜㅠ");
		console.log("code:"+request.status+"\n"+"message"+request.responseText+"\n"+"error:" +error);
	}
</script>
</html>