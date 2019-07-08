package com.kitri.godinator.model;

import lombok.Data;

@Data
public class EditDto {

	private int editNo;				// 일련번호
	private int boardNo;			// 글번호
	private int ref;				// 그룹번호
	private int pseq;				// 원글번호
	private String state;			// 완료여부
	private String menteeId;		// 멘티 아이디
	private String mentorId;		// 멘토 아이디

}
