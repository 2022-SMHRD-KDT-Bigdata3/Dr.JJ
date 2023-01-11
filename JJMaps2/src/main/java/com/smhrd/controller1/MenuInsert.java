package com.smhrd.controller1;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model1.MenuVO;

/**
 * Servlet implementation class MenuInsert
 */
public class MenuInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String menu0 = request.getParameter("menu_0");
		String menu0_price = request.getParameter("menu0_price");
		MenuVO vo = new MenuVO(menu0,menu0_price);
	}

}
