package com.smhrd.controller1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model1.MemberDAO;
import com.smhrd.model1.MemberVO;


public class IdCheckService extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//입력한 ID값 가져오기
		request.setCharacterEncoding("UTF-8");
		String user_Id = request.getParameter("user_Id");
		
		//DAO 호출 중복체크 매퍼 전송
		MemberDAO dao = new MemberDAO();
		MemberVO check = dao.idCheck(user_Id);
		
		//출력 스트림 호출
		PrintWriter out = response.getWriter();
		
		if(check != null) {
			System.out.println("중복된 회원이 존재함");
			out.print("{\"idCheck\" : \"NO\"}");
		}else {
			System.out.println("중복된 회원이 존재하지 않음");
			out.print("{\"idCheck\" : \"OK\"}");
		}
		
	}

}
