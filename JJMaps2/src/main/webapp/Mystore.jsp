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

<body>
   <% MemberVO info = (MemberVO)(session.getAttribute("info")); %>
   
<a href="Storedtail.jsp"><button> 내 점포 상세 페이지 </button></a>
<a href="StoreSelectService"><button> 영업정보 </button></a>
<a href="Menucheck"><button> 메뉴정보 </button></a>
<br><br><br>

<body>
   <% MemberVO info = (MemberVO)(session.getAttribute("info")); %> 
         <div id="login_Body">
			<div id="logo">
			   <a  onClick='location.href="Main.jsp"'>쩝쩝여지도</a><br>
			</div>
   
   
   	<header class="h2">
				<div class="pagename">
				   <h1 class="title1" >점포 페이지</h>
				</div>
	</header>
   
   
   
   <form class="form">
   <div class="box1"></div>
<a onclick='location.href="Storedtail.jsp"'></a><button class="click"> 내 점포 상세 페이지 </button><br><br>
<a onclick='location.href="StoreSelectService"' ><button  class="click"> 영업정보 </button></a><br><br>
<a onclick='location.href="MenuSelect"'><button  class="click"> 메뉴정보 </button></><br>
<br>

<a onclick="next()"><button class="click"> 점포 삭제 </button></a><br><br><br>
	</form>
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