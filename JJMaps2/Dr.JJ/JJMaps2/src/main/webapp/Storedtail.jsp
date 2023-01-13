<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.smhrd.model1.MemberVO"%>
<%@ page import="com.smhrd.model1.StoreVO"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="assets/css/storedtail.css">
    <title>myStoredtail</title>

</head>
<body>
	<%
	MemberVO info = (MemberVO) (session.getAttribute("info"));
	StoreVO Storeinfo= (StoreVO)(request.getAttribute("Storeinfo"));
	%>
    <!-- 헤더영역 -->
    <header  onClick='location.href="Main.jsp"'>
        <div id="jup">쩝쩝박사</div>
    </header>
    <!-- 가게소개 영역 -->
    <nav>
        <h1>(가게이름)<%=Storeinfo.getStore_Name() %></h1>
        <div id="sdtail">
            <a>(카테고리)<%=Storeinfo.getStore_Cate() %></a>
            <a>(평점)</a>
        </div>
        
    </nav>
<% String status;
if(Storeinfo.getStore_Status()==0){
	status = "영업중";
}else{
	status = "영업중이 아닙니다";
}	%>

    <main id="main">메인 (가게설명)
        <div>(주소)<%=Storeinfo.getStore_Addr() %></div>
        <div>영업상태 : <%=status %></div>
        <div>연락처<%=Storeinfo.getStore_Tel() %></div>
    </main>


    <div id="review"><a id="review" onClick='location.href="ReviewService"'>(리뷰)</a></div>
    
    
    <main id="main2">메인2 (메뉴 및 사진)
        <div>
            <h3>메뉴판</h3>
            <p>(맛있는 메뉴)</p>
            <!-- 메뉴 DB에 있는 것 주르륵 내려야함 -->
        </div>

    </main>

    <footer id = "fix"  onClick='location.href="Renovation.jsp"'>
        <div id="myr">예약하기</div>
    </footer>


    <footer id = "footer">@JJUPJJUPBAKSA</footer>
    <script>
    console.log(Storeinfo);
    </script>
</body>
</html>