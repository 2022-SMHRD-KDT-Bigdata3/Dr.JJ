<%@page import="com.smhrd.model1.MemberVO"%>
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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

   </head>
   <body > 
   
<<<<<<< HEAD

=======

>>>>>>> branch 'master' of https://github.com/2022-SMHRD-KDT-Bigdata3/Dr.JJ.git
   <%	MemberVO info = (MemberVO)session.getAttribute("info");	%>
<<<<<<< HEAD

=======
>>>>>>> branch 'master' of https://github.com/2022-SMHRD-KDT-Bigdata3/Dr.JJ.git
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

	<% Integer store_id = store_info.getStore_Id(); %>
    <div id="review"><a id="review" onClick='location.href="ReviewService?store_id=<%=store_id %>"'>(리뷰)</a></div>
    
    
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
    
    	<form action="StoreDetail" class="form">
    	<input type="hidden" id="login_check" value="<%=info!=null?info.getUser_Id():""%>">
        <input type="hidden" name="storeId" value="<%=store_info.getStore_Id()%>">
        <input type="hidden" name="send" value="Renovation.jsp">
        <button>예약하기</button>
        <li>
        <button type="button" class="navyBtn" onClick="location.href='writeReview'">리뷰</button></li>");   
        </form>
 


    <footer id = "footer">@JJUPJJUPBAKSA</footer>
    	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function() {
    $('.form').submit(function() {
        if ($('#login_check').val()==="") {
        	 Swal.fire({
                 icon: '',
                 title: '',
                 text: '로그인을 해주세요.',
                 confirmButtonColor: '#FD6F22'
             });
            return false;
        }
    }); // end submit()
}); // end ready()

</script>
</body>
</html>