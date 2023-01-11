package com.smhrd.model1;

//메뉴
public class MenuVO {



// 메뉴 아이디
 private Double menuId;

 // 가게 아이디
 private Integer store_id;

 // 메뉴 명
 private String menuName;

 // 메뉴 가격
 private String menuPrice;

 // 메뉴 사진1
 private String menuPic1;

 // 메뉴 사진2
 private String menuPic2;

 // 메뉴 사진3
 private String menuPic3;
 public MenuVO(Integer store_id, String menuName, String menuPrice) {
		super();
		this.store_id = store_id;
		this.menuName = menuName;
		this.menuPrice = menuPrice;
	}

 public Double getMenuId() {
     return menuId;
 }

 public void setMenuId(Double menuId) {
     this.menuId = menuId;
 }

 public Integer getstore_id() {
     return store_id;
 }

 public void setstore_id(Integer store_id) {
     this.store_id = store_id;
 }

 public String getMenuName() {
     return menuName;
 }

 public void setMenuName(String menuName) {
     this.menuName = menuName;
 }

 public String getMenuPrice() {
     return menuPrice;
 }

 public void setMenuPrice(String menuPrice) {
     this.menuPrice = menuPrice;
 }

 public String getMenuPic1() {
     return menuPic1;
 }

 public void setMenuPic1(String menuPic1) {
     this.menuPic1 = menuPic1;
 }

 public String getMenuPic2() {
     return menuPic2;
 }

 public void setMenuPic2(String menuPic2) {
     this.menuPic2 = menuPic2;
 }

 public String getMenuPic3() {
     return menuPic3;
 }

 public void setMenuPic3(String menuPic3) {
     this.menuPic3 = menuPic3;
 }

 // Menus 모델 복사
 public void CopyData(MenuVO param)
 {
     this.menuId = param.getMenuId();
     this.store_id = param.getstore_id();
     this.menuName = param.getMenuName();
     this.menuPrice = param.getMenuPrice();
     this.menuPic1 = param.getMenuPic1();
     this.menuPic2 = param.getMenuPic2();
     this.menuPic3 = param.getMenuPic3();
 }
}
