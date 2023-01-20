package com.smhrd.controller1;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model1.MemberVO;
import com.smhrd.model1.ReservationDAO;
import com.smhrd.model1.ReservationJoinDAO;
import com.smhrd.model1.ReservationJoinVO;
import com.smhrd.model1.ReservationVO;
import com.smhrd.model1.ReserveDetailsDAO;
import com.smhrd.model1.StoreDAO;
import com.smhrd.model1.StoreVO;


public class NowReserve extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		MemberVO info = (MemberVO)session.getAttribute("info");
		String user_id = info.getUser_Id();
		
		
		ReservationDAO ReservationDAOs = new ReservationDAO();
		
		ArrayList<ReservationVO> rList = ReservationDAOs.rnumSelect(user_id);
		
		ArrayList<ReservationJoinVO> Jlist = new ArrayList<ReservationJoinVO>();
		ReserveDetailsDAO rdao = new ReserveDetailsDAO();
		ReservationJoinDAO jdao = new ReservationJoinDAO();
		ArrayList<StoreVO> slist = new ArrayList<StoreVO>(); 
		StoreDAO sdao = new StoreDAO();
		System.out.println(rList.toString());
		for(int i=0;i<rList.size();i++) {
				Long r_number = rList.get(i).getR_number();
				Integer store_id = rList.get(i).getStore_Id();
				slist.add(sdao.store_Select_Storeid(store_id));
				for(int j= 0;j<rdao.storeReservation(r_number).size();j++) {
					Jlist.add(jdao.AllbyR(r_number).get(j));
				}
			}
		
		System.out.println(Jlist.toString());
		
		
	
		
		if(Jlist.size()!=0) {
			System.out.println("예약조회 성공");
			session.setAttribute("Reserve", Jlist);
			request.setAttribute("store_info", slist);
			response.sendRedirect("Reserve1.jsp");
		}else {
			System.out.println("에러..");
			response.sendRedirect("Mypage.jsp");
			
		}
		
		
		
		
	}

}
