package com.smhrd.controller1;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model1.MemberVO;
import com.smhrd.model1.MenuDAO;
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
		String menu1 = request.getParameter("menu_1");
		String menu1_price = request.getParameter("menu1_price");
		String menu2 = request.getParameter("menu_2");
		String menu2_price = request.getParameter("menu2_price");
		String menu3 = request.getParameter("menu_3");
		String menu3_price = request.getParameter("menu3_price");
		
		HttpSession session = request.getSession();
		MemberVO info = (MemberVO)session.getAttribute("info");
		String user_id =info.getUser_Id();
		StoreDAO dao = new StoreDAO();
		Integer store_id = dao.getStoreId(user_id); 
		MenuVO vo = new MenuVO(store_id ,menu0,menu0_price);
		MenuVO vo1 = new MenuVO(store_id ,menu1,menu1_price);
		MenuVO vo2= new MenuVO(store_id ,menu2,menu2_price);
		MenuVO vo3 = new MenuVO(store_id ,menu3,menu3_price);
		System.out.println(vo.toString());
		MenuDAO dao1 = new MenuDAO();//메뉴다오
		int res = dao1.menuInsert(vo);
		if(res>0) {
			System.out.println("메뉴삽입 성공!");
		}else {
			System.out.println("메뉴삽입 실패...");
		} 
		int res1 = dao1.menuInsert(vo1);
		if(res>0) {
			System.out.println("메뉴삽입1 성공!");
		}else {
			System.out.println("메뉴삽입1 실패...");
		} 
		int res2 = dao1.menuInsert(vo2);
		if(res>0) {
			System.out.println("메뉴삽입2 성공!");
		}else {
			System.out.println("메뉴삽입2 실패...");
		} 
		int res3 = dao1.menuInsert(vo3);
		if(res>0) {
			System.out.println("메뉴삽입3 성공!");
		}else {
			System.out.println("메뉴삽입3 실패...");
		} 
	}

}
