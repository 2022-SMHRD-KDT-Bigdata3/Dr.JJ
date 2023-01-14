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
import com.smhrd.model1.ReserveDetailsDAO;
import com.smhrd.model1.ReserveDetailsVO;

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
		ReservationDAO dao = new ReservationDAO();
		Integer store_id = Integer.parseInt(request.getParameter("store_id"));
		ArrayList<ReservationVO> rlist = dao.rnumSelect(store_id);
		ArrayList<ArrayList<ReserveDetailsVO>> list= new ArrayList<ArrayList<ReserveDetailsVO>>();
		ReserveDetailsDAO rdao = new ReserveDetailsDAO();
		System.out.println(rlist.toString());
		for(int i=0;i<rlist.size();i++) {
			System.out.println(rlist.get(i).getR_number());
			Long r_number = rlist.get(i).getR_number();
			list.add(rdao.storeReservation(r_number));
		}
		
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
