package com.smhrd.controller1;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.smhrd.model1.MenuDAO;
import com.smhrd.model1.MenuVO;

/**
 * Servlet implementation class MenuSelect
 */
public class MenuSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MenuDAO dao = new MenuDAO();
		String store_id = (String) session.getAttribute("store_id");
		ArrayList<MenuVO> list =dao.menuSelect(store_id);
		for(MenuVO vo : list) {
			System.out.println(vo.toString());
		}
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		String result = gson.toJson(list);
		System.out.println(result);
		out.print(result);
		response.sendRedirect("Mystore.jsp");
	}
}
