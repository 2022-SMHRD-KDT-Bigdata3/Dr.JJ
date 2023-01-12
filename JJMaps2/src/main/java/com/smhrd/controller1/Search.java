package com.smhrd.controller1;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model1.MenuDAO;
import com.smhrd.model1.MenuVO;
import com.smhrd.model1.StoreDAO;
import com.smhrd.model1.StoreVO;

public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//검색어 추출
		request.setCharacterEncoding("UTF-8");
		String searchWord = request.getParameter("searchWord");
		
		//dao 호출하여 점포 db에서 쿼리조회 및 점포 리스트 반환 
		StoreDAO StoreDAOs = new StoreDAO();
		ArrayList<StoreVO> store_list = StoreDAOs.search(searchWord);
		
		//아이디별 점포 메뉴 검색 전체 배열()
		MenuDAO menuDAOs = new MenuDAO();
		ArrayList<ArrayList<MenuVO>> menu_List=new ArrayList<ArrayList<MenuVO>>();
		for (StoreVO storeVO : store_list) {
			menu_List.add(menuDAOs.menuSelect(storeVO.getStore_Id()));	
		}
		
		
		
		if (store_list.size() != 0) {
			
			System.out.println("검색 성공!");
			request.setAttribute("store_list", store_list);
			request.setAttribute("menu_List", menu_List);
			
			RequestDispatcher rdi = request.getRequestDispatcher("Search.jsp");
			rdi.forward(request, response);
			
		}else {

			System.out.println("검색 실패..");
			response.sendRedirect("Main.jsp");
			
		}
		

		
	}

}
