package com.smhrd.model1;

//예약
public class ReservationVO {


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
 

 
 
 
 
 


public Long getR_number() {
   return r_number;
}








public Integer getStore_Id() {
   return store_Id;
}








public String getUser_Id() {
   return user_Id;
}








public String getR_time() {
   return r_time;
}








public String getP_time() {
   return p_time;
}














public void setR_number(Long r_number) {
   this.r_number = r_number;
}








public void setStore_Id(Integer store_Id) {
   this.store_Id = store_Id;
}








public void setUser_Id(String user_Id) {
   this.user_Id = user_Id;
}








public void setR_time(String r_time) {
   this.r_time = r_time;
}








public void setP_time(String p_time) {
   this.p_time = p_time;
}














@Override
public String toString() {
   return "ReservationVO [r_number=" + r_number + ", store_Id=" + store_Id + ", user_Id=" + user_Id + ", r_time="
         + r_time + ", p_time=" + p_time +  "]";
}








public ReservationVO(Long r_number, Integer store_Id, String user_Id, String r_time, String p_time, int isCooking) {
   super();
   this.r_number = r_number;
   this.store_Id = store_Id;
   this.user_Id = user_Id;
   this.r_time = r_time;
   this.p_time = p_time;
   this.isCooking = isCooking;
}








public ReservationVO(Integer store_Id, String user_Id, String r_time, String p_time) {
   super();
   this.store_Id = store_Id;
   this.user_Id = user_Id;
   this.r_time = r_time;
   this.p_time = p_time;
   this.isCooking = 1; //1요리중 0픽업완료(완료된 예약)
}








public int getIsCooking() {
   return isCooking;
}








public void setIsCooking(int isCooking) {
   this.isCooking = isCooking;
}




 
 
 
 
 
 
 
 
 
 
 

 
 
 
 
}