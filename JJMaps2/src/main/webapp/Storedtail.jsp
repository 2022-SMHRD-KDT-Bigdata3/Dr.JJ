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
    <!-- 헤더영역 -->
    
    <div id="login_Body">

			<div id="logo">
			   <a  onClick='location.href="Main.jsp"'>쩝쩝여지도</a><br>
	</div>
	
	<header onClick='location.href="Main.jsp"' class="bar">
				<div id="Title">
				   <h1>쩝쩝박사</h1>
				</div>
		  </header>
    
    
    <!-- 가게소개 영역 -->
    <nav>
        <h1>(가게이름)</h1>
        <div id="sdtail">
            <a>(카테고리)</a>
            <a>(평점)</a>
        </div>
        
    </nav>

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
            <!-- 메뉴 DB에 있는 것 주르륵 내려야함 -->
        </div>
        <div>(영업상태) 및 정보</div>
        <div>(전화번호)</div>
    </main>

    <footer id = "fix"  onClick='location.href="Renovation.jsp"'>
        <div id="myr">예약하기</div>
    </footer>


    <footer id = "footer">@JJUPJJUPBAKSA</footer>
</body>
</html>