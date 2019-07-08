package com.kitri.godinator.model;

import lombok.Data;

@Data
public class LoveDto {

	private int likeNo;				// 일련번호
	private int boardNo;			// 글번호
	private String userId;			// 회원아이디
	private int commentNo;			// 댓글번호
	private String likeUnlike;		// 좋아요싫어요

}
