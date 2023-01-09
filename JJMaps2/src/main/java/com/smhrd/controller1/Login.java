package com.smhrd.controller1;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model1.MemberDAO;
import com.smhrd.model1.MemberVO;


public class Login extends HttpServlet {
   private static final long serialVersionUID = 1L;


   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



         String userId = request.getParameter("userId");
         String userPw = request.getParameter("userPw");
         
         MemberVO vo =new MemberVO(userId,userPw);
         MemberDAO dao = new MemberDAO();
      

         // 로그인 성공시에 개인정보를 받아와야 하니까 Vo 객체에 담아줌
         MemberVO info = dao.login(vo);

         if (info != null) {
            System.out.println("로그인 성공");
            System.out.println(info.toString());

            // session 영역에 로그인 된 정보 저장하기!
            // jsp 에서는 세션이 내장객체지만 서블릿에서는 객체호출하고, 임포트 해주어야 한다.
            HttpSession session = request.getSession();
            session.setAttribute("info", info);

         } else {
            System.out.println("로그인 실패...");
         }
         
         response.sendRedirect("Main.jsp");
      }


}