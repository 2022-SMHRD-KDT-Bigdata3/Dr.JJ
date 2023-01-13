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
	
	<div class="menu">
		<div id="logme" class="menus">
		<ul>
	
			<%
			if (info != null) {
				if (info.getUser_Code().equals("1")) {
					out.print("<a href='Mystore.jsp'>오늘영업</a>");
				}
				out.print("<a id='mypage' href='Mypage.jsp'>마이페이지</a>");
				out.print("<a id='review' href='writeReview.jsp'>리뷰(테스트중 잘못건드리면 톰캣날아감)</a>");
				out.print("<a id='logout' href='LogoutService'>로그아웃</a>");

				// smart 1234 -> usercode 0(일반이용자)
				// ssss 1234 -> usercode 1(점포이용자)

			} else {
				out.print("<a id='login' href='Login.jsp'>로그인</a>");
				out.print("<a id='join' href='Join.jsp'>회원가입</a>");
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
	
	
	<%if(searchWord==null||searchWord.equals("")){ %>
	<span>입력한 검색어가 없습니다..</span>
	<%}else{ %>
	입력한 검색어 : "<%=searchWord%>"
	<%} %>
	<br>
	<h2>아쉽지만 검색 결과가 없습니다..😢</h2>
	
	
	<a href="Main.jsp"> 메인으로 돌아가기 (혹은 돌아가기 아이콘)</a>

</body>
</html>