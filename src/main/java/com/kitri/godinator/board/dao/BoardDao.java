package com.kitri.godinator.board.dao;

import java.util.List;
import java.util.Map;

import com.kitri.godinator.model.BoardDto;
import com.kitri.godinator.model.CategoryDto;


public interface BoardDao {
	
	//Main Menu 커뮤니티 목록 보여주기
	List<CategoryDto> getBoardMenuList();
	
	//글 작성 시 학교 찾기 
	List<String> findUSchool(String schoolName);
	List<String> findHSchool(String schoolName);
	
	//글 작성 완료 
	int writeArticle(BoardDto boardDto);
	
	//게시판 list보여주는 메소드
	List<BoardDto> listArticle(Map<String, String> parameter);
	
	//게시물 가져오는 메소드
	BoardDto viewArticle(int boardNo);
	
	//글 수정 완료 메소드
	int modifyArticle(BoardDto boardDto);
	
	//이전글번호 찾아오는 메소드
	int prevArticle(Map<String, String> parameter);
	
	//다음 글 번호 찾아오는 메소드
	int nextArticle(Map<String, String> parameter);
	
	//글 삭제 메소드
	void deleteArticle(int boardNo);
	
}
