package com.smhrd.controller1;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.smhrd.model1.MemberDAO;
import com.smhrd.model1.MemberVO;
import com.smhrd.model1.StoreDAO;


public class StoreDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberVO memberVOs = (MemberVO)session.getAttribute("info");
		StoreDAO dao = new StoreDAO();
		int res = dao.StoreDelete(memberVOs.getUser_Id());
		
		MemberDAO MemberDAOs=new MemberDAO();
		//memberVOs=MemberDAOs.usercodeDelete(user_Id);
		
		
		if(res>0) {
			System.out.println("점포 삭제 성공!");
            //session.setAttribute("Storeinfo", vo);
			session.setAttribute("info", memberVOs);
            response.sendRedirect("Mypage.jsp");
			
		}else {
			System.out.println("점포 삭제 실패..");
		}
		
		
	
	}

}
