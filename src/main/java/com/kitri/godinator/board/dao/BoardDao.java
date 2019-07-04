package com.kitri.godinator.board.dao;

import java.util.List;


import com.kitri.godinator.model.BoardDto;


public interface BoardDao {
	
	List<String> findUSchool(String schoolName);
	List<String> findHSchool(String schoolName);
	int writeArticle(BoardDto boardDto);
	
}
