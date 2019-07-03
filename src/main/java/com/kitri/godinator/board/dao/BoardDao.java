package com.kitri.godinator.board.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface BoardDao {
	
	List<String> findUSchool(String schoolName);
	List<String> findHSchool(String schoolName);
	
}
