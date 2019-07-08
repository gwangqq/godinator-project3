package com.kitri.godinator.model;

import lombok.Data;

@Data
public class MsgDto {

	private int msgNo;			 // 일련번호
	private String sendId;		// 보낸사람
	private String recvId;		// 받은사람
	private String sendDate;	// 송신일
	private String recvDate;	// 수신일
	private String msgTitle;	// 제목
	private String msgContent;	// 내용
	private String sendStus;	// 송신자 보관
	private String recvStus;	// 수신자 보관

}
