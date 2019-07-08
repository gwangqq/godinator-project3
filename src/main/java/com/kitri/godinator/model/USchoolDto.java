package com.kitri.godinator.model;

import lombok.Data;

@Data
public class USchoolDto {

	private String code;			 // 학교코드
	private String name;			 // 학교명
	private String type;			 // 학교종류
	private String estType;			 // 설립구분
	private String zipcode;			 // 우편번호
	private String region;			 // 지역
	private String address;			 // 주소
	private String link;			 // 홈페이지주소
	private String latitude;		 // 위도
	private String longitude;		 // 경도
	private String tel;				 // 전화번호
	private String fax;				 // 팩스번호
	private int eval1Avg;			 // 평가항목1 평균
	private int eval2Avg;			 // 평가항목2 평균
	private int eval3Avg;			 // 평가항목3 평균
	private int eval4Avg;			 // 평가항목4 평균
	private int eval5Avg;			 // 평가항목5 평균
	private int eval6Avg;			 // 평가항목6 평균
	private int evalCnt;			 // 평가인원수

}
