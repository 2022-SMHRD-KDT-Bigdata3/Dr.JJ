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
 private String user_Id;

 // 리뷰 작성시간
 private Date reviewDt;
 

 public ReviewVO(Integer reviewId, Integer store_id, String reviewContent, Integer reviewScore,
		String reviewPic, String user_Id, Date reviewDt,String review_title) {
	super();
	this.reviewId = reviewId;
	this.store_id = store_id;
	this.reviewContent = reviewContent;
	this.reviewScore = reviewScore;
	this.reviewPic = reviewPic;
	this.user_Id = user_Id;
	this.reviewDt = reviewDt;
	this.review_title = review_title;
}



public ReviewVO(Integer store_id,String review_title ,String reviewContent, Integer reviewScore, String reviewPic, String user_Id) {
	super();
	
	this.store_id = store_id;
	this.review_title = review_title;
	this.reviewContent = reviewContent;
	this.reviewScore = reviewScore;
	this.reviewPic = reviewPic;
	this.user_Id = user_Id;
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



 public String getUser_Id() {
	return user_Id;
}

public void setUser_Id(String user_Id) {
	this.user_Id = user_Id;
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



}