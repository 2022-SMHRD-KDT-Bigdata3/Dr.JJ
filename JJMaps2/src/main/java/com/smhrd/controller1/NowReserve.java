package com.smhrd.controller1;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model1.MemberVO;
import com.smhrd.model1.MenuDAO;
import com.smhrd.model1.MenuVO;
import com.smhrd.model1.ReservationDAO;
import com.smhrd.model1.ReservationVO;
import com.smhrd.model1.ReserveDetailsDAO;
import com.smhrd.model1.ReserveDetailsVO;
import com.smhrd.model1.StoreDAO;
import com.smhrd.model1.StoreVO;


public class NowReserve extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		MemberVO info = (MemberVO)session.getAttribute("info");
		String user_id = info.getUser_Id();
		
		
		ReservationDAO ReservationDAOs = new ReservationDAO();
		ReservationVO now_reserve = ReservationDAOs.select_Reservation(user_id);
		
	
		long r_Number = (long)now_reserve.getR_number();
		System.out.println("예약번호 :"+r_Number);
		
		
		ReserveDetailsDAO reserveDetailsDAOs = new ReserveDetailsDAO();
		ArrayList<ReserveDetailsVO> now_reserve_menu = reserveDetailsDAOs.reserve_detail_select(r_Number);
		ArrayList<String> menu_name = new ArrayList<String>();//메뉴 이름 
		MenuDAO menuDAOs=new MenuDAO();
		for(int i=0; i<now_reserve_menu.size();i++) {
			String menuname = menuDAOs.select_name(now_reserve_menu.get(i).getMenu_Id());
			menu_name.add(menuname);
		}
		
		StoreDAO storeDAOs = new StoreDAO();
		StoreVO now_reserve_store =  storeDAOs.store_Select_Storeid(now_reserve.getStore_Id());
		
	
		
		if(now_reserve != null) {
		
			session.setAttribute("now_reserve_menu",now_reserve_menu );
			session.setAttribute("now_menu_Name_list",menu_name );
			session.setAttribute("now_reserve",now_reserve );
			session.setAttribute("now_reserve_store",now_reserve_store );
			response.sendRedirect("Reserve1.jsp");
			
		}else {
			System.out.println("에러..");
			
		}
		
		
		
		
	}

}
