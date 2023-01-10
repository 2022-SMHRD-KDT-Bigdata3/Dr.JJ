<%@page import="com.smhrd.model1.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>myStoreJoin</title>
    <link rel="stylesheet" href="assets/css/mystorejoin.css" />
    <style type="text/css">
       input[type=text]{ border: 1px solid orange; }
       button{ color:whitesmoke; border: 1px solid orange;
           border-radius: 5px; background-color: orangered;}
   </style>
</head>


<body class="map">

	<form action="StoreJoin" method="post">

		<div class="store_BasicInfo">
			<h4>점포 기본 정보</h4>
			<span>점포이름</span> <input name = "store_Name" type="text" class="store_name"><br>
			<span>연 락 처</span> <input name = "" type="text" class="store_tel"><br>
			<span>카테고리</span><br>
			<input type="radio" name="store_Cate" value="붕어빵">붕어빵
			<input type="radio" name="store_Cate" value="붕어빵">타코야끼
			<input type="radio" name="store_Cate" value="붕어빵">호떡<br>
			<input type="radio" name="store_Cate" value="붕어빵">순대
			<input type="radio" name="store_Cate" value="붕어빵">분식류
			<input type="radio" name="store_Cate" value="붕어빵">기타
		</div>

		<div class="store_openInfo">
			<h4>점포 영업 정보</h4>
			<span>영업장소</span><input name = "store_Addr"  type="text" class="store_place"><br>
			<span>영업 오픈 시간</span><input name = "store_Open_Dt" type="text" class="store_runtime"><br>
			<span>영업 종료 시간</span><input name = "store_Close_Dt" type="text" class="store_runtime"><br>
			<span>점포연락처</span><input name = "store_Tel"  type="text" class="store_"><br>
			<br>

			<div class="store_payment">
				카드 결제 서비스<br> 
				<span><input name="store_Card_Yn" type="radio" value=1>가능</span>
				<span><input name="store_Card_Yn" type="radio" value=0>불가능</span> <br>
				(카드결제 안될 시 본 사이트의 주문예약 서비스를 이용하실 수 없습니다)
			</div>
			<br>
		</div>

			<button>점포 등록 및 수정</button>

	</form>
</body>
</html>