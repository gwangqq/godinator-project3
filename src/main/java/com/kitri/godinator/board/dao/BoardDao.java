package com.kitri.godinator.board.dao;

import java.util.List;
import java.util.Map;

import com.kitri.godinator.model.BoardDto;


public interface BoardDao {
	
	List<String> findUSchool(String schoolName);
	List<String> findHSchool(String schoolName);
	int writeArticle(BoardDto boardDto);
	
	//게시판 list보여주는 메소드
	List<BoardDto> listArticle(Map<String, String> parameter);
	
}
