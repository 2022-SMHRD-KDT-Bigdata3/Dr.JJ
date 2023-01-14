package com.smhrd.controller1;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.smhrd.model1.MemberVO;
import com.smhrd.model1.ReservationDAO;
import com.smhrd.model1.ReservationVO;
import com.smhrd.model1.StoreVO;

/**
 * Servlet implementation class StoreReservation
 */
public class StoreReservation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		HttpSession session = request.getSession();
		MemberVO info = (MemberVO)session.getAttribute("info");
		StoreVO Storeinfo = (StoreVO)session.getAttribute("Storeinfo");
		ReservationDAO dao = new ReservationDAO();
		Integer store_id = Storeinfo.getStore_Id();
		ArrayList<ReservationVO> list = dao.selectSreserv(store_id);
		System.out.println(list.toString());
		if(list.size()!=0) {
			System.out.println("예약조회 성공");
			String result = gson.toJson(list);
			System.out.println(result);;
			out.print(result);
		}else {
			System.out.println("예약조회 실패");
		}
		response.sendRedirect("StoreReserve.jsp");
		
	}

}
