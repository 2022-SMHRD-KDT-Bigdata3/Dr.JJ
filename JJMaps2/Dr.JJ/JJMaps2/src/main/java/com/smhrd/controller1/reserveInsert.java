package com.smhrd.controller1;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model1.ReservationDAO;
import com.smhrd.model1.ReservationVO;
import com.smhrd.model1.ReserveDetailsDAO;
import com.smhrd.model1.ReserveDetailsVO;

public class reserveInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//RESERVATIONS 테이블에 인서트 할 요소 vo 묶기
		Integer store_Id = Integer.parseInt(request.getParameter("store_Id"));
		String user_Id = request.getParameter("user_Id");
		String r_time = request.getParameter("r_time");
		String p_time = request.getParameter("p_time");
		ReservationVO rVo = new ReservationVO(store_Id,user_Id,r_time,p_time);
		
		
		//장바구니 or 바로 예약
		String Basket="";
		Long r_Number= (long) 0;
		try {
			System.out.println("장바구니로");
			Basket = request.getParameter("Basket");
			
		} catch (Exception e) {
			System.out.println("바로예약");
			// insert 하고 예약 번호 받아오기
			ReservationDAO reservationDAOs=new ReservationDAO();
			r_Number= reservationDAOs.create_r_num(rVo);
			System.out.println("예약번호 발급 :"+r_Number);
		}
		
		
		
		//메뉴 아이디 배열 추출
		String[] reserve_list = request.getParameterValues("reserve_list");
		ArrayList<Long> menu_Id_list = new ArrayList<Long>();
		for(int i=0; i<reserve_list.length;i++) {
			Long menu= Long.parseLong(reserve_list[i]);
			menu_Id_list.add(menu);		
		}
		
		//메뉴 전체 수량 
		String[] food_count = request.getParameterValues("food_count");
		System.out.println(Arrays.toString(food_count));
		//구매할 메뉴 수량만 추출
		ArrayList<Long> menu_Cnt_list = new ArrayList<Long>();
		for(int i=0; i<food_count.length;i++) {
			if(Integer.parseInt(food_count[i])!=0) {
				Long food_num= Long.parseLong(food_count[i]);
				menu_Cnt_list.add(food_num);		
			}
		}
		System.out.println(menu_Cnt_list.toString());
		
		
		
		int res=0;
		HttpSession session = request.getSession();
		
		// if 현재 예약 페이지일 때, 받아온 예약번호 포함한 디테일 객체생성 , 디테일 db insert 
		if(Basket=="") {  
		ReserveDetailsDAO r_d_Dao = new ReserveDetailsDAO();
		for(int i=0; i<menu_Cnt_list.size();i++) {
			long menu_Id=menu_Id_list.get(i);
			long menu_Cnt=menu_Cnt_list.get(i);
		ReserveDetailsVO r_d_VO=new ReserveDetailsVO(menu_Id, r_Number, menu_Cnt);
		res= r_d_Dao.reserve_menu_insert(r_d_VO);
			}
		System.out.println("메뉴 예약 등록 성공");
		
		session.setAttribute("ReservationVO",rVo );
		session.setAttribute("reserve_Num",r_Number );
//		session.setAttribute("reserve_menu_id",reserve_list );
//		session.setAttribute("reserve_menu_cnt", menu_Cnt_list);
		response.sendRedirect("현재예약.jsp");
		
		// else if 장바구니일 때, 메뉴id와 수량 리스트 보내기 
		}else if(Basket!="") {
			session.setAttribute("ReservationVO",rVo );
			session.setAttribute("reserve_menu_id",reserve_list );
			session.setAttribute("reserve_menu_cnt", menu_Cnt_list);
			response.sendRedirect("Basket.jsp");
			
		};
		
		System.out.println("에러..");
		
		
	
		
		
		
		
//		java.sql.Date pTime = null;
//		try {
//			Date pTime_1 = new Date(Date.parse(request.getParameter("pTime")));
//			long timeInMilliSeconds = pTime_1.getTime();
//			pTime = new java.sql.Date(timeInMilliSeconds);//java.util.Date 자료형을 java.sql.Date 형으로 변환하는 구문
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		ReservationVO vo = new ReservationVO(store_Id, user_Id, storeMenu, storePrice, pTime);
	}

	
}

