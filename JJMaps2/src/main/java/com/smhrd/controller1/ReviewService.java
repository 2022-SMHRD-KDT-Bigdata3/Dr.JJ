package com.smhrd.controller1;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model1.MemberVO;
import com.smhrd.model1.StoreDAO;
import com.smhrd.model1.StoreVO;

/**
 * Servlet implementation class ReviewService
 */
public class ReviewService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO memberVOs = (MemberVO)session.getAttribute("info");
		String User_Id= memberVOs.getUser_Id();
		System.out.println("User_Id");
		StoreDAO dao = new StoreDAO();
		StoreVO storeVOs = (StoreVO)request.getAttribute("Storeinfo");
		
		if(storeVOs !=null) {
			request.setAttribute("Storeinfo", storeVOs);
			RequestDispatcher rdi = request.getRequestDispatcher("writeReview.jsp");
    		rdi.forward(request, response);
		}else {
			System.out.println("가게정보 가져오기 실패!");
		}
	}

}
