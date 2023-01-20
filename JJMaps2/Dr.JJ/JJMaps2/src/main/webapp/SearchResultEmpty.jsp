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
.mainBody{text-align:center;}
.head{
display: inline-flex;}
.head_left{float: right;
padding-top: 12px;}
.head_text{
 display: inline-block;
 padding-right: 10px;

 color: rgb(141, 140, 140);
 letter-spacing :0.009em; 
 font-size: 0.9em;}
 .search {
  position: relative;
  width: 250px;
      margin-left: auto;
    margin-right: auto;
}

#search_box {
  width:100%;
  height: 30px;
  font-size: 15px;
  border: 0;
  border-radius: 40px;
  outline: none;
  padding-left: 10px;
  background-color: rgb(233, 233, 233);
   opacity:0.87;
}

#search_img {
  position : absolute;
  width: 17px;
  top: 8px;
  right: 8px;
  margin: 0;
}
</style>
<link rel="stylesheet" type="text/css" href="assets/css/storedtail.css" />
</head>


<body class="is-preload">
<%MemberVO info = (MemberVO) (session.getAttribute("info"));%>
	<% String searchWord=(String)request.getAttribute("searchWord");%>
	
	
	<div class='head' id="logo">
			<a onClick='location.href="Main.jsp"'>쩝쩝여지도</a><br>
		</div>
		<div class='head head_left'>
			<%
			if (info != null) {
				out.print("<a class=' head_text' id='mypage' href='Mypage.jsp'>마이페이지</a>");
				out.print("<a class=' head_text' id='logout' href='LogoutService'>로그아웃</a>");

			} else {
				out.print("<a class='head_text' id='login' href='Login.jsp'>로그인</a>");
				out.print("<a class='head_text' id='join' href='Join.jsp'>회원가입</a>");
			}
			%> 
			</div>
	

	<header class="bar">
		<div id="Title">
			<h1>검색 결과</h1>
		</div>
	</header>
		
	<br>
	<br>
	<div class="mainBody">
		<form class="form">
	<%if(searchWord==null||searchWord.equals("")){ %>
	<br><br><br>
		<h2>검색어를 입력하지 않으셨습니다 </h2><br>
		<h2>다시 검색해 주세요 😉 </h2>
	<%}else{ %>
	<br><br><br><br>
	입력한 검색어 : "<%=searchWord%>"
	<br><br>
	<h2>아쉽지만 검색 결과가 없습니다..😢</h2><br><br><br>
	<h2>다른 키워드로 검색해주세요 </h2>
	<%} %><br><br><br><br>
	<form action="Search">

				<div class="search">
				
					<input id="search_box" name="searchWord" type="text" placeholder="     메뉴, 점포명, 지역명  검색 ">
					<input type="image" id="search_img" style="border:none;"
					src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">

				</div>
			</form>
			
		<br><br><br>
		혹은
		<br><br><br>
	<button type="button" class="navyBtn" onClick="location.href='Main.jsp'">메인으로 돌아가기</button>
</form>
</body>
</html>