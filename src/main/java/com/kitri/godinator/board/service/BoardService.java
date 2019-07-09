package com.kitri.godinator.board.service;

import java.util.List;
import java.util.Map;

import com.kitri.godinator.model.BoardDto;
import com.kitri.godinator.model.CategoryDto;

public interface BoardService {
	//MainMenu 커뮤니티 탭 목록 보여주기
	List<CategoryDto> menuList();
	
	//글 작성시 학교 찾기
	String findUSchool(String schoolName);
	String findHSchool(String schoolName);
	
	//글 작성 완료
	int writeArticle(BoardDto boardDto);
	
	
	//게시판 LIST 보여주기
	List<BoardDto> listArticle(Map<String, String> parameter);
	
	//게시물 하나씩 보여주기 
	BoardDto viewArticle(int boardNo);
	BoardDto getArticle(int boardNo);
	
	//게시물 수정 완료 버튼
	int modifyArticle(BoardDto boardDto);
	
	//이전 글 보기
	BoardDto prevArticle(Map<String, String> parameter);
	
	//이전 글 번호 확인
	public int checkPrev(Map<String, String> parameter);
	//다음 글 보기
	BoardDto nextArticle(Map<String, String> parameter);
	//이전 글 번호 확인
	public int checkNext(Map<String, String> parameter);
	
	//글 삭제
	void deleteArticle(int boardNo);
}
