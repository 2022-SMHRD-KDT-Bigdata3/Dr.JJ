package com.smhrd.controller1;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model1.MemberVO;
import com.smhrd.model1.MenuDAO;
import com.smhrd.model1.MenuVO;


public class Menucheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//로그인계정
		HttpSession session = request.getSession();
		MemberVO info = (MemberVO)session.getAttribute("info");
		String user_id =info.getUser_Id();
		System.out.println(info.toString());
		//메뉴 등록했는지 확인 
		MenuDAO MenuDAOs = new MenuDAO();
		ArrayList<MenuVO> menulist = MenuDAOs.menu_Select_user_id(user_id);
		System.out.println(menulist.size());
		if(menulist.size()!=0) {

    		request.setAttribute("menulist", menulist);
    		RequestDispatcher rdi = request.getRequestDispatcher("MenuUpdate.jsp");
    		rdi.forward(request, response);
            
		}else {
			response.sendRedirect("MenuInsert.jsp");
		}
		
	}

}
