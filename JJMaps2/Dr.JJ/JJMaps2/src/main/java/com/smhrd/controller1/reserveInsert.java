package com.smhrd.controller1;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model1.MenuDAO;
import com.smhrd.model1.ReservationDAO;
import com.smhrd.model1.ReservationVO;
import com.smhrd.model1.ReserveDetailsDAO;
import com.smhrd.model1.ReserveDetailsVO;
import com.smhrd.model1.StoreDAO;
import com.smhrd.model1.StoreVO;

public class reserveInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//RESERVATIONS vo 묶기
		Integer store_Id = Integer.parseInt(request.getParameter("store_Id"));
		String user_Id = request.getParameter("user_Id");
		String r_time = request.getParameter("r_time");
		String p_time = request.getParameter("p_time");
		ReservationVO rVo = new ReservationVO(store_Id,user_Id,r_time,p_time);
		
		
		// RESERVATIONS insert 하고 예약 번호 받아오기
		ReservationDAO reservationDAOs=new ReservationDAO();
		int res= reservationDAOs.create_r_num(rVo);
		if(res>0) {System.out.println("예약성공");}
		ReservationVO ReservationVOs= reservationDAOs.r_num_select(rVo);
		long r_Number = (long)ReservationVOs.getR_number();
		System.out.println("예약번호 발급 :"+r_Number);

		
		
		// input 받은 메뉴 아이디 배열과 가격 추출 + 메뉴 이름도 
		MenuDAO menuDAOs=new MenuDAO();
		String[] menu_list = request.getParameterValues("reserve_list");//input받은 메뉴 형변환 필요
		System.out.println(Arrays.toString(menu_list));
		ArrayList<Long> menu_Id_list = new ArrayList<Long>();//메뉴 id 리스트
		ArrayList<Integer> price_list = new ArrayList<Integer>();//메뉴 단가 리스트
		ArrayList<String> menu_name = new ArrayList<String>();//메뉴 이름 
		for(int i=0; i<menu_list.length;i++) {
			Long menu= Long.parseLong(menu_list[i]);
			menu_Id_list.add(menu);	
			int price = menuDAOs.select_price(Integer.parseInt(menu_list[i]));
			price_list.add(price);
			String menuname = menuDAOs.select_name(menu);
			menu_name.add(menuname);
			
		}
		
		
		
		//메뉴 전체 수량 
		String[] food_count = request.getParameterValues("food_count");
		System.out.println(Arrays.toString(food_count));
		//input 받은 메뉴 수량만 추출
		ArrayList<Long> menu_Cnt_list = new ArrayList<Long>();
		for(int i=0; i<food_count.length;i++) {
			if(Integer.parseInt(food_count[i])!=0) {
				Long cnt= Long.parseLong(food_count[i]);
				menu_Cnt_list.add(cnt);		
			}
		}
		System.out.println(menu_Cnt_list.toString());
		
		
		
		// 각 메뉴별로 이름, 수량 묶어서 
		ReserveDetailsDAO r_d_Dao = new ReserveDetailsDAO();
		res=0;
		for(int i=0; i<menu_Cnt_list.size();i++) {
			long menu_Id = menu_Id_list.get(i);
			long menu_Cnt = menu_Cnt_list.get(i);
			int menu_price =price_list.get(i);
		ReserveDetailsVO r_d_VO=new ReserveDetailsVO(menu_Id, r_Number, menu_Cnt, menu_price);
		 res= r_d_Dao.reserve_menu_insert(r_d_VO);
		};
		
		
		
		//예약메뉴리스트
		
		ArrayList<ReserveDetailsVO> now_reserve_menu=r_d_Dao.reserve_detail_select(r_Number);
		ReservationVO now_reserve =  reservationDAOs.select_reseve_by_rnum(r_Number);

		
		
		
		//예약한 집 
		StoreDAO storeDAOs = new StoreDAO();
		StoreVO now_reserve_store = storeDAOs.store_Select_Storeid(store_Id);
		
		if(res>0) {
			System.out.println("예약성공 현재예약으로!");
			HttpSession session = request.getSession();
			System.out.println("메뉴 예약 등록 성공");
			session.setAttribute("now_reserve_menu",now_reserve_menu );
			session.setAttribute("now_menu_Name_list",menu_name );
			session.setAttribute("now_reserve",now_reserve );
			session.setAttribute("now_reserve_store",now_reserve_store );
			response.sendRedirect("Mypage.jsp");
			
		}else {
			System.out.println("에러..");
			
		}
		

		
		
		
	
		
		
		
		
//		java.sql.Date pTime = null;
//		try {
//			Date pTime_1 = new Date(Date.parse(request.getParameter("pTime")));
//			long timeInMilliSeconds = pTime_1.getTime();
//			pTime = new java.sql.Date(timeInMilliSeconds);//java.util.Date 자료형을 java.sql.Date 형으로 변환하는 구문
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		ReservationVO vo = new ReservationVO(store_Id, user_Id, storeMenu, storePrice, pTime);
	
	}
	
}

