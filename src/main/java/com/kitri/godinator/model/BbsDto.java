package com.kitri.godinator.model;

<<<<<<< Upstream, based on develop
import lombok.Data;

@Data
public class BbsDto {
=======
public class BbsDto extends BoardDto{
>>>>>>> 07d6897 19.07.04 학교 검색 기능 완료

	private int bbsNo;				// 일련번호
	private int boardNo;			// 글번호
	private String saveFolder;		// 저장폴더
	private String orginalName;		// 원본파일이름
	private String savedName;		// 저장파일이름
	private int fileSize;			// 파일크기
	private int latitude;			// 위도
	private int longitude;			// 경도

}
