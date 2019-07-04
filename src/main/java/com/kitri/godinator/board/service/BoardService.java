package com.kitri.godinator.board.service;

import com.kitri.godinator.model.BbsDto;
import com.kitri.godinator.model.BoardDto;

public interface BoardService {
	
	String findUSchool(String schoolName);
	String findHSchool(String schoolName);
	int writeArticle(BoardDto boardDto);
}
