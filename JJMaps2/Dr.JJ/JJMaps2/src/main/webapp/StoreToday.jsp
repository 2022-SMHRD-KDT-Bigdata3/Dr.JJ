<%@page import="com.smhrd.model1.StoreVO"%>
<%@page import="com.smhrd.model1.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no " />
	
<link rel="stylesheet" type="text/css" href="assets/css/storedtail.css" />
<title>Insert title here</title>
<style type="text/css">
.toggleSwitch {
  width: 100px;
  height: 50px;
  display: block;
  position: relative;
  border-radius: 30px;
  background-color: #fff;
  box-shadow: 0 0 16px 3px rgba(0 0 0 / 15%);
  cursor: pointer;
  margin: 30px;
}

.toggleSwitch .toggleButton {
  width: 40px;
  height: 40px;
  position: absolute;
  top: 50%;
  left: 4px;
  transform: translateY(-50%);
  border-radius: 50%;
  background: #0E5049;
}

#toggle:checked ~ .toggleSwitch {
  background: #0E5049;
}

#toggle:checked ~ .toggleSwitch .toggleButton {
  left: calc(100% - 44px);
  background: #fff;
}

.toggleSwitch, .toggleButton {
  transition: all 0.2s ease-in;
}

.toggldiv{
width:160px;
heigt:90px;
margin-left: auto;
    margin-right: auto;}
    
    
     .btn_reservation {
  box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.10);
  transition: all 0.3s cubic-bezier(.25,.8,.25,1);
  border-radius: 50px;
   vertical-align: middle;
    margin-left: auto;
  margin-right: auto;
}

.btn_reservation:hover {
  box-shadow: 0 14px 15px rgba(0,0,0,0.18), 0 10px 10px rgba(0,0,0,0.12);
}


table.type04 {
    border-collapse: separate;
    width: 100%;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    margin : 20px 10px;
  }
  table.type04 th {
    width: 40%;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    padding-left: 20px;
    border-bottom: 1px solid #ccc;
  }
  table.type04 td {
    width: 100%;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
  }
  table.type05 {
    border-collapse: separate;
     width: 100%;
    border-spacing: 1px;
    text-align: center;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    margin : 20px 10px;
  }
  table.type05 th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
  }
  table.type05 td {
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
  }
  #mainBody{max-width: 600px;
  min-width: 300px;
  			 text-align: center;
  			     margin-left: auto;
    margin-right: auto;}
</style>
</head>

<body class="is-preload">
	<%StoreVO store_info = (StoreVO)session.getAttribute("store_info"); %>
   <div id="logo">
      <a onClick='location.href="Main.jsp"'>???????????????</a><br>
   </div>

   <header class="bar">
      <div id="Title">
         <h1>????????? ??????</h1>
      </div>
      <br>
   </header>
   <br>
   <br>
      <table style="    margin-left: auto;
    margin-right: auto;" >
 
   <td>
  <span id="off" style="display: inline-block;vertical-align:middle; color:rgb(184, 184, 184);
  font-weight: bold; font-size:2em;font-family: 'NanumSquareNeo-Variable'; ">OFF</span></td>
   <%String check="";
   if(store_info.getStore_Status()>0){
	  check = " checked=\"checked\""; } %>
    <td>
    <div class="toggldiv" style="display: inline-block;vertical-align:middle;">
            <input type="checkbox" id="toggle" hidden <%=check%>> 
         <label for="toggle" class="toggleSwitch">
       <span class="toggleButton"></span>
         </label>
         </div>
   </td>
   <td><span id="on" style="display: inline-block;vertical-align:middle; color:#0E5049;
   font-weight: bold; font-size:2em;font-family: 'NanumSquareNeo-Variable';">ON</span></td>

   
   </table>
   
<hr style="border: solid 0.02em  #0E5049;">

<div id="reserve_space">
</div>


   


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>



$(document).ready(function() {
$("#toggle").on('click', function() {//???????????? ?????????
      if ( $(this).prop('checked') ) {//????????? ????????????
    	  if (confirm("?????? ????????? ?????????????????????????")) {
             
    		  location.href = "StoreReservation";
    		  
    		  
    		  
    		  
    		  //??? ??????????????? ?????? ajax??? ?????? 30??? ????????? ???????????? ??????????????? ???... 
    	/*	$("#reserve_space").text("???????????? ????????????");
    		function storeopne(){
    			$.ajax({
    			url: "StoreReservation",
    			method: "POST",
    			datatype :"Json",
    			success :  function(data){
    				console.log("????????????");
    				
    			
    				// ?????? ???????????? ??? ?????? div(reserve_space)??? .text ????????????

    				   		<table class="type04">
    				    		        <tr>
    				    		          <th scope="column">
    				    			          <span>?????? ??????</span><br>
    				    			          <span>?????? ??????</span><br>
    				    			          <span>?????? ??????</span><br>
    				    			          <span>????????? ?????????</span><br>
    				    			          <span>??? ?????? ??????</span>
    				    		          </th>

    				    		          <td>
    				    			          <span id="reserve_id"></span><br>
    				    			          <span id="dt_time"></span><br>
    				    			          <span id="pic_time"></span><br>
    				    			          <span id="nick"></span><br>
    				    			          <span id="total"></span>
    				    		          </td>
    				    		        </tr>
    				    		</table>

    				    		 <table class="type05">
    				    		  <tr>
    				    		          <th>??????</th> <th>??????</th> <th>?????? ??????</th> 
    				    		        </tr>
    				    		 
    				    		 
    				    			 <tr>
    				    		          <td ><span id="menu_name"></span></td>
    				    		          <td ><span id="menu_price"></span></td>
    				    		          <td ><span id="menu_cnt"></span></td>
    				    		     </tr>
    				    			

    				    		</table>      
    				        
    				
    				
    				
    				
    				
    			 
    			},//????????? ?????? ??????
    			error : function(data){
    				console.log("????????????")
    			}
    			
    			
    			});//ajax ???
    			}//ajax ??????
    		  */

    	  }//??????
      } else {//?????? ???????????? ?????? ??????
    	  
    	  if (confirm("?????? ????????? ?????????????????????????")) {
              location.href = "StoreClose";
           }; 


        
      };
    });
});//???


	
</script>

</body>



</html>