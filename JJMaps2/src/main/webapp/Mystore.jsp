<%@page import="com.smhrd.model1.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <% MemberVO info = (MemberVO)(session.getAttribute("info")); %>
   
<a href="StoreInfo"><button> 내 점포 상세 페이지 </button></a>
<a href="StoreSelect"><button> 영업정보 </button></a>
<a href="MenuSelect"><button> 메뉴정보 </button></a>


</body>
</html>