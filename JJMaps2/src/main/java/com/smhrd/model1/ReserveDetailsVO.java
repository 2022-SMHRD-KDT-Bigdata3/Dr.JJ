package com.smhrd.model1;

//예약 상세
public class ReserveDetailsVO {

 // 예약상세 순번
 private Long rd_Id;

 // 메뉴 아이디
 private Long menu_Id;

 // 예약 번호
 private Long r_Number;

 // 주문 수량
 private Long menu_Cnt;
 
 private int menu_Price;

 
 
 
 
 
public Long getRd_Id() {
	return rd_Id;
}






public Long getMenu_Id() {
	return menu_Id;
}






public Long getR_Number() {
	return r_Number;
}






public Long getMenu_Cnt() {
	return menu_Cnt;
}






public void setRd_Id(Long rd_Id) {
	this.rd_Id = rd_Id;
}






public void setMenu_Id(Long menu_Id) {
	this.menu_Id = menu_Id;
}






public void setR_Number(Long r_Number) {
	this.r_Number = r_Number;
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






@Override
public String toString() {
	return "ReserveDetailsVO [rd_Id=" + rd_Id + ", menu_Id=" + menu_Id + ", r_Number=" + r_Number + ", menu_Cnt="
			+ menu_Cnt + "]";
}






public ReserveDetailsVO(Long rd_Id, Long menu_Id, Long r_Number, Long menu_Cnt,int menu_Price) {
	super();
	this.rd_Id = rd_Id;
	this.menu_Id = menu_Id;
	this.r_Number = r_Number;
	this.menu_Cnt = menu_Cnt;
	this.menu_Price = menu_Price;
}






public ReserveDetailsVO() {
	super();
}






public ReserveDetailsVO(Long menu_Id, Long r_Number, Long menu_Cnt,int menu_Price) {
	super();
	this.menu_Id = menu_Id;
	this.r_Number = r_Number;
	this.menu_Cnt = menu_Cnt;
	this.menu_Price = menu_Price;
}

 
 
 
 
}