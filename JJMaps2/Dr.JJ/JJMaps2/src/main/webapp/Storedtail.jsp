<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <!-- 헤더영역 -->
    <header  onClick='location.href="Main.jsp"'>
        <div id="jup">쩝쩝박사</div>
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