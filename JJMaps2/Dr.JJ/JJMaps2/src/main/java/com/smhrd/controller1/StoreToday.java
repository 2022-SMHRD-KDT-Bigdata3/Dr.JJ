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

public class StoreToday extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		
		//스토어 주인 user id 추출
		HttpSession session = request.getSession();
		MemberVO info = (MemberVO)session.getAttribute("info");
		String user_id = info.getUser_Id();
		
		//스토어 vo 추출
		StoreDAO sdao = new StoreDAO();
		StoreVO svo = new StoreVO();
		StoreVO store_info = sdao.mystoreselect(user_id);
		
        if (store_info != null) {
            System.out.println(store_info.toString());

            session.setAttribute("store_info", store_info);
            response.sendRedirect("StoreToday.jsp");

         } else {
            System.out.println("스토어 조회 실패");
            response.sendRedirect("Mystore.jsp");
         }
		
	}

}
