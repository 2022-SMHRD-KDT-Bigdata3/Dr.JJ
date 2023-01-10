package com.smhrd.controller1;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model1.MemberVO;
import com.smhrd.model1.StoreDAO;
import com.smhrd.model1.StoreVO;


public class StoreSelectService extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//내 점포 조회에 사용하는 서블릿
		HttpSession session = request.getSession();
		MemberVO memberVOs = (MemberVO)session.getAttribute("info");
		String memberID= memberVOs.getUser_Id();
		
	
		
		
		 
	}

}
