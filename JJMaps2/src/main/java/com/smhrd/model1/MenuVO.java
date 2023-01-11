package com.smhrd.model1;

//메뉴
public class MenuVO {



// 메뉴 아이디
 private int menu_Id;

 // 가게 아이디
 private int store_id;

 // 메뉴 명
 private String menu_Name;

 // 메뉴 가격
 private String menu_Price;

 // 메뉴 사진1
 private String menu_Pic1;

 // 메뉴 사진2
 private String menu_Pic2;

 // 메뉴 사진3
 private String menu_Pic3;
 
 
 private String user_Id;
 
 
 private String menu_details;

 
 
 
 
 

public MenuVO() {

}



public MenuVO(int store_id, String user_Id, String menu_Name, String menu_Price, String menu_details) {
	super();
	this.store_id = store_id;
	this.user_Id = user_Id;
	this.menu_Name = menu_Name;
	this.menu_Price = menu_Price;
	this.menu_details = menu_details;
}




public MenuVO(int menu_Id, int store_id, String menu_Name, String menu_Price, String menu_Pic1, String menu_Pic2,
		String menu_Pic3, String user_Id, String menu_details) {
	super();
	this.menu_Id = menu_Id;
	this.store_id = store_id;
	this.menu_Name = menu_Name;
	this.menu_Price = menu_Price;
	this.menu_Pic1 = menu_Pic1;
	this.menu_Pic2 = menu_Pic2;
	this.menu_Pic3 = menu_Pic3;
	this.user_Id = user_Id;
	this.menu_details = menu_details;
}


public int getMenu_Id() {
	return menu_Id;
}


public int getStore_id() {
	return store_id;
}


public String getMenu_Name() {
	return menu_Name;
}


public String getMenu_Price() {
	return menu_Price;
}


public String getMenu_Pic1() {
	return menu_Pic1;
}


public String getMenu_Pic2() {
	return menu_Pic2;
}


public String getMenu_Pic3() {
	return menu_Pic3;
}


public String getUser_Id() {
	return user_Id;
}


public String getMenu_details() {
	return menu_details;
}


public void setMenu_Id(int menu_Id) {
	this.menu_Id = menu_Id;
}


public void setStore_id(int store_id) {
	this.store_id = store_id;
}


public void setMenu_Name(String menu_Name) {
	this.menu_Name = menu_Name;
}


public void setMenu_Price(String menu_Price) {
	this.menu_Price = menu_Price;
}


public void setMenu_Pic1(String menu_Pic1) {
	this.menu_Pic1 = menu_Pic1;
}


public void setMenu_Pic2(String menu_Pic2) {
	this.menu_Pic2 = menu_Pic2;
}


public void setMenu_Pic3(String menu_Pic3) {
	this.menu_Pic3 = menu_Pic3;
}


public void setUser_Id(String user_Id) {
	this.user_Id = user_Id;
}


public void setMenu_details(String menu_details) {
	this.menu_details = menu_details;
}


@Override
public String toString() {
	return "MenuVO [menu_Id=" + menu_Id + ", store_id=" + store_id + ", menu_Name=" + menu_Name + ", menu_Price="
			+ menu_Price + ", menu_Pic1=" + menu_Pic1 + ", menu_Pic2=" + menu_Pic2 + ", menu_Pic3=" + menu_Pic3
			+ ", user_Id=" + user_Id + ", menu_details=" + menu_details + "]";
}
 
 
 
 
 
}
