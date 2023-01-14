package com.smhrd.model1;

import java.sql.Date;

//리뷰
public class ReviewVO {


public ReviewVO(String review_title, String reviewContent, int reviewScore, String reviewPic, String user_id) {
		super();
		this.review_title = review_title;
		this.reviewContent = reviewContent;
		this.reviewScore = reviewScore;
		this.reviewPic = reviewPic;
		this.user_id = user_id;
	}
// 리뷰 아이디
 private Double reviewId;

 // 가게 아이디
 private Integer store_id;

 // 리뷰 제목
 private String review_title;
 
 // 리뷰 내용
 private String reviewContent;

 // 평점
 private int reviewScore;

 // 리뷰 사진
 private String reviewPic;

 // 리뷰 작성자
 private String user_id;

 // 리뷰 작성시간
 private Date reviewDt;

 public ReviewVO(Integer store_id, String review_title, String reviewContent, int reviewScore, String reviewPic,
			String user_id) {
		super();
		this.store_id = store_id;
		this.review_title = review_title;
		this.reviewContent = reviewContent;
		this.reviewScore = reviewScore;
		this.reviewPic = reviewPic;
		this.user_id = user_id;
	}

public Double getReviewId() {
	return reviewId;
}

public void setReviewId(Double reviewId) {
	this.reviewId = reviewId;
}

public Integer getStore_id() {
	return store_id;
}

public void setStore_id(Integer store_id) {
	this.store_id = store_id;
}

public String getReview_title() {
	return review_title;
}

public void setReview_title(String review_title) {
	this.review_title = review_title;
}

public String getReviewContent() {
	return reviewContent;
}

public void setReviewContent(String reviewContent) {
	this.reviewContent = reviewContent;
}

public int getReviewScore() {
	return reviewScore;
}

public void setReviewScore(int reviewScore) {
	this.reviewScore = reviewScore;
}

public String getReviewPic() {
	return reviewPic;
}

public void setReviewPic(String reviewPic) {
	this.reviewPic = reviewPic;
}

public String getUser_id() {
	return user_id;
}

public void setUser_id(String user_id) {
	this.user_id = user_id;
}

public Date getReviewDt() {
	return reviewDt;
}

public void setReviewDt(Date reviewDt) {
	this.reviewDt = reviewDt;
}
public ReviewVO(Integer store_id, String review_title, String reviewContent, int reviewScore, String user_id) {
	super();
	this.store_id = store_id;
	this.review_title = review_title;
	this.reviewContent = reviewContent;
	this.reviewScore = reviewScore;
	this.user_id = user_id;
}

 }