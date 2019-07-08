package com.kitri.godinator.model;

import lombok.Data;

@Data
public class MentorDto {

	private String userId;			// 회원아이디
	private String mentor;			// 멘토
	private String aprvlDate;		// 승인일자
	private String cate;			// 구분
}
