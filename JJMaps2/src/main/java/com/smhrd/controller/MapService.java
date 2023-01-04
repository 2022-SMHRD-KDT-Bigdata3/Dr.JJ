package com.smhrd.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.StoreDAO;
import com.smhrd.model.StoreVO;


public class MapService extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StoreDAO dao = new StoreDAO();
		String store_cate = request.getParameter("store_cate");
		ArrayList<StoreVO> S_List = dao.storeCateSelect(store_cate);
	}

}
