package com.smhrd.model1;

//예약 상세
public class ReserveDetailsVO {

 // 예약상세 순번
 private Long rdId;

 // 메뉴 아이디
 private Double menuId;

 // 예약 번호
 private Long rNumber;

 // 주문 수량
 private String menuCnt;

 public Long getRdId() {
     return rdId;
 }

 public void setRdId(Long rdId) {
     this.rdId = rdId;
 }

 public Double getMenuId() {
     return menuId;
 }

 public void setMenuId(Double menuId) {
     this.menuId = menuId;
 }

 public Long getRNumber() {
     return rNumber;
 }

 public void setRNumber(Long rNumber) {
     this.rNumber = rNumber;
 }

 public String getMenuCnt() {
     return menuCnt;
 }

 public void setMenuCnt(String menuCnt) {
     this.menuCnt = menuCnt;
 }

 // ReservDetails 모델 복사
 public void CopyData(ReserveDetailsVO param)
 {
     this.rdId = param.getRdId();
     this.menuId = param.getMenuId();
     this.rNumber = param.getRNumber();
     this.menuCnt = param.getMenuCnt();
 }
}