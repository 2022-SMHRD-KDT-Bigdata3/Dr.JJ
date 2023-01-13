package com.smhrd.model1;

//예약 상세
public class ReserveDetailsVO {

 // 예약상세 순번
 private Long rd_Id;

 // 메뉴 아이디
 private Double menu_Id;

 // 예약 번호
 private Long r_Number;

 // 주문 수량
 private String menu_Cnt;

 
 
 
 
 
public Long getRd_Id() {
	return rd_Id;
}






public Double getMenu_Id() {
	return menu_Id;
}






public Long getR_Number() {
	return r_Number;
}






public String getMenu_Cnt() {
	return menu_Cnt;
}






public void setRd_Id(Long rd_Id) {
	this.rd_Id = rd_Id;
}






public void setMenu_Id(Double menu_Id) {
	this.menu_Id = menu_Id;
}






public void setR_Number(Long r_Number) {
	this.r_Number = r_Number;
}






public void setMenu_Cnt(String menu_Cnt) {
	this.menu_Cnt = menu_Cnt;
}






@Override
public String toString() {
	return "ReserveDetailsVO [rd_Id=" + rd_Id + ", menu_Id=" + menu_Id + ", r_Number=" + r_Number + ", menu_Cnt="
			+ menu_Cnt + "]";
}






public ReserveDetailsVO(Long rd_Id, Double menu_Id, Long r_Number, String menu_Cnt) {
	super();
	this.rd_Id = rd_Id;
	this.menu_Id = menu_Id;
	this.r_Number = r_Number;
	this.menu_Cnt = menu_Cnt;
}






public ReserveDetailsVO() {
	super();
}

 
 
 
 
}