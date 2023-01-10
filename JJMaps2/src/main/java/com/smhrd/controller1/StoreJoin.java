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

import Geocoder.Geocoder;

public class StoreJoin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		MemberVO memberVOs = (MemberVO)session.getAttribute("info");
		
		String store_Name = request.getParameter("store_Name");
		String store_Addr = request.getParameter("store_Addr");
		String store_Tel = request.getParameter("store_Tel");
		String store_Open_Dt = request.getParameter("store_Open_Dt");
		String store_Close_Dt = request.getParameter("store_Close_Dt");
		int store_Card_Yn = Integer.parseInt(request.getParameter("store_Card_Yn"));
		int store_Status = 0;
		String user_Id = memberVOs.getUser_Id();
		String store_Cate = request.getParameter("store_Cate");
		
		Geocoder geo = new Geocoder();
		Double latitude = (double)geo.findGeoPoint(store_Addr)[0];
		Double Longitude = (double)geo.findGeoPoint(store_Addr)[1];
		
		StoreVO vo = new StoreVO(store_Name,store_Addr,store_Tel,store_Open_Dt,store_Close_Dt,store_Card_Yn,store_Status,user_Id,store_Cate,latitude,Longitude);
		StoreDAO dao = new StoreDAO();
		int res = dao.StoreJoin(vo);
		
		if (res>0) {
			System.out.println("점포등록 성공!");
			response.sendRedirect("Mystore.jsp");
			
		}else {
			System.out.println("점포등록 실패..");
			
		}
		
		
	}

}
