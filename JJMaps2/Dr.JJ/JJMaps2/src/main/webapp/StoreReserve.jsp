<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.smhrd.model1.ReservationVO"%>
<%@page import="com.smhrd.model1.StoreVO"%>
<%@page import="com.smhrd.model1.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>현재 예약</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no " />
<link rel="stylesheet" type="text/css" href="assets/css/storedtail.css" />
</head>

<style>
th,td {
	width : 200px;
	border-spacing: 30px;
	text-align : center;
	height : 50px;
    }
</style>
<body class="is-preload">
	<div id="logo">
		<a onClick='location.href="Main.jsp"'>쩝쩝여지도</a><br>
	</div>

	<header class="bar">
		<div id="Title">
			<h1>현재 예약</h1>
		</div>
	</header>
<body>
	<%
	MemberVO info = (MemberVO) (session.getAttribute("info"));
	%>
	<%
	ArrayList<ReservationJoinVO> list = (ArrayList<ReservationJoinVO>) request.getAttribute("AllReserve");
	%>
	<%
	MenuDAO mdao = new MenuDAO();
	%>
	<div align="center">
		<table>
			<tbody>
				<tr>
					<th>주문순번</th>
					<th>예약자</th>
					<th>예약시간</th>
					<th>픽업시간</th>
					<th>메뉴</th>
					<th>수량</th>
				</tr>
<tr>
				<%
				for (int i = 0; i < list.size(); i++) {
				%>
				
					<td><%=i + 1%></td>
					<td><%=list.get(i).getUser_Id()%></td>
					<td><%="\t"+list.get(i).getR_time()%></td>
					<td><%=list.get(i).getP_time()%></td>
					<td><%=mdao.select_name(list.get(i).getMenu_Id())%></td>
					<td><%=list.get(i).getMenu_Cnt()%></td>

				</tr>
				<%
				}
				%>
			</tbody>

		</table>
	</div>



</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	// 	function loadReserve(){
	// 	$.ajax({
	// 		url: "StoreReservation",
	// 		method: "POST",
	// 		datatype :"Json",
	// 		success : resultJson,
	// 		error : errFun
	// 	});
	// 	}
	// 	function resultJson(data){
	// 		console.log(data);
	// 		var html = "";
	// 		for(var i =0;i<data.length;i++){
	// 			html += "<tr>";
	// 			html += "<td>"+(i+1)+"</td>";
	// 			html += "<td>"+data[i].menu_Id+"</td>";
	// 			html += "<td>"+data[i].r_Number+"</td>";
	// 			html += "<td>"+data[i].menu_Cnt+"</td>";
	// 			html += "<td>"+data[i].menu_Price+"</td>";
	// 			html += "<td><a href='javascript:removeMessage("+data[i].rNumber+");'>삭제</a></td>";
	// 		}
	// 		$("#Reservation").html(html);
	// 	}
	// 	function errFun(request,error){
	// 		console.log("통신실패ㅜㅜㅜㅜㅜㅜㅠ");
	// 		console.log("code:"+request.status+"\n"+"message"+request.responseText+"\n"+"error:" +error);
	// 	}
</script>
</html>