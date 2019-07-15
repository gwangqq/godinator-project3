package com.kitri.godinator.board.service;

import java.util.List;
import java.util.Map;

import com.kitri.godinator.model.BbsDto;
import com.kitri.godinator.model.CategoryDto;
import com.kitri.godinator.model.LoveDto;

public interface BoardService {
	//MainMenu 커뮤니티 탭 목록 보여주기
	List<CategoryDto> menuList();
	
	//글 작성시 학교 찾기
	String findUSchool(String schoolName);
	String findHSchool(String schoolName);
	
	//글 작성 완료
	int writeArticle(BbsDto bbsDto);
	
	
	//게시판 LIST 보여주기
	List<BbsDto> listArticle(Map<String, String> parameter);
	
	//게시물 하나씩 보여주기 
	BbsDto viewArticle(int boardNo);
	BbsDto getArticle(int boardNo);
	
	//게시물 수정 완료 버튼
	int modifyArticle(BbsDto bbsDto);
	
	//이전 글 보기
	BbsDto prevArticle(Map<String, String> parameter);
	
	//이전 글 번호 확인
	public int checkPrev(Map<String, String> parameter);
	//다음 글 보기
	BbsDto nextArticle(Map<String, String> parameter);
	//이전 글 번호 확인
	public int checkNext(Map<String, String> parameter);
	
	//글 삭제
	void deleteArticle(int boardNo);
	
	//좋아요 숫자
	String likeCount(LoveDto loveDto);
	
	//좋아요 
	int totalLike(int boardNo);
	int totalHate(int boardNo);

	List<BbsDto> listHotArticle(Map<String, String> parameter);
	
	List<BbsDto> mainHotArticle();
}
