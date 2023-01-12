package com.smhrd.controller1;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
			System.out.println(store_id);
		} catch (Exception e) {
			user_Id = request.getParameter("user_id");
			System.out.println(user_Id);
		}
		
		
		
		
		//스토어 객체 받아오기
		StoreDAO dao =  new StoreDAO();
		StoreVO vo=null;

		if(store_id!=0) {
		vo =  dao.store_Select_Storeid(store_id);
		}else {
		vo =  dao.mystoreselect(user_Id);	
		}
					
		
		if(vo!=null) {
			HttpSession session = request.getSession();
			request.setAttribute("store_info", vo);
			RequestDispatcher rdi = request.getRequestDispatcher("Storedtail.jsp");
    		rdi.forward(request, response);
            
			
		}else{
			response.sendRedirect("Main.jsp");
		}
		
		
	}

}
