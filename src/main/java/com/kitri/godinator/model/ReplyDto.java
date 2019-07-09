package com.kitri.godinator.model;

import lombok.Data;

public class ReplyDto {

	private int commentNo; // 댓글번호
	private int boardNo; // 글번호
	private String CUserId; // 작성자아이디
	private String CPostdate;// 작성시간
	private String commentContent; // 내용
	private String state; // 상태


	public String getCPostdate() {
		return CPostdate;
	}

	public void setCPostdate(String cPostdate) {
		CPostdate = cPostdate;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getCUserId() {
		return CUserId;
	}

	public void setCUserId(String CUserId) {
		this.CUserId = CUserId;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	
	@Override
	public String toString() {
		return "ReplyDto [commentNo=" + commentNo + ", boardNo=" + boardNo + ", CUserId=" + CUserId + ", CPostdate="
				+ CPostdate + ", commentContent=" + commentContent + ", state=" + state + "]";
	}
}
