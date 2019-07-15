package com.kitri.godinator.board.dao;

import java.util.Map;

public interface BoardCommonDao {
	
	//boardNo가져오기
	public int getNextBoardNo();
	//조회수 늘리기 
	public void updateViewCount(int boardNo);

	//페이지 처리 
	public int getNewArticleCount(int boardCategory);       
	public int getTotalArticleCount(Map<String, String> parameter);
	
	
	public int getHotTotalArticleCount();
}
