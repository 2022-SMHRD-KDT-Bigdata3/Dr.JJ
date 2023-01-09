<%@page import="com.smhrd.model1.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/mypage.css"/>
    <title>Mypage</title>
</head>
<body>
    <!-- 헤더 -->
      <% MemberVO info = (MemberVO)(session.getAttribute("info")); %>
   
      
        <header>
            <div class="leftbox">
                <a href="Main.jsp">로고</a>
            </div>
            <div class="rightbox">
                <a id = "poket" href="#">장바구니</a>
            </div>
         </header>

         <br><br><br>



        
         
   

        <div class = "info">

            <div class="box" style="background: #bdbdbd;">
                <img class="profile">
            </div>
            <strong class = "name">
                <span class="name">닉네임
                <span>님</span>
                </span>
                <a id = "id">(아이디)</a>
            </strong>
            <br><br>
            <a id = "pass" href="#">비밀번호 변경</a>
            <a id = "pass" href="#">프로필 사진수정</a>
            <br><br>
            <hr width="90%" color="black">

           
            

            <div class="button">
                <p class="btn btn-1"><a href="Reserve1.jsp">현재 예약 보기</a></p>
                <p class="btn btn-1">내 주문내역 보기</p>
                <p class="btn btn-1"><a href="Myreview.jsp">내 리뷰 보기</a></p>
                <p class="btn btn-1"><a href="MystoreJoin.jsp">점포등록</a></p>
                <p class="btn btn-1">내 점포 관리</p>
                
            </div>

            

        </div>
        
 </strong>





</body>
</html>