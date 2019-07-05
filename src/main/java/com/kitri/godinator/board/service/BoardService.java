package com.kitri.godinator.board.service;

import java.util.List;
import java.util.Map;

import com.kitri.godinator.model.BoardDto;

public interface BoardService {
	
	String findUSchool(String schoolName);
	String findHSchool(String schoolName);
	int writeArticle(BoardDto boardDto);
	
	//common method
	int getNextSeq();
	//게시판 LIST 보여주기
	List<BoardDto> listArticle(Map<String, String> parameter);
}
