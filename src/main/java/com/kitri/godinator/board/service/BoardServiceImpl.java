package com.kitri.godinator.board.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kitri.godinator.board.controller.NumberCheck;
import com.kitri.godinator.board.dao.BoardCommonDao;
import com.kitri.godinator.board.dao.BoardDao;
import com.kitri.godinator.model.BoardConstance;
import com.kitri.godinator.model.BoardDto;
import com.kitri.godinator.model.CategoryDto;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private SqlSession sqlSession;
	
	//main 페이지 커뮤니티 menu
	@Override
	public List<CategoryDto> menuList() {
		System.out.println("service : "  + sqlSession.getMapper(BoardDao.class).getBoardMenuList().toString());
		return sqlSession.getMapper(BoardDao.class).getBoardMenuList();
		
	}	
	
	
	
	//고등학교 찾기 메소드
	@Override
	public String findHSchool(String schoolName) {
		List<String> list = sqlSession.getMapper(BoardDao.class).findHSchool(schoolName);
		JSONArray array = new JSONArray(list);
		JSONObject json = new JSONObject();
		json.put("hSchoolList", array);
//		System.out.println("service : " + json.toString());
		return json.toString();
	}
	
	//대학찾기 메소드
	@Override
	public String findUSchool(String schoolName) {
		List<String> list = sqlSession.getMapper(BoardDao.class).findUSchool(schoolName);
		JSONArray array = new JSONArray(list);
		JSONObject json = new JSONObject();
		json.put("uSchoolList", array);
//		System.out.println("service : " + json.toString());
		return json.toString();
	}

//	기본 글 쓰기 메소드
	@Override
	public int writeArticle(BoardDto boardDto) {
		int cnt = sqlSession.getMapper(BoardDao.class).writeArticle(boardDto);
		return cnt != 0 ? boardDto.getBoardNo() : 0;
	}


//page처리 + 게시판 list 보기
	@Override
	public List<BoardDto> listArticle(Map<String, String> parameter) {
		int pg = NumberCheck.NotNumberToOne(parameter.get("pg"));
		int end = pg * BoardConstance.ARTICLE_SIZE;
		int start = end - BoardConstance.ARTICLE_SIZE;

		parameter.put("start", start + "");
		parameter.put("end", end + "");

		return sqlSession.getMapper(BoardDao.class).listArticle(parameter);
	}


//	list에서 작성 된 글 보기
	@Override
	@Transactional
	public BoardDto viewArticle(int boardNo) {
		//조회수 증가
		sqlSession.getMapper(BoardCommonDao.class).updateViewCount(boardNo);
		//글쓴 내용 가져오기
		BoardDto boardDto = sqlSession.getMapper(BoardDao.class).viewArticle(boardNo);
		System.out.println("service view : " + boardDto); 
		boardDto.setBoardContent(boardDto.getBoardContent().replace("\n", "<br>"));
		return boardDto;
	}


// 수정에서 사용할 게시물 가져오기
	@Override
	public BoardDto getArticle(int boardNo) {
		return sqlSession.getMapper(BoardDao.class).viewArticle(boardNo);
	}


	//게시물 수정 버튼 누르기
	@Override
	public int modifyArticle(BoardDto boardDto) {
		int cnt = sqlSession.getMapper(BoardDao.class).modifyArticle(boardDto);
//		System.out.println("service : " + boardDto + "||" + cnt);
		return cnt != 0 ? boardDto.getBoardNo() : 0 ;
	}


	

	
	
}
