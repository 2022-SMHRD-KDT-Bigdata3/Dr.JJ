package com.smhrd.controller1;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
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

/**
 * Servlet implementation class StoreReservation
 */
public class StoreReservation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		//스토어 주인 user id 추출
		HttpSession session = request.getSession();
		MemberVO info = (MemberVO)session.getAttribute("info");
		String user_id = info.getUser_Id();
		
		//스토어 아이디 추출
		StoreDAO sdao = new StoreDAO();
		Integer store_id = sdao.getStoreId(user_id);
		
		
		//스토어 opne
		int res = sdao.Store_opne(store_id);
		if(res>0) {System.out.println("점포 오픈 ");};
		
		
		//reservation VO 추출 ( 예약 번호, 가게 아이디, 예약자 아이디, 예약 시간, 픽업 시간 )
		ReservationDAO dao = new ReservationDAO();
		System.out.println("가게아이디 : " + store_id);
		ArrayList<ReservationVO> rlist = dao.rnumSelect(store_id);
		
		
		ArrayList<ReservationJoinVO> list= new ArrayList<ReservationJoinVO>();
		
		ReservationJoinDAO jdao = new ReservationJoinDAO();
		ReserveDetailsDAO rdao = new ReserveDetailsDAO();
		System.out.println(rlist.toString());
		

		
		String[] re_id;
		for(int i=0;i<rlist.size();i++) {
			System.out.println(rlist.get(i).getR_number());
			if(rlist.get(i).getR_number()!=null){
				Long r_number = rlist.get(i).getR_number();
				for(int j=0;j<rdao.storeReservation(r_number).size();j++) {
					list.add(jdao.AllbyR(r_number).get(j));
					
			}
			}
		}
		System.out.println(list.toString());
		
		if(list.size()!=0) {
			System.out.println("예약조회 성공");
			request.setAttribute("AllReserve", list);
			}else {
			System.out.println("예약조회 실패");
		}
		RequestDispatcher rdi = request.getRequestDispatcher("StoreReserve.jsp");
		rdi.forward(request, response);
		
	}

}
