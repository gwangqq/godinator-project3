package com.kitri.godinator.model;

public class BbsDto extends BoardDto{

	private int bbsNo;				// 일련번호
	private int boardNo;			// 글번호
	private String saveFolder;		// 저장폴더
	private String orginalName;		// 원본파일이름
	private String savedName;		// 저장파일이름
	private int fileSize;			// 파일크기
	private int latitude;			// 위도
	private int longitude;			// 경도

	public int getBbsNo() {
		return bbsNo;
	}

	public void setBbsNo(int bbsNo) {
		this.bbsNo = bbsNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getSabeFolder() {
		return saveFolder;
	}

	public void setSabeFolder(String sabeFolder) {
		this.saveFolder = sabeFolder;
	}

	public String getOrginalName() {
		return orginalName;
	}

	public void setOrginalName(String orginalName) {
		this.orginalName = orginalName;
	}

	public String getSavedName() {
		return savedName;
	}

	public void setSavedName(String savedName) {
		this.savedName = savedName;
	}

	public int getFileSize() {
		return fileSize;
	}

	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}

	public int getLatitude() {
		return latitude;
	}

	public void setLatitude(int latitude) {
		this.latitude = latitude;
	}

	public int getLongitude() {
		return longitude;
	}

	public void setLongitude(int longitude) {
		this.longitude = longitude;
	}

}
