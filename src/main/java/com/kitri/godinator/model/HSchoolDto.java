package com.kitri.godinator.model;

import lombok.Data;

@Data
public class HSchoolDto {

	private String schoolCode;			// 학교코드
	private String schoolName;			// 학교명
	private String schoolCate1;			// 학교유형1
	private String schoolCate2;			// 학교유형2
	private String estblDate;			// 설립일
	private String zipcode;				// 우편번호
	private String address;			 	// 도로명주소
	private String addressDetail; 		// 상세주소
	private String latitude; 			// 위도
	private String longitude; 			// 경도
	private String phone; 				// 전화번호
	private String fax; 				// 팩스번호
	private String homePage; 			// 홈페이지주소
	private String mwCate; 				// 남녀공학구분
	private String eduOffice; 			// 교육청
	private String estType; 			// 설립구분
	private int eval1Avg; 				// 평가항목1 평균
	private int eval2Avg; 				// 평가항목2 평균
	private int eval3Avg; 				// 평가항목3 평균
	private int eval4Avg; 				// 평가항목4 평균
	private int eval5Avg; 				// 평가항목5 평균
	private int eval6Avg; 				// 평가항목6 평균
	private int evalCnt; 				// 평가인원수

}
