package com.kitri.godinator.model;

import lombok.Data;

@Data
public class BoardDto {

	private int boardNo;				// 글번호
	private String bUserId;				// 아이디
	private int boardCategory;			// 카테고리번호
	private String userName;			// 이름
	private String boardSubject;		// 제목
	private String boardContent;		// 내용
	private String bSchoolName;			// 학교이름
	private String bSchoolCode;			// 학교 코드
	private String bSchoolCate1;		// 학교 구분1
	private String bSchoolCate2;		// 학교 구분2
	private int bViewCount;				// 조회수
	private String delStus;				// 삭제여부
	private String state;				// 상태
	private String bPostdate;			// 작성시간
	private String region;				// 지역
	

	
}
