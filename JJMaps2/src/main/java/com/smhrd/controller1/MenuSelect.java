package com.smhrd.controller1;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model1.MenuDAO;
import com.smhrd.model1.MenuVO;

/**
 * Servlet implementation class MenuSelect
 */
public class MenuSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MenuDAO dao = new MenuDAO();
		ArrayList<MenuVO> list =dao.menuSelectAll();
	}
}
