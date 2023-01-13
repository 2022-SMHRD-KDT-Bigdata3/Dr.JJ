package com.smhrd.controller1;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model1.ReservationVO;

public class reserveInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		String user_Id = request.getParameter("user_Id");
		Integer store_Id = Integer.parseInt(request.getParameter("store_Id"));
		//메뉴아이디
		String[] reserve_list = request.getParameterValues("reserve_list");
		String[] food_count = request.getParameterValues("food_count");
		System.out.println(Arrays.toString(food_count));
		
		ArrayList<Integer> count= new ArrayList<Integer>();
		for(int i=0; i<food_count.length;i++) {
			if(Integer.parseInt(food_count[i])!=0) {
				count.add(Integer.parseInt(food_count[i]));		
			}
		}
		System.out.println(count.toString());
		
		
		
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

