package com.kitri.godinator.model;

public class EvalSchoolDto {

	private int adNo; 				// 일련번호
	private String adDiv; 			// 장단점
	private String userId; 			// 회원아이디
	private String schoolCate; 		// 학교구분
	private String schoolCode; 		// 학교코드
	private String content; 		// 내용
	private String regitDate; 		// 작성일
	private int upvote; 			// 공감
	private int downvote; 			// 비공감
	private String state; 			// 상태
	public int getAdNo() {
		return adNo;
	}
	public void setAdNo(int adNo) {
		this.adNo = adNo;
	}
	public String getAdDiv() {
		return adDiv;
	}
	public void setAdDiv(String adDiv) {
		this.adDiv = adDiv;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getSchoolCate() {
		return schoolCate;
	}
	public void setSchoolCate(String schoolCate) {
		this.schoolCate = schoolCate;
	}
	public String getSchoolCode() {
		return schoolCode;
	}
	public void setSchoolCode(String schoolCode) {
		this.schoolCode = schoolCode;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegitDate() {
		return regitDate;
	}
	public void setRegitDate(String regitDate) {
		this.regitDate = regitDate;
	}
	public int getUpvote() {
		return upvote;
	}
	public void setUpvote(int upvote) {
		this.upvote = upvote;
	}
	public int getDownvote() {
		return downvote;
	}
	public void setDownvote(int downvote) {
		this.downvote = downvote;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}

}
