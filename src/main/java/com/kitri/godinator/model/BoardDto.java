package com.kitri.godinator.model;

import lombok.Data;

public class BoardDto {

	private int boardNo; // 글번호
	private String bUserId; // 아이디
	private int boardCategory; // 카테고리번호
	private String userName; // 이름
	private String boardSubject; // 제목
	private String boardContent; // 내용
	private String bSchoolName; // 학교이름
	private String bSchoolCode; // 학교 코드
	private String bSchoolCate1; // 학교 구분1
	private String bSchoolCate2; // 학교 구분2
	private int bViewCount; // 조회수
	private String delStus; // 삭제여부
	private String state; // 상태
	private String bPostdate; // 작성시간
	private String region; // 지역

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getbUserId() {
		return bUserId;
	}

	public void setbUserId(String bUserId) {
		this.bUserId = bUserId;
	}

	public int getBoardCategory() {
		return boardCategory;
	}

	public void setBoardCategory(int boardCategory) {
		this.boardCategory = boardCategory;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getBoardSubject() {
		return boardSubject;
	}

	public void setBoardSubject(String boardSubject) {
		this.boardSubject = boardSubject;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getbSchoolName() {
		return bSchoolName;
	}

	public void setbSchoolName(String bSchoolName) {
		this.bSchoolName = bSchoolName;
	}

	public String getbSchoolCode() {
		return bSchoolCode;
	}

	public void setbSchoolCode(String bSchoolCode) {
		this.bSchoolCode = bSchoolCode;
	}

	public String getbSchoolCate1() {
		return bSchoolCate1;
	}

	public void setbSchoolCate1(String bSchoolCate1) {
		this.bSchoolCate1 = bSchoolCate1;
	}

	public String getbSchoolCate2() {
		return bSchoolCate2;
	}

	public void setbSchoolCate2(String bSchoolCate2) {
		this.bSchoolCate2 = bSchoolCate2;
	}

	public int getbViewCount() {
		return bViewCount;
	}

	public void setbViewCount(int bViewCount) {
		this.bViewCount = bViewCount;
	}

	public String getDelStus() {
		return delStus;
	}

	public void setDelStus(String delStus) {
		this.delStus = delStus;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getbPostdate() {
		return bPostdate;
	}

	public void setbPostdate(String bPostdate) {
		this.bPostdate = bPostdate;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	@Override
	public String toString() {
		return "BoardDto [boardNo=" + boardNo + ", bUserId=" + bUserId + ", boardCategory=" + boardCategory
				+ ", userName=" + userName + ", boardSubject=" + boardSubject + ", boardContent=" + boardContent
				+ ", bSchoolName=" + bSchoolName + ", bSchoolCode=" + bSchoolCode + ", bSchoolCate1=" + bSchoolCate1
				+ ", bSchoolCate2=" + bSchoolCate2 + ", bViewCount=" + bViewCount + ", delStus=" + delStus + ", state="
				+ state + ", bPostdate=" + bPostdate + ", region=" + region + "]";
	}
	
	
	
}
