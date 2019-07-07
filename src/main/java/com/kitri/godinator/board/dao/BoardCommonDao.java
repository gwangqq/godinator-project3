package com.kitri.godinator.board.dao;



public interface BoardCommonDao {
	
	//boardNo가져오기
	public int getNextBoardNo();

	public void updateViewCount(int boardNo);
}
