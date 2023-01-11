<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.smhrd.model1.MemberVO"%>
<%@ page import="com.smhrd.model1.StoreVO"%>
<!DOCTYPE HTML>

<html>
	<head>
		<title>예약하기</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no " />
		 <link rel="stylesheet" href="assets/css/renovaition.css"/>

		 <style type="text/css">
            input[type=text]{ border: 1px solid orange; }
			button{ color:whitesmoke; border: 1px solid orange;
				border-radius: 5px; background-color: orangered;}
        </style>

	</head>
	<%MemberVO info = (MemberVO) (session.getAttribute("info"));
	 StoreVO st_info = (StoreVO)(session.getAttribute("st_info"));
	 %>
	<body class="menu_count">
		<form action = "reserveInsert">
		<header class="bar">
			<nav class="navbar">
				<div class="pagename">
					<h1 class="title" >예약하기</h1>
				</div>
			</nav>
		</header>


        <div class ="info" >
			<div class="info">
                <img src="images/profil_img.jpg">
                
				<h2>마싯는 트럭</h2>
		    </div>
        </div><br>

            <h4 class = "menu">MENU</h4><br>

        <!--메뉴수량 선택-->
        <div class="menu_select">
            <H3  class="menu_name">붕어빵</H3>
            슈붕(부드러운 슈크림)    700원 
            <select>
                <option value="number">1</option>
                <option value="number">2</option>
                <option value="number">3</option>
                <option value="number">4</option>
                <option value="number">5</option>
                <option value="number">6</option>
                <option value="number">7</option>
                <option value="number">8</option>
                <option value="number">9</option>
                <option value="number">10</option>
            </select>
            <br>
            팥붕(근본 팥붕어빵)       700원 
            <select>
                <option value="number">1</option>
                <option value="number">2</option>
                <option value="number">3</option>
                <option value="number">4</option>
                <option value="number">5</option>
                <option value="number">6</option>
                <option value="number">7</option>
                <option value="number">8</option>
                <option value="number">9</option>
                <option value="number">10</option>
            </select>
            <br>
            피붕(치즈가득 피자붕어빵)    700원 
            <select>
                <option value="number">1</option>
                <option value="number">2</option>
                <option value="number">3</option>
                <option value="number">4</option>
                <option value="number">5</option>
                <option value="number">6</option>
                <option value="number">7</option>
                <option value="number">8</option>
                <option value="number">9</option>
                <option value="number">10</option>
            </select>
        </div>
        
        <div class="menu_select">
            <H3  class="menu_name">어묵</H3>
            따끈한 우동한그릇 3000원
            <select>
                <option value="number">1</option>
                <option value="number">2</option>
                <option value="number">3</option>
                <option value="number">4</option>
                <option value="number">5</option>
                <option value="number">6</option>
                <option value="number">7</option>
                <option value="number">8</option>
                <option value="number">9</option>
                <option value="number">10</option>
            </select>
        </div>

        <div class="menu_select">
            <H3  class="menu_name">호떡</H3>
                달달한 호떡   1000원
            <select>
                <option value="number">1</option>
                <option value="number">2</option>
                <option value="number">3</option>
                <option value="number">4</option>
                <option value="number">5</option>
                <option value="number">6</option>
                <option value="number">7</option>
                <option value="number">8</option>
                <option value="number">9</option>
                <option value="number">10</option>
            </select>
        </div>

        <hr style="border: solid 1px gray;">
            <div class="total_price">
                <h4>현재 주문 금액</h4>             
                <h4>total 금액</h4>
            </div>
            

            <div class="reno_bnt">
                <input type= submit value="예약하기">
            </div>
	</form>
	</body>
</html>