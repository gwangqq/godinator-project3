package com.kitri.godinator.model;

import lombok.Data;

@Data
public class SearchLogDto {

	private String schoolCode;		// 학교코드
	private String userId;			// 회원아이디
	private String schoolCate;		// 학교유형
	private int searchCnt;			// 검색수
	private String searchDate;		// 마지막검색시간
}
