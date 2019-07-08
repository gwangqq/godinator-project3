package com.kitri.godinator.model;

import lombok.Data;

@Data
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

}
