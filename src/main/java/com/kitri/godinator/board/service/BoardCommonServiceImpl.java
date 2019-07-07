package com.kitri.godinator.board.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.godinator.board.controller.NumberCheck;
import com.kitri.godinator.board.dao.BoardCommonDao;
import com.kitri.godinator.model.BoardConstance;
import com.kitri.godinator.model.PageNavigation;

@Service
public class BoardCommonServiceImpl implements BoardCommonService {

	@Autowired
	private SqlSession sqlSession;
	
	// boardNo 넘기는 method
	@Override
	public int getNextBoardNo() {
		return sqlSession.getMapper(BoardCommonDao.class).getNextBoardNo();
	}

	@Override
	public PageNavigation getPageNavigation(Map<String, String> parameter) {
		PageNavigation navigation = new PageNavigation();
		
		int boardCategory = Integer.parseInt(parameter.get("boardCategory"));
		
		int newArticleCount = sqlSession.getMapper(BoardCommonDao.class).getNewArticleCount(boardCategory);
		navigation.setNewArticleCount(newArticleCount);
		
		int totalArticleCount = sqlSession.getMapper(BoardCommonDao.class).getTotalArticleCount(parameter);
		navigation.setTotalArticleCount(totalArticleCount);

		int totalPageCount = (totalArticleCount-1) / BoardConstance.ARTICLE_SIZE + 1;//나누어 떨어지는 숫자를 없애면 된다
		navigation.setTotalPageCount(totalPageCount);
		
		int pg = NumberCheck.NotNumberToOne(parameter.get("pg"));
		navigation.setNowFirst(pg <= BoardConstance.PAGE_SIZE);
		navigation.setNowEnd((totalPageCount-1)/BoardConstance.PAGE_SIZE * BoardConstance.PAGE_SIZE < pg);
		navigation.setPageNo(pg);
		return navigation;
	}

}
