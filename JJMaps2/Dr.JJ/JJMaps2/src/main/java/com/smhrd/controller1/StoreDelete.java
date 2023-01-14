package com.smhrd.controller1;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model1.MemberDAO;
import com.smhrd.model1.MemberVO;
import com.smhrd.model1.MenuDAO;
import com.smhrd.model1.StoreDAO;


public class StoreDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//로그인 계정 id 추출
		HttpSession session = request.getSession();
		MemberVO memberVOs = (MemberVO)session.getAttribute("info");
		String user_Id = memberVOs.getUser_Id();
		
		//스토어 db에서 삭제
		StoreDAO StoreDAOs = new StoreDAO();
		int res = StoreDAOs.StoreDelete(user_Id);
		if(res>0) {System.out.println("점포 삭제 성공!");}
		
		//메뉴 db에서 삭제
		MenuDAO menuDAOs=new MenuDAO();
		res = menuDAOs.MenuDeleteAll(user_Id);
		if(res>0) {System.out.println("점포 메뉴 삭제 성공!");}
		
		//유저코드 다시 0으로 
		MemberDAO MemberDAOs=new MemberDAO();
		memberVOs=MemberDAOs.usercode_to_zero(user_Id);
		
		
		if(res>0) {
			session.setAttribute("info", memberVOs);
            response.sendRedirect("Mypage.jsp");
			
		}else {
			System.out.println("점포 삭제 실패..");
            response.sendRedirect("Mystore.jsp");
		}
		
		
	
	}

}
