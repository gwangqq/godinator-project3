package com.kitri.godinator.board.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.kitri.godinator.model.BoardDto;

@Repository
public interface BoardDao {
	
	List<String> findUSchool(String schoolName);
	List<String> findHSchool(String schoolName);
	int writeArticle(BoardDto boardDto);
	
}
