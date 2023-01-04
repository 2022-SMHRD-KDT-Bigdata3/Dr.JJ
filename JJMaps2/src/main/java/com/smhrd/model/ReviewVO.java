package com.smhrd.model;

import java.sql.Date;

//리뷰
public class ReviewVO {

 // 리뷰 아이디
 private Double reviewId;

 // 가게 아이디
 private String storeId;

 // 리뷰 내용
 private String reviewContewnt;

 // 평점
 private Double reviewScore;

 // 리뷰 사진
 private String reviewPic;

 // 리뷰 작성자
 private String userId;

 // 리뷰 작성시간
 private Date reviewDt;

 public Double getReviewId() {
     return reviewId;
 }

 public void setReviewId(Double reviewId) {
     this.reviewId = reviewId;
 }

 public String getStoreId() {
     return storeId;
 }

 public void setStoreId(String storeId) {
     this.storeId = storeId;
 }

 public String getReviewContewnt() {
     return reviewContewnt;
 }

 public void setReviewContewnt(String reviewContewnt) {
     this.reviewContewnt = reviewContewnt;
 }

 public Double getReviewScore() {
     return reviewScore;
 }

 public void setReviewScore(Double reviewScore) {
     this.reviewScore = reviewScore;
 }

 public String getReviewPic() {
     return reviewPic;
 }

 public void setReviewPic(String reviewPic) {
     this.reviewPic = reviewPic;
 }

 public String getUserId() {
     return userId;
 }

 public void setUserId(String userId) {
     this.userId = userId;
 }

 public Date getReviewDt() {
     return reviewDt;
 }

 public void setReviewDt(Date reviewDt) {
     this.reviewDt = reviewDt;
 }

 // Reviews 모델 복사
 public void CopyData(ReviewVO param)
 {
     this.reviewId = param.getReviewId();
     this.storeId = param.getStoreId();
     this.reviewContewnt = param.getReviewContewnt();
     this.reviewScore = param.getReviewScore();
     this.reviewPic = param.getReviewPic();
     this.userId = param.getUserId();
     this.reviewDt = param.getReviewDt();
 }
}