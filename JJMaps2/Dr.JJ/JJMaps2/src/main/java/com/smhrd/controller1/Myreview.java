package com.smhrd.controller1;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model1.MemberVO;
import com.smhrd.model1.ReviewDAO;
import com.smhrd.model1.ReviewVO;


public class Myreview extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO info = (MemberVO)session.getAttribute("info");
		String user_id =info.getUser_Id();
		System.out.println(info.toString());
		ReviewDAO Rdao = new ReviewDAO();
		ArrayList<ReviewVO> list = Rdao.myReview(user_id);
		for(int i=0;i<list.size();i++) {
			System.out.println(list.toString());
		}
		request.setAttribute("myReview", list);
		RequestDispatcher rdi = request.getRequestDispatcher("Myreview.jsp");
		rdi.forward(request, response);
	}

}
