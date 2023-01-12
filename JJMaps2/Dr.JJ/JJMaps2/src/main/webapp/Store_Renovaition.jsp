<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./assets/css/store_renovaition"/>
    <title>Document</title>
</head>
<body>

    <header>  
    	<hr style="border: solid 5px orange;">
    </header>
     
    <div class="left">   
        <h1 class="text1">예약받기</h1>
    </div>

    <div class="right">   
        <p>
        	<label class="switch-button">
	            <input type="checkbox"/>       
	            <span class="onoff-switch"></span>
            </label>
        </p>
    </div>
         
    <h4 class="text2">스위치가 활성화 되어야 주문을 받을 수 있습니다.🙂</h4>


    <div id ="wrap1" >
        <div class="b1">주문 내역1<br><br>
            <span class="user_id">주문자: user_1</span><br>
            <span class="rNumber">주문번호: TR10832857y</span><br>
                <ol class="menu">
                    <li class="menuId">붕어빵</li>
                    <li class="menuCnt">개</li>
                </ol>
        	<span class="total_price">총 주문금액</span><br>
        <button class="cancle_bnt"><a href="#">주문취소</a></button> 
        
        <!--주문취소 버튼 클릭시 데이터 삭제  -->
        
        </div><br>



    <!--for문 사용해서 데이터 출력하기-->

       <div id ="wrap2"  class="b2">주문 내역2<br><br>
            <span class="user_id">주문자: user_1</span><br>
             <span class="rNumber">주문번호: TR10832857y</span><br>
                <ol class="menu">
                     <li class="menuId">붕어빵을 주문해주셨어요 3개</li>
                     <li class="menuCnt">붕어빵을 주문해주셨어요 4개</li>
                </ol>
            <span>총 주문금액</span><br> 
            <button class="cancle_bnt"><a href="#">주문취소</a></button> 
        </div><br>  
    </div>      
</body>
</html>