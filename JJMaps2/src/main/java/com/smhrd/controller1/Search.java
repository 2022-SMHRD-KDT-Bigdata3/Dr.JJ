package com.smhrd.controller1;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model1.StoreDAO;
import com.smhrd.model1.StoreVO;

public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String searchWord = request.getParameter("searchWord");
		
		
		StoreDAO dao = new StoreDAO();

		ArrayList<StoreVO> list = dao.search(searchWord);
		if (list != null) {
			
			System.out.println("검색 성공!");
			for(int i=0;i<4;i++) {
				System.out.println(list.get(i).getStore_Name());
			}
			request.setAttribute("searchWord", list);
			
			RequestDispatcher rdi = request.getRequestDispatcher("Search.jsp");
			rdi.forward(request, response);
		}else {
			System.out.println("검색 실패..");
			response.sendRedirect("error.jsp");
			
		}
		

		
	}

}
