package com.smhrd.controller1;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model1.MenuDAO;
import com.smhrd.model1.MenuVO;
import com.smhrd.model1.ReviewDAO;
import com.smhrd.model1.StoreDAO;
import com.smhrd.model1.StoreVO;

public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//검색어 추출 (검색어 입력 안할시 검색 실패 페이지 연결)
		request.setCharacterEncoding("UTF-8");
		String searchWord= request.getParameter("searchWord");
		searchWord=searchWord.trim();
			System.out.println("검색단어:"+searchWord);
			
		if (searchWord==null || searchWord.equals("")) {
			System.out.println("검색 실패..");
			request.setAttribute("searchWord", "");
			
			RequestDispatcher rdi = request.getRequestDispatcher("SearchResultEmpty.jsp");
			rdi.forward(request, response);}
		
		//dao 호출하여 점포 db에서 쿼리조회 및 점포 리스트 반환 
		StoreDAO StoreDAOs = new StoreDAO();
		ArrayList<StoreVO> store_list = StoreDAOs.search(searchWord);
		ReviewDAO Rdao = new ReviewDAO();
		ArrayList<Double> avgScore = new ArrayList<Double>();
		for(int i=0;i<store_list.size();i++) {
			avgScore.add(Rdao.avgScores(store_list.get(i).getStore_Id()));
		}
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
			request.setAttribute("Scores", avgScore);
			RequestDispatcher rdi = request.getRequestDispatcher("Search.jsp");
			rdi.forward(request, response);
			
		}else {

			System.out.println("검색 실패..");
			request.setAttribute("searchWord", searchWord);
			
			RequestDispatcher rdi = request.getRequestDispatcher("SearchResultEmpty.jsp");
			rdi.forward(request, response);
			
		}
		

		
	}

}
