package com.smhrd.controller1;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model1.MenuDAO;
import com.smhrd.model1.MenuVO;
import com.smhrd.model1.StoreDAO;
import com.smhrd.model1.StoreVO;


public class StoreDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// serch.jsp에서 a태그 href 타고 온 것
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		//스토어 id 받아오기
		int store_id=0;
		String user_Id="";
		try {
			store_id= Integer.parseInt(request.getParameter("storeId"));
		} catch (Exception e) {
			user_Id = request.getParameter("user_id");
		}
		System.out.println(store_id);
		System.out.println(user_Id);
		
		
		
		
		//스토어 객체 받아오기
		StoreDAO storeDAOs= new StoreDAO();
		StoreVO storeVOs=null;

		if(store_id!=0) {
		storeVOs =  storeDAOs.store_Select_Storeid(store_id);
		}else {
		storeVOs =  storeDAOs.mystoreselect(user_Id);	
		}
		
		
		//menu 객체 받아오기 
		MenuDAO menuDAOs=new MenuDAO();
		ArrayList<MenuVO> menulist=new ArrayList<MenuVO>();
		
		if(store_id!=0) {
			menulist =  menuDAOs.menuSelect(store_id);
		}else {
			menulist =  menuDAOs.menu_Select_user_id(user_Id);	
		}
		
		
			

			try {//예약하기 페이지로 재활용
				String send = request.getParameter("send");
				System.out.println("예약하기"+send);
				HttpSession session = request.getSession();
				request.setAttribute("store_info", storeVOs);
				request.setAttribute("menu_info", menulist);
				RequestDispatcher rdi = request.getRequestDispatcher(send);
	    		rdi.forward(request, response);
			} catch (Exception e) {
				
				if(storeVOs!=null) {
					HttpSession session = request.getSession();
					request.setAttribute("store_info", storeVOs);
					request.setAttribute("menu_info", menulist);
					RequestDispatcher rdi = request.getRequestDispatcher("Storedtail.jsp");
					rdi.forward(request, response);
					
					
				}else{
					response.sendRedirect("Main.jsp");
				}
				
			}
		
		
		
		
		
	}

}
