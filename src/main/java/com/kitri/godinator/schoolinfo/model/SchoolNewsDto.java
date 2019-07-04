package com.kitri.godinator.schoolinfo.model;

public class SchoolNewsDto implements Comparable<SchoolNewsDto>{
	private String url;
	private String imgUrl;
	private String subject;
	private String press;
	private String date;
	private String detail;
	private String nextUrl;

	public String getUrl() {
		return url;
	}


	public void setUrl(String url) {
		this.url = url;
	}


	public String getImgUrl() {
		return imgUrl;
	}


	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}


	public String getSubject() {
		return subject;
	}


	public void setSubject(String subject) {
		this.subject = subject;
	}


	public String getPress() {
		return press;
	}


	public void setPress(String press) {
		this.press = press;
	}


	public String getDate() {
		return date;
	}


	public void setDate(String date) {
		this.date = date;
	}


	public String getDetail() {
		return detail;
	}


	public void setDetail(String detail) {
		this.detail = detail;
	}


	public String getNextUrl() {
		return nextUrl;
	}


	public void setNextUrl(String nextUrl) {
		this.nextUrl = nextUrl;
	}


	@Override
	public int compareTo(SchoolNewsDto s) {
		return this.date.compareTo(s.getDate());
	}
	
	
	
}
