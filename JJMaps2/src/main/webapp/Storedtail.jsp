<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.model1.MenuVO"%>
<%@page import="com.smhrd.model1.StoreVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <title>jj login</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
       <meta name="format-detection" content="telephone-no">
     	 <link rel="stylesheet" type="text/css" href="assets/css/storedtail.css" />	

   </head>
   <body >
   <%	StoreVO store_info=(StoreVO)request.getAttribute("store_info");%>
   <%	ArrayList<MenuVO> menu_info=(ArrayList<MenuVO>)request.getAttribute("menu_info");%>
    <!-- 헤더영역 -->
    <div id="login_Body">
			<div id="logo">
			   <a  onClick='location.href="Main.jsp"'>쩝쩝여지도</a><br>
	</div>

    <!-- 가게소개 영역 -->
    <nav>
        <h1><%=store_info.getStore_Name() %></h1>
        <div id="sdtail">
            <a><%=store_info.getStore_Cate() %></a><br>
            <a>별점</a>
        </div>
        
    </nav>
    
    <br>

    <main id="main">메인 (가게설명)
        <div>(위치)</div>
        <div>(영업상태) 및 정보</div>
        <div>전화번호</div>
    </main>


    <div id="review"><a id="review" onClick='location.href="#"'>(리뷰)</a></div>
    
    
    <main id="main2">메인2 (메뉴 및 사진)
        <div>
            <h3>메뉴판</h3>
            <p>(맛있는 메뉴)</p>
            
            
            
            <table border="1px solid" class="addInput">
			<tr>
				<th>번호</th>
				<th>메뉴이름</th>
				<th>가격</th> 
				<th>메뉴 설명</th>
			</tr>
		
            <% int i =1;
			for(i=0;i<menu_info.size();i++){  int index =i+1;%>
			
				<tr id="add_tr<%=i%>">
				<td><%= index %></td>
				<td><%=menu_info.get(i).getMenu_Name()%></td>
				    <td><%=menu_info.get(i).getMenu_Price()%>원</td>
				    <td><%=menu_info.get(i).getMenu_details()%></td>
				</tr>
				
			<% } %>
            
            
            
            
        </div>
        <div>(영업상태) 및 정보</div>
        <div>(전화번호)</div>
    </main>
    <footer id = "fix"  >
    	<form action="StoreDetail">
        <input type="hidden" name="storeId" value="<%=store_info.getStore_Id()%>">
        <input type="hidden" name="send" value="Renovation.jsp">
        <button>예약하기</button>
       <li><a id='review' href='ReviewService'>리뷰</a></li>");
        </form>
 


    <footer id = "footer">@JJUPJJUPBAKSA</footer>
    

</body>
</html>