package com.kitri.godinator.model;

import lombok.Data;

@Data
public class EvalUDLogDto {

	private String userId;		// 회원아이디
	private int adNo; 			// 장단점일련번호
	private String updown; 		// 공감/비공감

}
