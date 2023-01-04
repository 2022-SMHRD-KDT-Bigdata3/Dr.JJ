package com.smhrd.model;

import java.sql.Date;

//제보
public class ReportVO {

 // 제보 아이디
 private Double reportId;

 // 제보자 아이디
 private String userId;

 // 제보 제목
 private String reportTitle;

 // 제보 내용
 private Integer reportContent;

 // 제보 일자
 private Date reportDt;

 // 제보 첨부파일
 private String reportFile;

 public Double getReportId() {
     return reportId;
 }

 public void setReportId(Double reportId) {
     this.reportId = reportId;
 }

 public String getUserId() {
     return userId;
 }

 public void setUserId(String userId) {
     this.userId = userId;
 }

 public String getReportTitle() {
     return reportTitle;
 }

 public void setReportTitle(String reportTitle) {
     this.reportTitle = reportTitle;
 }

 public Integer getReportContent() {
     return reportContent;
 }

 public void setReportContent(Integer reportContent) {
     this.reportContent = reportContent;
 }

 public Date getReportDt() {
     return reportDt;
 }

 public void setReportDt(Date reportDt) {
     this.reportDt = reportDt;
 }

 public String getReportFile() {
     return reportFile;
 }

 public void setReportFile(String reportFile) {
     this.reportFile = reportFile;
 }

 // Reports 모델 복사
 public void CopyData(ReportVO param)
 {
     this.reportId = param.getReportId();
     this.userId = param.getUserId();
     this.reportTitle = param.getReportTitle();
     this.reportContent = param.getReportContent();
     this.reportDt = param.getReportDt();
     this.reportFile = param.getReportFile();
 }
}