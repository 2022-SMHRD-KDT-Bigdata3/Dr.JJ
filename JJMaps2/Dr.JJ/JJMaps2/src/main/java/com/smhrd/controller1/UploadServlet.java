package com.smhrd.controller1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.model1.MemberVO;
import com.smhrd.model1.ReviewDAO;
import com.smhrd.model1.ReviewVO;


public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		MemberVO info = (MemberVO)session.getAttribute("info");
		String user_id = info.getUser_Id();
		String savePath = "upload";
		// 최대 업로드 파일 크기 5MB로 제한
		int uploadFileSizeLimit = 5 * 1024 * 1024;
		String encType = "UTF-8";
		ServletContext context = getServletContext();
		String uploadFilePath = "C:/Users/smhrd/Documents/카카오톡 받은 파일/JJMaps2 (1)/src/main/webapp/upload";
		//uploadFilePath => 파일 실제 저장경로임 !!! 다른곳에 프로젝트를 저장하고 실행했을경우 바꿔주어야함
		
		try {
			MultipartRequest multi = new MultipartRequest(request, // request 객체
					uploadFilePath, // 서버상의 실제 디렉토리
					uploadFileSizeLimit, // 최대 업로드 파일 크기
					encType, // 인코딩 방법
					// 동일한 이름이 존재하면 새로운 이름이 부여됨
					new DefaultFileRenamePolicy());
				String reviewPic = "http://localhost:14510/JJMap2/upload/"+multi.getFilesystemName("uploadFile");
				System.out.println(reviewPic);
				int store_id = Integer.parseInt(multi.getParameter("store_id"));
				System.out.println(store_id);
				int reviewScore = Integer.parseInt(multi.getParameter("reviewStar"));
				String review_title =multi.getParameter("title");
				String reviewContent =multi.getParameter("content");
				ReviewVO vo = new ReviewVO(store_id,review_title, reviewContent, reviewScore, reviewPic, user_id);
				System.out.println(vo);
				System.out.println(uploadFilePath);
				ReviewDAO dao = new ReviewDAO();
				int res = dao.insert(vo);
				if(res>0) {
					System.out.println("리뷰작성 성공");
					RequestDispatcher rdi = request.getRequestDispatcher("Main.jsp");
		    		rdi.forward(request, response);
				
				}else {
					System.out.println("리뷰작성 실패");
					RequestDispatcher rdi = request.getRequestDispatcher("Main.jsp");
		    		rdi.forward(request, response);
					
				}
			// else
		} catch (Exception e) {
			System.out.print("예외 발생 : " + e);
		}// catch
		
	
	}
}
