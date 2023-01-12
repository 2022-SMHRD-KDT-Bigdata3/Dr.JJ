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

</head>
<body>
	<%
	MemberVO info = (MemberVO) (session.getAttribute("info"));
	%>

	<header>
		<div id="logo">
			<a>쩝쩝여지도</a> <span id="main_st">당신의 맛있는 지도</span>

		</div>
		<!-- 로그인 여부 판별-->
		<div class="menu">


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

		</div>
	</header>
	<br>
	<div class="Header_Init_Section">
		<div id="header_img">
			<form action="Search">

				<div>
					<input class="search" type="text" placeholder="검색어 입력">

				</div>
			</form>
		</div>

	</div>



	<!-- 여기까지 헤더 -->

	<div id="cate" class ="cate">
		<a onclick='location.href="#"'>붕어빵</a> <a onclick='location.href="#"'>붕어빵</a>
		<a onclick='location.href="#"'>붕어빵</a> <a onclick='location.href="#"'>붕어빵</a>
		<a onclick='location.href="#"'>붕어빵</a> <a onclick='location.href="#"'>붕어빵</a>
		<a onclick='location.href="#"'>붕어빵</a> <a onclick='location.href="#"'>붕어빵</a>
		<a onclick='location.href="#"'>붕어빵</a> <a onclick='location.href="#"'>붕어빵</a>
		<a onclick='location.href="#"'>붕어빵</a> <a onclick='location.href="#"'>붕어빵</a>
		<a onclick='location.href="#"'>붕어빵</a> <a onclick='location.href="#"'>붕어빵</a>



	</div>
	<br>

	<div class="map_wrap">
		<div class="map"></div>
	</div>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<footer id="footer">@JJUPJJUPBAKSA</footer>
</body>
</html>