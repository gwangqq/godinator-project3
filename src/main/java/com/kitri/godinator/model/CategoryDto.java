package com.kitri.godinator.model;

public class CategoryDto {

	private int boardCategory; 		// 카테고리 번호
	private String categoryName;	// 카테고리 이름

	public int getboardCategory() {
		return boardCategory;
	}

	public void setboardCategory(int boardCategory) {
		this.boardCategory = boardCategory;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	@Override
	public String toString() {
		return "CategoryDto [boardCategory=" + boardCategory + ", categoryName=" + categoryName + "]";
	}
	
	
}
