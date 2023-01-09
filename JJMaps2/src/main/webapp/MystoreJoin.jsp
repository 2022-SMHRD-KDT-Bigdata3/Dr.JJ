<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>myStoreInfo</title>
    <link rel="stylesheet" href="assets/css/mystorejoin.css" />
    <style type="text/css">
       input[type=text]{ border: 1px solid orange; }
       button{ color:whitesmoke; border: 1px solid orange;
           border-radius: 5px; background-color: orangered;}
   </style>
</head>
<body class="map">
    <div class = "store_BasicInfo">
        <h4>점포 기본 정보</h4>
        <span>점포이름</span> <input type="text" class="store_name"><br>
        <span>영 업 주</span>&nbsp; <input type="text" class="store_manager"><br>
        <span>연 락 처</span>&nbsp;  <input type="text" class="store_tel"><br>
    </div>

    <div class="store_openInfo">
        <h4>점포 영업 정보</h4>
        <span>영업장소</span> &nbsp;&nbsp;<input type="text" class="store_place"><br>
        <span>영업시간</span> &nbsp;&nbsp;<input type="text" class="store_runtime"><br>
        <span>점포연락처</span><input type="text" class="store_"><br><br>

        <div class="store_payment">
            결제방법<button>중복체크가능</button><br>
            <span><input type="checkbox">현금</span>
            <span><input type="checkbox">카드</span>
            <span><input type="checkbox">계좌이체</span>
        </div> <br>           
    </div>

    <div class="store_menu">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        <span>메뉴이름</span>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
        <span>메뉴가격</span><br>
        1&nbsp;<input type="text"><input type="text"><br>
        2&nbsp;<input type="text"><input type="text"><br>
        3&nbsp;<input type="text"><input type="text"><br>
        <button class ="plus_text">메뉴입력칸 추가</button>
    </div>
    
    <div class="store_insert">
    <a href="점포등록페이지로 데려다다오!"><button>점포 등록</button></a>
    </div>
</body>
</html>