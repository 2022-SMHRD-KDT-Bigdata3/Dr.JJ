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
<style>
#switch {
  position: absolute;
  /* hidden */
  appearance: none;
  -webkit-appearance: none;
  -moz-appearance: none;
}
.switch_label {
  position: relative;
  cursor: pointer;
  display: inline-block;
  width: 58px;
  height: 28px;
  background: #fff;
  border: 2px solid #daa;
  border-radius: 20px;
  transition: 0.2s;
}
.switch_label:hover {
  background: #efefef;
}
.onf_btn {
  position: absolute;
  top: 5px;
  left: 5px;
  display: inline-block;
  width: 19px;
  height: 19px;
  border-radius: 20px;
  background: #daa;
  transition: 0.2s;
}
#switch:checked+.switch_label {
  background: #c44;
  border: 2px solid #c44;
}

#switch:checked+.switch_label:hover {
  background: #e55;
}

/* move */
#switch:checked+.switch_label .onf_btn {
  left: 33px;
  background: #fff;
  box-shadow: 1px 2px 3px #00000020;
}
</style>
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
					out.print("<div class='wrapper' align='right'><input type='checkbox' id='switch'><label for='switch' class='switch_label'><span class='onf_btn'></span></label></div>");
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
					<input class="search" name='searchWord' type="text" placeholder="검색어 입력">
					<input class="search" type="submit" value="검색">
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