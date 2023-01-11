<%@page import="com.smhrd.model1.StoreVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <link rel="stylesheet" href="assets/css/mystorejoin.css" />
    <style type="text/css">
       input[type=text]{ border: 1px solid orange; }
       button{ color:whitesmoke; border: 1px solid orange;
           border-radius: 5px; background-color: orangered;}
       #sample6_detailAddress{display : none; }
       #sample6_extraAddress{display : none;}
       #sample6_postcode{display : none;}
   </style>
</head>

<body align="center">

	<%StoreVO Storeinfo = (StoreVO)request.getAttribute("Storeinfo"); %>
	
	<% 
	String store_Name = Storeinfo.getStore_Name();
	String store_Addr =Storeinfo.getStore_Addr();
	String store_Tel = Storeinfo.getStore_Tel();
	String store_Open_Dt =Storeinfo.getStore_Open_Dt();
	String store_Close_Dt = Storeinfo.getStore_Close_Dt();
	int store_Card_Yn = Storeinfo.getStore_Card_Yn();
	int store_Status = Storeinfo.getStore_Status();
	String user_Id = Storeinfo.getUser_Id();
	String store_Cate = Storeinfo.getStore_Cate();
	
	%>
	
	
	<form action="StoreJoin" method="post">
	<h1>점포 정보 수정</h1>

		<div class="store_BasicInfo">
			<h4>점포 기본 정보</h4>
			<span>점포이름</span> <input name = "store_Name" type="text" class="store_name" value ="<%=store_Name %>"><br>
			<span>점포연락처</span><input name = "store_Tel"  type="text" class="store_"value ="<%=store_Tel %>"><br>
			<span>카테고리</span><br>
			<input type="radio" name="store_Cate" value="붕어빵"<%=(store_Cate.equals("붕어빵"))?"checked":"" %> >붕어빵
			<input type="radio" name="store_Cate" value="타코야끼"<%=(store_Cate.equals("타코야끼"))?"checked":"" %>>타코야끼
			<input type="radio" name="store_Cate" value="호떡"<%=(store_Cate.equals("호떡"))?"checked":"" %>>호떡<br>
			<input type="radio" name="store_Cate" value="순대"<%=(store_Cate.equals("순대"))?"checked":"" %>>순대
			<input type="radio" name="store_Cate" value="분식류"<%=(store_Cate.equals("분식류"))?"checked":"" %>>분식류
			<input type="radio" name="store_Cate" value="기타"<%=(store_Cate.equals("기타"))?"checked":"" %>>기타
		</div>

	

		<div class="store_openInfo">
			<h4>점포 영업 정보</h4>
			
			<span>영업 오픈 시간</span><input name = "store_Open_Dt" type="text" class="store_runtime" value ="<%=store_Open_Dt %>"><br>
			<span>영업 종료 시간</span><input name = "store_Close_Dt" type="text" class="store_runtime" value ="<%=store_Close_Dt %>"><br>
			<br>
			
			<!-- 주소관련 input창 삭제 금지! 삭제하면 주소찾기 기능이 안되용~ -->
			
			<span>영업장소</span>
			<input type="text" readonly="readonly" id="sample6_postcode" placeholder="우편번호">
			<input name="store_Addr" type="text" readonly="readonly" id="sample6_address"  placeholder="주소" value ="<%=store_Addr %>">
			<input type="button" onclick="sample6_execDaumPostcode()" value="찾기"><br><br>
			<input type="button" onclick="geo()" value ="지도에 위치 등록"><br><br>
			
			
			<input type="text" readonly="readonly" id="sample6_detailAddress"  placeholder="상세주소">
			<input type="text" readonly="readonly" id="sample6_extraAddress" placeholder="참고항목">
			<br>
			

			<div class="store_payment">
				카드 결제 서비스<br> 
				<span><input name="store_Card_Yn" type="radio" value=1 <%=(store_Card_Yn > 0)?"checked":"" %> >가능</span>
				<span><input name="store_Card_Yn" type="radio" value=0 <%=(store_Card_Yn ==0)?"checked":"" %>>불가능</span> <br>
				(카드결제 안될 시 본 사이트의 주문예약 서비스를 이용하실 수 없습니다)
			</div>
			<br>
		</div>

			<button>수정하기</button>

	</form>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function geo(){
		var address=$("#sample6_address").val();
		$.ajax({
			url:"Geocode",
			type: "POST",
			data:{"address":address},
			dataType:"json",
			success:function(data){
				 var x=data.documents[0].x; // 경도
				 var y=data.documents[0].y; // 위도
				console.log(x);
				console.log(y);
	     		 alert("지도에 위치를 등록하였습니다.");	
			},
			error: function(){alert("error");}		
			
		});
	}
	
	
	
	
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }


    
</script>
</body>


</html>