<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.model1.StoreVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="format-detection" content="telephone-no">
    
    <link rel="stylesheet" type="text/css" href="assets/css/search.css">
    <title>Document</title>
</head>
<body>
	<%	 ArrayList<StoreVO> list=(ArrayList<StoreVO> )request.getAttribute("searchWord");%>
					
						
					
					}%>			
        <div id="headerdiv">
            <header>
                <a class="header_emt" id="main_Logo" href="Main.jsp">로고</a>
                <form class="header_emt " id="main_form" action="Search" >
                        <input name="searchWord" class="header_emt search" type="text" placeholder="검색어 입력">
                        <input class="header_emt search" type="submit" value="검색">
                    </form>
            </header>
        </div>
        
        <div id="allwidth">
            <div id="map2"></div>
        <div class="list_wrap">
        
        
        
        
        <% for(int i=0; i<list.size();i++){ %>
      
								
                <div class="list_one">
                    <table>
                        <tr>
                            <td>
                            <img id="store_img<%=i%>" src="assets/css/images/samplefood.JPG">
                            </td>
                            <td>
                                <h3 class ="list_store" id="store_name"><%=list.get(i).getStore_Name() %></h3>
                                <a class ="list_store"id="store_score"> ⭐ 3.5(2명) </a><br>
                                <a class ="list_store"> <%=list.get(i).getStore_Cate() %></a><br>

                            </td>
                        </tr>
                    </table>
                </div>
                
                 <% }%>
                
        </div>

        <div class="map_wrap"> <a></a> 
            <div id="map1"></div>
        </div>
        


    </div>
</body>
</html>