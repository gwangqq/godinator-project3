package com.kitri.godinator.model;

import lombok.Data;

@Data
public class BbsDto extends BoardDto{

	private int bbsNo;				// 일련번호
	private int boardNo;			// 글번호
	private String saveFolder;		// 저장폴더
	private String orginalName;		// 원본파일이름
	private String savedName;		// 저장파일이름
	private int fileSize;			// 파일크기
	private int latitude;			// 위도
	private int longitude;			// 경도

}
