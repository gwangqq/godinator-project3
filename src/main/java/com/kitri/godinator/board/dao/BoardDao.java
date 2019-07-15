package com.kitri.godinator.board.dao;

import java.util.List;
import java.util.Map;

import com.kitri.godinator.model.BbsDto;
import com.kitri.godinator.model.CategoryDto;
import com.kitri.godinator.model.LoveDto;


public interface BoardDao {
	
	//Main Menu 커뮤니티 목록 보여주기
	List<CategoryDto> getBoardMenuList();
	
	//글 작성 시 학교 찾기 
	List<String> findUSchool(String schoolName);
	List<String> findHSchool(String schoolName);
	
	//글 작성 완료 
	int writeArticle(BbsDto bbsDto);
	
	//게시판 list보여주는 메소드
	List<BbsDto> listArticle(Map<String, String> parameter);
	
	//게시물 가져오는 메소드
	BbsDto viewArticle(int boardNo);
	
	//글 수정 완료 메소드
	int modifyArticle(BbsDto bbsDto);
	
	//이전글번호 찾아오는 메소드
	int prevArticle(Map<String, String> parameter);
	
	//다음 글 번호 찾아오는 메소드
	int nextArticle(Map<String, String> parameter);
	
	//글 삭제 메소드
	void deleteArticle(int boardNo);
	
	//댓글수 찾기
	void countComment(int boardNo);
	
	// 좋아요 눌렀나 안눌렀나 확인 0없음/1있음
	int isLike(LoveDto loveDto);
	
	//좋아요& 싫어요 뭐 눌렀는지 확인 L:좋아요 U:싫어요
	String likeUnlike(LoveDto loveDto);
	
	// 아직 안 눌렀을 시 (0) --> insert
	int insertLike(LoveDto loveDto);

	// 이미 눌렀을 시 (1) --> 0 delete (좋아요 기록 삭제)
	int deleteLike(LoveDto loveDto);
	
	//좋아요 -> 싫어요 , 싫어요 -> 좋아요
	int updateLike(LoveDto loveDto);
	
	//좋아요 전체 개수
	int totalLike(int boardNo);
	//싫어요 전체 개수
	int totalHate(int boardNo);
	
	//핫게시물
	List<BbsDto> listHotArticle(Map<String, String> parameter);
	
	//메인 핫게시물
	List<BbsDto> mainHotArticle();
	
}
