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

<style type="text/css">



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
 
#mainBody{max-width: 600px;
			min-width: 300px;
			text-align: center;
			margin-left: auto;
			margin-right: auto;
			  background: #fff;
  border-radius: 2px;
  display: inline-block;
  height: 300px;
  margin: 1rem;
  position: relative;
 }
.inline{
 display: inline-block;}
 
</style>
</head>
<body>


	<%	MemberVO info = (MemberVO)session.getAttribute("info");	%>

	<%	StoreVO store_info=(StoreVO)request.getAttribute("store_info");%>
	<%	ArrayList<MenuVO> menu_info=(ArrayList<MenuVO>)request.getAttribute("menu_info");%>

	<!-- 헤더영역 -->
	<div id="login_Body">
		<div class='head' id="logo">
			<a onClick='location.href="Main.jsp"'>쩝쩝여지도</a><br>
		</div>
		
	
		
		<div class='head head_left'>
			<%
			if (info != null) {
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
	</div>
	<!-- 가게소개 영역 -->

	<header class="bar">
		<div id="Title">
			<h1>
			
			</h1>
			<div id="sdtail">
				<div>
				

				</div>
			</div>
		</div>
	</header>

	<br>
	<div class="mainBody " >
	<br>
	<img style="width=1px;"src="https://cdn-icons-png.flaticon.com/128/8339/8339313.png">
	<span class="inline" style="font-size: 0.94em;display: block; color:rgb(141, 140, 140);">Category | <%=store_info.getStore_Cate() %></span><br>
	<div class="inline" id="null" style="max-width:800px;min-width:300px;height: 70px;">	<span style="height: 2px; display: block; font-size: 1.8em; font-weight: bold; "><%=store_info.getStore_Name() %></span></div>
	<span class="inline" style="font-size: 1em; height: 70px; display: block; font-weight: bold;color:rgb(70, 70, 70);"><%=store_info.getStore_Addr() %></span><br>
		<div class="star-ratings">
			<div 
		    class="star-ratings-fill space-x-2 text-lg"
		    :style="{ width: ratingToPercent + '%' }"
			>
				<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
			</div>
			<div class="star-ratings-base space-x-2 text-lg">
				<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
			</div>
		</div>	
		
	</div>
	<br>


	<% Integer store_id = store_info.getStore_Id(); %><br>
	<form class="form">
		<button type="button" class="navyBtn"
			onClick='location.href="ReviewService?store_id=<%=store_id %>"'>리뷰
			쓰기</button>
	</form>






<table border="1" class="addInput">

<tr>
	<th>번호</th>
	<th>메뉴이름</th>
	<th>가격</th>
	<th>메뉴 설명</th>
</tr>
</div>
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


							

					

						

		<form action="StoreDetail" class="form">
	
			<input type="hidden" id="login_check"
				value="<%=info!=null?info.getUser_Id():""%>"> <input
				type="hidden" name="storeId"
				value="<%=store_info.getStore_Id()%>"> <input
				type="hidden" name="send" value="Renovation.jsp">
				<div id="myr"><input type="submit" value="예약하기"></div>
		</form>
					

 
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



ratingToPercent() {
    const score = + this.restaurant.averageScore * 20;
    return score + 1.5;
}
</script>
</body>
</html>