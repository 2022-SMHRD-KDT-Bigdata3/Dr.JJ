<%@page import="com.smhrd.model1.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="assets/css/storedtail.css" />
<title>Mypage</title>
</head>
<body>
	<!-- 헤더 -->

	<div id="logo">
		<a onClick='location.href="Main.jsp"'>쩝쩝여지도</a><br>
	</div>

	<%
	MemberVO info = (MemberVO) (session.getAttribute("info"));
	%>


	<header>
		<div id="Title">마이페이지</div>
	</header>

	<br>
	<br>

	<div class="info">

		<div class="box" style="background: #bdbdbd;">
			<img class="profile">
		</div>
		<br>
		<div id=null>
		<strong> <span><%=info.getUser_Nick()%>
				님</span> </span> <a id="id">(<%=info.getUser_Id()%>)</a>
		</strong> <br> <br> <a id="pass" href="#">비밀번호 변경</a> <a id="pass"
			href="#">프로필 사진수정</a> <br> <br></div>
		<hr width="100%" color="black">




		<div class="button">
			<p class="btn btn-1" onClick='location.href="Reserve1.jsp"'>현재 예약
				보기</p>
			<br>
			<p class="btn btn-1">내 주문내역 보기</p>
			<br>
			<p class="btn btn-1" onClick='location.href="Myreview"'>내 리뷰
				보기</p>
			<br>
			<%
			if (info.getUser_Code().equals("0")) {
			%>
			<p class="btn btn-1" name="0" onclick="next()">내 점포</p>
			<br>
			<%
			} else {
			%>
			<p class="btn btn-1" name="1" onClick='location.href="Mystore.jsp"'>내
				점포</p>
			<br>
			<%
			}
			%>
		</div>


	</div>

	</strong>

	<script>
		function next() {
			if (confirm("점포이용자가 아닙니다. \n점포등록 페이지로 이동할까요?")) {
				location.href = "MystoreJoin.jsp";
			}
		}
	</script>


	<footer id="fix" onClick='location.href="Basket.jsp"'>
		<div id="myr">장바구니</div>
	</footer>
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