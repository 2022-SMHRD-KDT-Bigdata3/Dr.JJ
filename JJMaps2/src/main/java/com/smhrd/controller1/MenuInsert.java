package com.smhrd.controller1;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model1.MemberVO;
import com.smhrd.model1.MenuVO;
import com.smhrd.model1.StoreDAO;

/**
 * Servlet implementation class MenuInsert
 */
public class MenuInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String menu0 = request.getParameter("menu_0");
		String menu0_price = request.getParameter("menu0_price");
		HttpSession session = request.getSession();
		MemberVO info = (MemberVO)session.getAttribute("info");
		String user_id =info.getUser_Id();
		StoreDAO dao = new StoreDAO();
		Integer store_id = dao.getStoreId(user_id); 
		MenuVO vo = new MenuVO(store_id ,menu0,menu0_price);
	}

}
