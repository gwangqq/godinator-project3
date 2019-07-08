package com.kitri.godinator.model;

import lombok.Data;

@Data
public class ReportDto {

	private int reportSeq;			 // 일련번호
	private String code;			 // 신고코드
	private int relSeq;				 // 해당일련번호
	private String reportTime;		 // 신고일

}
