<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.smhrd.model1.MemberVO"%>
<%@ page import="com.smhrd.model1.ReviewVO"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="assets/css/storedtail.css" />
<title>Review</title>


<style>
table.type04 {
    border-collapse: separate;
    width: 100%;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    margin : 20px 10px;
  }
  table.type04 th {
    width: 10%;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    padding-left: 20px;
    border-bottom: 1px solid #ccc;
  }
  table.type04 td {
    width: 100%;
    vertical-align:middle;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
  }
  #mainBody{max-width: 600px;
  min-width: 300px;
            text-align: center;
                margin-left: auto;
    margin-right: auto;}
</style>


</head>
<body class="is-preload">
   <%
   MemberVO info = (MemberVO) session.getAttribute("info");
   ArrayList<ReviewVO> review = (ArrayList<ReviewVO>) request.getAttribute("myReview");
   %>
   <div id="logo">
      <a onClick='location.href="Main.jsp"'>쩝쩝여지도</a><br>
   </div>

   <header class="bar">
      <div id="Title">
         <h1>My 리뷰🍦</h1>
      </div>
      <br>
   </header>
   <br>
   <br>


   <div>
      <br>
      <div class="font1">
      </div>
      <br>

      <table style="align: center; border: 1Px;" class="type04">


         <%
         int i = 1;
         for (i = 0; i < review.size(); i++) {
            int index = i + 1;
         %>

          <tr id="add_tr<%=i%>">
          <th scope="column">
          <a><%=index%></a>
          </th>
          <td>
             <span style="font-size: 1em; font-weight: bold; font-family: 'NanumSquareNeo-Variable';color:rgb(20, 20, 20);"><%=review.get(i).getReview_title()%></span><br>
             <span style="font-size: 0.8em;display: inline-block;padding-bottom:5px; color:rgb(141, 140, 140);"><%=review.get(i).getReviewDt()%></span><br>
             <span>⭐<%=review.get(i).getReviewScore()%></span>
      <br>
             <span><%=review.get(i).getreviewContent()%></span>
          </td>
        </tr>
        <%
      }
      %>
      </table>
      
      
   </div>
   
   


</body>
</html>