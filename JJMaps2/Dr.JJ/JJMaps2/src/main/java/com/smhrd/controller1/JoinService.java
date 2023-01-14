package com.smhrd.controller1;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model1.MemberDAO;
import com.smhrd.model1.MemberVO;


public class JoinService extends HttpServlet {
	private static final long serialVersionUID = 1L;


	   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   
		   request.setCharacterEncoding("UTF-8");
	          String user_Id = request.getParameter("user_Id");
	          String user_Pw = request.getParameter("user_Pw");
	          String user_Nick = request.getParameter("user_Nick");
	            
	          MemberVO vo =new MemberVO(user_Id,user_Pw,user_Nick);
	          MemberDAO dao = new MemberDAO();
	          System.out.println(vo.toString());
	          int res = dao.join(vo);
	          
	          if (res>0) {
	             System.out.println("회원가입 성공!");
	     		response.sendRedirect("Login.jsp");
	         
		      }else {
		    	 
		         System.out.println("회원가입 실패..");
		         response.sendRedirect("Join.jsp");
	         
	      }
	      
	   }
}
