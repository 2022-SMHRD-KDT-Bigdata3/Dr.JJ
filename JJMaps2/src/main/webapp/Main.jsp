<%@ page import="com.smhrd.model1.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE HTML>

<html>
<head>
<title>main</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
<meta name="format-detection" content="telephone-no">
<link rel="stylesheet" type="text/css" href="assets/css/jjmain.css">

<style type="text/css">
.search {
  top: 130px;
  position: relative;
  width: 300px;
}

#search_box {
  width:100%;
  height: 25px;
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
  top: 3px;
  right: -7px;
  margin: 0;
}
#logo{
width:230px;
heigh:80px;
left:40%;
display: inline-block;
position: relative;
}
.head{
display: inline-block;}
.head_left{float: right;
padding-top: 30px;}
.head_text{
 display: inline-block;
 padding-right: 10px;

 color: rgb(141, 140, 140);
 letter-spacing :0.009em; 
 font-size: 0.9em;}
</style>



</head>
<body>
	<%
	MemberVO info = (MemberVO) (session.getAttribute("info"));
	%>

	<header>
		<div  id="logo">
			<a>쩝쩝여지도</a> <span id="main_st">당신의 맛있는 지도</span>

		</div>
		<!-- 로그인 여부 판별-->
		<div class='head head_left'>


			<%
			if (info != null) {
				if (info.getUser_Code().equals("1")) {
					out.print("<a class='head_text' href='Mystore.jsp'>오늘영업</a>");
				}
				out.print("<a class='head_text'  id='mypage' href='Mypage.jsp'>마이페이지</a></li>");
				out.print("<a  class='head_text' id='logout' href='LogoutService'>로그아웃</a></li>");

				// smart 1234 -> usercode 0(일반이용자)
				// ssss 1234 -> usercode 1(점포이용자)

			} else {
				out.print("<a class='head_text' id='login' href='Login.jsp'>로그인</a></li>");
				out.print("<a class='head_text' id='join' href='Join.jsp'>회원가입</a></li>");
			}
			%> 

		</div>
	</header>
	
	<div class="Header_Init_Section">
		<div id="header_img">
		
			<form action="Search">

				<div class="search">
				
					<input id="search_box" name="searchWord" type="text" placeholder="     메뉴, 점포명, 지역명  검색 ">
					<input type="image" id="search_img" style="border:none;"
					src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">

				</div>
			</form>
		</div>

	</div>



	<!-- 여기까지 헤더 -->

	
	<br>
	<main>
	<header class="like">
		<div class="love">
			<h2>카테고리</h2>
			
			
		</div>
	</header>
	<div class="button">
			<p class="btn btn-1">붕어빵</p>
			<br>
			<p class="btn btn-1">타코야키</p>
			<br>
			<p class="btn btn-1">호떡</p>
			<br>
			<p class="btn btn-1">순대</p>
			<br>
			<p class="btn btn-1">분식류</p>
			<br>
			<p class="btn btn-1">기타</p>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	</main>
	<footer id="footer">@JJUPJJUPBAKSA</footer>
	
	
	
	
</body>
</html>