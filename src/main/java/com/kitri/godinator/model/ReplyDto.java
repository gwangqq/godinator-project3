package com.kitri.godinator.model;

import lombok.Data;

@Data
public class ReplyDto {

	private int commentNo;				// 댓글번호
	private int boardNo;				// 글번호
	private String cUserId;				// 작성자아이디
	private String cPostdate;			// 작성시간
	private String commentContent;		// 내용
	private String state;				// 상태

}
