<%@page import="com.smhrd.model1.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.model1.MenuVO"%>
<%@page import="com.smhrd.model1.StoreVO"%>
<%@page import="com.smhrd.model1.ReviewDAO"%>
<%@page import="com.smhrd.model1.ReviewVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>jj login</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
<meta name="format-detection" content="telephone-no">
<link rel="stylesheet" type="text/css" href="assets/css/storedtail.css" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

</head>
<body>


	<%	MemberVO info = (MemberVO)session.getAttribute("info");	%>

	<%	StoreVO store_info=(StoreVO)request.getAttribute("store_info");%>
	<%	ArrayList<MenuVO> menu_info=(ArrayList<MenuVO>)request.getAttribute("menu_info");%>

	<!-- 헤더영역 -->
	<div id="login_Body">
		<div id="logo">
			<a onClick='location.href="Main.jsp"'>쩝쩝여지도</a><br>
		</div>
	</div>
	<!-- 가게소개 영역 -->

	<header class="bar">
		<div id="Title">
			<h1>
				🧡<%=store_info.getStore_Name() %>🧡
			</h1>
			<div id="sdtail">
				<div>
					<a style="font-size: 20px;"><%=store_info.getStore_Cate() %></a>

				</div>
			</div>
		</div>
	</header>

	<br>
<% String status;
if( store_info.getStore_Status()==0 ){
	status = "영업중";
}else{
	status = "영업중이 아닙니다.";
}%>
	<div id="null">
		<main id="main">
			<br> <br>
			<div class="boxx1">
				<div>카테고리 : <%=store_info.getStore_Cate() %> </div>
				<br>
				<div>위치: <%=store_info.getStore_Addr() %></div>
				<br>
				<div>(영업상태) 및 정보 : <%=status %></div>
				<br>
				<div>전화번호 : <%=store_info.getStore_Tel() %></div>
				<br>
			</div>
		</main>
	</div>
	<br>


	<% Integer store_id = store_info.getStore_Id(); %><br>
	<form class="form">
		<button type="button" class="navyBtn"
			onClick='location.href="ReviewService?store_id=<%=store_id %>"'>리뷰
			쓰기</button>
	</form>
	<br>
	<br>

	<div id="null"></div>
		<main id="main2"><br><br>
			<div class=menu_pic>메뉴</div>
			<br>
			<div>
				<h3>메뉴판</h3>
				<br> <span>(맛있는 메뉴)</span><br>
</div>
</main>
				<table border="1" class="addInput">
					<main id="main2" >
						메인2 (메뉴 및 사진)
						<div><br>
							<h3>메뉴판</h3><br>
							<span>(맛있는 메뉴)</span><br>
							</div>
</table>
				

							<table border="1" class="addInput">
<div>
								<tr>
									<td>번호</td>
									<td>메뉴이름</td>
									<td>가격</td>
									<td>메뉴 설명</td>
								</tr>
								
								<% int i =1;
			for(i=0;i<menu_info.size();i++){  int index =i+1;%>

								<tr id="add_tr<%=i%>">
									<td><%= index %></td>
									<td><%=menu_info.get(i).getMenu_Name()%></td>
									<td><%=menu_info.get(i).getMenu_Price()%>원</td>
									<td><%=menu_info.get(i).getMenu_details()%></td>
								</tr>

								<% } %>

							</table>
</div>
					</main>

						<br>
						<br>
						<br>

						<footer id="fix">

							<form action="StoreDetail" class="form">
						
								<input type="hidden" id="login_check"
									value="<%=info!=null?info.getUser_Id():""%>"> <input
									type="hidden" name="storeId"
									value="<%=store_info.getStore_Id()%>"> <input
									type="hidden" name="send" value="Renovation.jsp">
									<div id="myr">예약하기</div>
							</form>
						</footer>


						<footer id="footer">@JJUPJJUPBAKSA</footer>
						<br>
						<script src="http://code.jquery.com/jquery-latest.min.js"></script>
						<script>
$(document).ready(function() {
    $('.form').submit(function() {
        if ($('#login_check').val()==="") {
        	 Swal.fire({
                 icon: '',
                 title: '',
                 text: '로그인을 해주세요.',
                 confirmButtonColor: '#FD6F22'
             });
            return false;
        }
    }); // end submit()
}); // end ready()

</script>
</body>
</html>