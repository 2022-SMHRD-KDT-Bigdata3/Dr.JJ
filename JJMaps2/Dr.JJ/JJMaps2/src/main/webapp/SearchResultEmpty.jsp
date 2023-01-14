<%@page import="com.smhrd.model1.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
span{color:gray;}
</style>
<link rel="stylesheet" type="text/css" href="assets/css/storedtail.css" />
</head>


<body class="is-preload">
<%MemberVO info = (MemberVO) (session.getAttribute("info"));%>
	<% String searchWord=(String)request.getAttribute("searchWord");%>
	
	
	
<div id="logo">
		<a onClick='location.href="Main.jsp"'>쩝쩝여지도</a><br>
	</div>	
	
	<div class="emote">
		<div id="logme" class="menus">
		<ul>
	
			<%
			if (info != null) {
				if (info.getUser_Code().equals("1")) {
					out.print("<a href='Mystore.jsp'>오늘영업</a>");
				}
				out.print("<li><a id='mypage' href='Mypage.jsp'>마이페이지</a></li>");
				out.print("<li><a id='logout' href='LogoutService'>로그아웃</a></li>");

				// smart 1234 -> usercode 0(일반이용자)
				// ssss 1234 -> usercode 1(점포이용자)

			} else {
				out.print("<li><a id='login' href='Login.jsp'>로그인</a></li>");
				out.print("<li><a id='join' href='Join.jsp'>회원가입</a></li>");
			}
			%> 
	
		</ul>
</div>
	<header class="bar">
		<div id="Title">
			<h1>검색 결과</h1>
		</div>
	</header>
	
	
	
	<br>
	<br>
	
		<form class="form">
	<%if(searchWord==null||searchWord.equals("")){ %>
	<br><br><br>
		<h2>아쉽지만 검색 결과가 없습니다..😢</h2>
	<%}else{ %>
	<br><br><br><br>
	입력한 검색어 : "<%=searchWord%>"
	<%} %>
	<br><br>	
	<br><br>
	<h2>아쉽지만 검색 결과가 없습니다..😢</h2><br><br><br>
	<div id="logo">
		<a onClick='location.href="Main.jsp"'>쩝쩝여지도</a><br>
	</div>	
	<button type="button" class="navyBtn" onClick="location.href='Main.jsp'">메인으로 돌아가기</button>
</form>
</body>
</html>