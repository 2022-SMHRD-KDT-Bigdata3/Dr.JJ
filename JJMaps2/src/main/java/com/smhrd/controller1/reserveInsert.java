package com.smhrd.controller1;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model1.ReservationDAO;
import com.smhrd.model1.ReservationVO;

public class reserveInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		//RESERVATIONS 테이블에 인서트 할 요소 vo 묶기
		Integer store_Id = Integer.parseInt(request.getParameter("store_Id"));
		String user_Id = request.getParameter("user_Id");
		String r_time = request.getParameter("r_time");
		String p_time = request.getParameter("p_time");
		
		// insert 하고 예약 번호 받아오기
		ReservationVO rVo = new ReservationVO(store_Id,user_Id,r_time,p_time);
		ReservationDAO reservationDAOs=new ReservationDAO();
		Long r_number= reservationDAOs.create_r_num(rVo);
		System.out.println("예약번호 발급 :"+r_number);
		
		
		//메뉴 아이디 배열 추출
		String[] reserve_list = request.getParameterValues("reserve_list");
		
		//메뉴 전체 수량 
		String[] food_count = request.getParameterValues("food_count");
		System.out.println(Arrays.toString(food_count));
		//구매할 메뉴 수량만 추출
		ArrayList<Integer> count= new ArrayList<Integer>();
		for(int i=0; i<food_count.length;i++) {
			if(Integer.parseInt(food_count[i])!=0) {
				count.add(Integer.parseInt(food_count[i]));		
			}
		}
		System.out.println(count.toString());
		
		
		//RESERV_DETAILS VO 객체 만들고 DB등록
		
		
		
		
		
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

