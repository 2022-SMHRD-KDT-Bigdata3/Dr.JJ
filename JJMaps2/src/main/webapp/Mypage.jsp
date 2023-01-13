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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
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
	
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		function next() {
		
			Swal.fire({
				   title: '점포이용자가 아닙니다.',
				   text: '점포등록 페이지로 이동할까요?',
				   icon: '',
				   
				   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
				   confirmButtonColor: '#FD6F22', // confrim 버튼 색깔 지정
				   cancelButtonColor: '#0E5049', // cancel 버튼 색깔 지정
				   confirmButtonText: '네', // confirm 버튼 텍스트 지정
				   cancelButtonText: '아뇨', // cancel 버튼 텍스트 지정
				   
				}).then(result => {
				    if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
				    	location.href = "MystoreJoin.jsp";
				    } else if (result.isDismissed) { // 만약 모달창에서 cancel 버튼을 눌렀다면
				    	 location.href = "Mypage.jsp";
				    }
				});
			}
	
	</script>
	
</body>
</html>