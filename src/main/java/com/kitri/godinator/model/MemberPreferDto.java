package com.kitri.godinator.model;

import lombok.Data;

@Data
public class MemberPreferDto {

	private String userId; 		// 회원아이디
	private int hEval1; 		// 고등항목1
	private int hEval2; 		// 고등항목2
	private int hEval3; 		// 고등항목3
	private int hEval4;			// 고등항목4
	private int hEval5; 		// 고등항목5
	private int hEval6; 		// 고등항목6
	private int uEval1; 		// 대학항목1
	private int uEval2; 		// 대학항목2
	private int uEval3; 		// 대학항목3
	private int uEval4; 		// 대학항목4
	private int uEval5; 		// 대학항목5
	private int uEval6; 		// 대학항목6

}
