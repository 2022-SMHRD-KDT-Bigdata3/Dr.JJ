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
<meta name="viewport"
   content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
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
<br>
<br>
  

   
   
   <form class="form" style=" margin-Top: -120px;">
   
      <div class="button">


         <br><br>
         <br><br>
      
         <p class="btn btn-2" onclick="location.href='StoreToday'">오늘 영업</p>
         <br>
         <p class="btn btn-2" onclick="location.href='StoreDetail?user_id=<%=info.getUser_Id()%>'">내 점포 상세 페이지</p>
         <br>
         <p class="btn btn-2" onclick="location.href='MystoreJoin.jsp'">내 점포 정보 수정</p>
         <br>
         <p class="btn btn-2" onclick='location.href="Menucheck"'>점포 메뉴 등록</p>
         <br>
         <p class="btn btn-2" onClick="next()">점포 삭제</p>
   
   </div>
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