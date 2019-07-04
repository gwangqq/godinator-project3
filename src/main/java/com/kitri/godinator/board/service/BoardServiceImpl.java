package com.kitri.godinator.board.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.godinator.board.dao.BoardCommonDao;
import com.kitri.godinator.board.dao.BoardDao;
import com.kitri.godinator.model.BoardDto;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private SqlSession sqlSession;
	
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
		boardDto.setBoardContent(boardDto.getBoardContent().replace("<br>","\n"));
		return cnt != 0 ? boardDto.getBoardNo() : 0;
	}

// boardNo 넘기는 method
	@Override
	public int getNextSeq() {
		return sqlSession.getMapper(BoardCommonDao.class).getNextSeq();
	}

	
	
}
