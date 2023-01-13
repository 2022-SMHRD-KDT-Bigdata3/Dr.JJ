package com.smhrd.model1;

import java.sql.Date;

//리뷰
public class ReviewVO {

 // 리뷰 아이디
 private Integer reviewId;

 // 가게 아이디
 private Integer store_id;
//리뷰 제목
private String review_title;



// 리뷰 내용
 private String reviewContent;

 // 평점
 private Integer reviewScore;

 // 리뷰 사진
 private String reviewPic;

 // 리뷰 작성자
 private String userId;

 // 리뷰 작성시간
 private Date reviewDt;
 

 public ReviewVO(Integer store_id,String review_title ,String reviewContent, Integer reviewScore, String reviewPic, String userId) {
	super();
	
	this.store_id = store_id;
	this.review_title = review_title;
	this.reviewContent = reviewContent;
	this.reviewScore = reviewScore;
	this.reviewPic = reviewPic;
	this.userId = userId;
}

public ReviewVO(String review_title, String reviewContent, int reviewScore, String reviewPic2, String user_id) {
	// TODO Auto-generated constructor stub
}

public Integer getReviewId() {
     return reviewId;
 }

 public void setReviewId(Integer reviewId) {
     this.reviewId = reviewId;
 }

 public Integer getstore_id() {
     return store_id;
 }

 public void setstore_id(Integer store_id) {
     this.store_id = store_id;
 }

 public String getreviewContent() {
     return reviewContent;
 }

 public void setreviewContent(String reviewContent) {
     this.reviewContent = reviewContent;
 }

 public Integer getReviewScore() {
     return reviewScore;
 }

 public void setReviewScore(Integer reviewScore) {
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
 public String getReview_title() {
	return review_title;
}

public void setReview_title(String review_title) {
	this.review_title = review_title;
}


 // Reviews 모델 복사
 public void CopyData(ReviewVO param)
 {
     this.reviewId = param.getReviewId();
     this.store_id = param.getstore_id();
     this.reviewContent = param.getreviewContent();
     this.reviewScore = param.getReviewScore();
     this.reviewPic = param.getReviewPic();
     this.userId = param.getUserId();
     this.reviewDt = param.getReviewDt();
 }
}