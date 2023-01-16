package com.smhrd.model1;

public class ReservationJoinVO {



	// 예약 번호
	 private Long r_number;

	 // 가게 아이디
	 private Integer store_Id;

	 // 예약자 아이디
	 private String user_Id;


	 // 예약 시간
	 private String r_time;

	 // 픽업 시간 
	 private String p_time;
	 
	 private int isCooking;
	 



	//예약 상세


	 // 예약상세 순번
	 private Long rd_Id;

	 // 메뉴 아이디
	 private Long menu_Id;

	 // 예약 번호
	 private Long r_Number_1;

	 // 주문 수량
	 private Long menu_Cnt;
	 
	 private int menu_Price;

	 
	 

		public ReservationJoinVO(Long rd_Id, Long menu_Id, Long r_Number_1, Long menu_Cnt, int menu_Price,Long r_number, Integer store_Id, String user_Id, String r_time, String p_time,
				int isCooking) {
			super();
			this.r_number = r_number;
			this.store_Id = store_Id;
			this.user_Id = user_Id;
			this.r_time = r_time;
			this.p_time = p_time;
			this.isCooking = isCooking;
			this.rd_Id = rd_Id;
			this.menu_Id = menu_Id;
			this.r_Number_1 = r_Number_1;
			this.menu_Cnt = menu_Cnt;
			this.menu_Price = menu_Price;
		}




		public Long getR_number() {
			return r_number;
		}




		public void setR_number(Long r_number) {
			this.r_number = r_number;
		}




		public Integer getStore_Id() {
			return store_Id;
		}




		public void setStore_Id(Integer store_Id) {
			this.store_Id = store_Id;
		}




		public String getUser_Id() {
			return user_Id;
		}




		public void setUser_Id(String user_Id) {
			this.user_Id = user_Id;
		}




		public String getR_time() {
			return r_time;
		}




		public void setR_time(String r_time) {
			this.r_time = r_time;
		}




		public String getP_time() {
			return p_time;
		}




		public void setP_time(String p_time) {
			this.p_time = p_time;
		}




		public int getIsCooking() {
			return isCooking;
		}




		public void setIsCooking(int isCooking) {
			this.isCooking = isCooking;
		}




		public Long getRd_Id() {
			return rd_Id;
		}




		public void setRd_Id(Long rd_Id) {
			this.rd_Id = rd_Id;
		}




		public Long getMenu_Id() {
			return menu_Id;
		}




		public void setMenu_Id(Long menu_Id) {
			this.menu_Id = menu_Id;
		}




		public Long getR_Number_1() {
			return r_Number_1;
		}




		public void setR_Number_1(Long r_Number_1) {
			this.r_Number_1 = r_Number_1;
		}




		public Long getMenu_Cnt() {
			return menu_Cnt;
		}




		public void setMenu_Cnt(Long menu_Cnt) {
			this.menu_Cnt = menu_Cnt;
		}




		public int getMenu_Price() {
			return menu_Price;
		}




		public void setMenu_Price(int menu_Price) {
			this.menu_Price = menu_Price;
		}

	 
	 
	 
	 
	 
	 
	}

