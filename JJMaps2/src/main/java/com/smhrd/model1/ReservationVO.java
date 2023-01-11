package com.smhrd.model1;

import java.sql.Date;

//예약
public class ReservationVO {

 public ReservationVO(Integer storeId, String userId, String storeMenu, String storePrice, Date pTime) {
		super();
		this.storeId = storeId;
		this.userId = userId;
		this.storeMenu = storeMenu;
		this.storePrice = storePrice;
		this.pTime = pTime;
	}

// 예약 번호
 private Long rNumber;

 // 가게 아이디
 private Integer storeId;

 // 예약자 아이디
 private String userId;

 // 가게 메뉴
 private String storeMenu;

 // 음식 가격
 private String storePrice;

 // 예약 시간
 private Date rTime;

 // 픽업 시간
 private Date pTime;

 public Long getRNumber() {
     return rNumber;
 }

 public void setRNumber(Long rNumber) {
     this.rNumber = rNumber;
 }

 public Integer getStoreId() {
     return storeId;
 }

 public void setStoreId(Integer storeId) {
     this.storeId = storeId;
 }

 public String getUserId() {
     return userId;
 }

 public void setUserId(String userId) {
     this.userId = userId;
 }

 public String getStoreMenu() {
     return storeMenu;
 }

 public void setStoreMenu(String storeMenu) {
     this.storeMenu = storeMenu;
 }

 public String getStorePrice() {
     return storePrice;
 }

 public void setStorePrice(String storePrice) {
     this.storePrice = storePrice;
 }

 public Date getRTime() {
     return rTime;
 }

 public void setRTime(Date rTime) {
     this.rTime = rTime;
 }

 public Date getPTime() {
     return pTime;
 }

 public void setPTime(Date pTime) {
     this.pTime = pTime;
 }

 // Reservations 모델 복사
 public void CopyData(ReservationVO param)
 {
     this.rNumber = param.getRNumber();
     this.storeId = param.getStoreId();
     this.userId = param.getUserId();
     this.storeMenu = param.getStoreMenu();
     this.storePrice = param.getStorePrice();
     this.rTime = param.getRTime();
     this.pTime = param.getPTime();
 }
}
