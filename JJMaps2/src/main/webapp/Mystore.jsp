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
<style type="text/css">
.toggleSwitch {
  width: 100px;
  height: 50px;
  display: block;
  position: relative;
  border-radius: 30px;
  background-color: #fff;
  box-shadow: 0 0 16px 3px rgba(0 0 0 / 15%);
  cursor: pointer;
  margin: 30px;
}

.toggleSwitch .toggleButton {
  width: 40px;
  height: 40px;
  position: absolute;
  top: 50%;
  left: 4px;
  transform: translateY(-50%);
  border-radius: 50%;
  background: #f03d3d;
}

#toggle:checked ~ .toggleSwitch {
  background: #f03d3d;
}

#toggle:checked ~ .toggleSwitch .toggleButton {
  left: calc(100% - 44px);
  background: #fff;
}

.toggleSwitch, .toggleButton {
  transition: all 0.2s ease-in;
}

.toggldiv{
width:160px;
heigt:90px;
margin-left: auto;
    margin-right: auto;}

</style>

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
<br>
<br>
<br>
<br>
   <table style="    margin-left: auto;
    margin-right: auto;" >
 
   <td>
  <span id="off" style="display: inline-block;vertical-align:middle; color:rgb(184, 184, 184);
  font-weight: bold; font-size:2em;font-family: 'NanumSquareNeo-Variable'; ">OFF</span></td>
   
    <td>
    <div class="toggldiv" style="display: inline-block;vertical-align:middle;">
   			<input type="checkbox" id="toggle" hidden> 
			<label for="toggle" class="toggleSwitch">
		 <span class="toggleButton"></span>
			</label>
   		</div>
   </td>
   <td><span id="on" style="display: inline-block;vertical-align:middle; color:#f03d3d;
   font-weight: bold; font-size:2em;font-family: 'NanumSquareNeo-Variable';">ON</span></td>

   
   </table>
    
   
 
   
   
   <form class="form" style=" margin-Top: -101px;">
	
		<div class="button">
			<div style=" width:170px; height:40px; font-weight: bold; 
			font-size:0.1em; font-family: 'NanumSquareNeo-Variable'; ">영업 예약 보기</div>
			<br>
			<br><br>
			<br><br>
			<br><br>
		
			<p class="btn btn-2" onclick="location.href='StoreDetail?user_id=<%=info.getUser_Id()%>'">내 점포 상세 페이지</p>
			<br>
			<p class="btn btn-2" onclick="location.href='MystoreJoin.jsp'">내 점포 정보 수정</p>
			<br>
			<p class="btn btn-2" onclick='location.href="Menucheck"'>점포 메뉴 등록</p>
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
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
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