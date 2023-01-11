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

public class MenuUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//메뉴 받아오기
		request.setCharacterEncoding("UTF-8");
		String[] menu_Name = request.getParameterValues("menu_Name");
		String[] menu_Price = request.getParameterValues("menu_Price");
		String[] menu_Detail = request.getParameterValues("menu_Detail");
		System.out.println(menu_Detail.length);
		
		//로그인계정
		HttpSession session = request.getSession();
		MemberVO info = (MemberVO)session.getAttribute("info");
		String user_id =info.getUser_Id();
		
		//점포 id 가져오기
		StoreDAO StoreDAOs = new StoreDAO();
		Integer store_id = StoreDAOs.getStoreId(user_id); 
		
		// dao 호출, 기존 메뉴 삭제하기
		MenuDAO MenuDAOs = new MenuDAO();
		int D_res = MenuDAOs.MenuDeleteAll(user_id);
		if(D_res>0) {System.out.println("메뉴 삭제 성공");
		}else {System.out.println("메뉴 삭제 실패..");}
		
		
		//새로 작성한 메뉴 객체 묶기, insert 매퍼로 보내기 
		int I_res=0;
		
		for(int i=0; i<menu_Name.length; i++) {
		MenuVO vo = new MenuVO(store_id ,user_id,menu_Name[i],menu_Price[i],menu_Detail[i]);
		I_res = MenuDAOs.MenuInsert(vo);
		
		if(I_res>0) {System.out.println("메뉴"+i+" 등록 성공!");
		}else {System.out.println("메뉴등록실패..");
		};
		
		}
		
		response.sendRedirect("Mystore.jsp");
	}
		
	}


