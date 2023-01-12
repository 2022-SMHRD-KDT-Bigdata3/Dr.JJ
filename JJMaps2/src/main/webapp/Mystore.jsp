<%@page import="com.smhrd.model1.MemberVO"%>
<%@page import="java.net.*"%>
<%@page import="java.io.*"%>
<%@page import="java.nio.charset.Charset"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="assets/css/storedtail.css" />		 
</head>
	<body class="is-preload">
	   <% MemberVO info = (MemberVO)(session.getAttribute("info"));%>
				<div id="logo">
				   <a  onClick='location.href="Main.jsp"'>쩝쩝여지도</a><br>
				</div>
	   
   	<header class="h2">
				<div class="pagename">
				   <h1 id="Title">점포 페이지</h1>
				</div>
	</header> 
   
   
   <form class="form">
	
		<div class="button">
			<p class="btn btn-2" onclick="location.href='StoreDetail?user_id=<%=info.getUser_Id()%>'">내 점포 상세 페이지</p>
			<br>
			<p class="btn btn-2" onclick="location.href='MystoreJoin.jsp'">점포 정리 수정</p>
			<br>
			<p class="btn btn-2" onclick='location.href="Menucheck"'>영업정보</p>
			<br>
			<p class="btn btn-2" onClick="next()">점포 삭제</p>
	
	
	</form>
	
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	
	<script>
	
		function next() {
			if (confirm("점포 삭제시 되돌릴 수 없습니다. \n 정말로 삭제하시겠습니까?")) {
				location.href = "StoreDelete";
			} 
		}

	</script>
	
	
<footer id = "footer">@JJUPJJUPBAKSA</footer>  

</body>
</html>