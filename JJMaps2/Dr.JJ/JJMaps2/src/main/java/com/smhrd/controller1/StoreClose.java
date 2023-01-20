package com.smhrd.controller1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model1.StoreDAO;
import com.smhrd.model1.StoreVO;


public class StoreClose extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		//스토어 주인 user id 추출
		HttpSession session = request.getSession();
		StoreVO store_info = (StoreVO)session.getAttribute("store_info");
		Integer store_id = store_info.getStore_Id();
		StoreDAO sdao = new StoreDAO();
		int res = sdao.Store_close(store_id);
		
		
		if(res>0) {
		System.out.println("점포 종료");
		response.sendRedirect("Mystore.jsp");
		}else {
		System.out.println("점포종료 실패");
	}
		
		
	}

}
