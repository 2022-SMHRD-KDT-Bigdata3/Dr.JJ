package com.smhrd.controller1;

import java.io.IOException;
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
		String userId = request.getParameter("user_id");
		Integer storeId = Integer.parseInt(request.getParameter("store_id"));
		String storeMenu = request.getParameter("store_menu");
		String storePrice = request.getParameter("store_price");
		java.sql.Date pTime = null;
		try {
			Date pTime_1 = new Date(Date.parse(request.getParameter("pTime")));
			long timeInMilliSeconds = pTime_1.getTime();
			pTime = new java.sql.Date(timeInMilliSeconds);//java.util.Date 자료형을 java.sql.Date 형으로 변환하는 구문
		} catch (Exception e) {
			e.printStackTrace();
		}
		ReservationVO vo = new ReservationVO(storeId, userId, storeMenu, storePrice, pTime);
	}

	
}

