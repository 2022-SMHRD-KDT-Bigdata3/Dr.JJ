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
<a href="StoreUpdate"><button> 영업정보 </button></a>
<a href="MenuSelect"><button> 메뉴정보 </button></a>
<br><br><br>

<a onclick="next()"><button> 점포 삭제 </button></a>

	<script>
		function next() {
			if (confirm("점포 삭제시 되돌릴 수 없습니다. \n 정말로 삭제하시겠습니까?")) {
				location.href = "StoreDelete";
			} 
		}
	</script>

</body>
</html>