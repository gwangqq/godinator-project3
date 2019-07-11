package com.kitri.godinator.board.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.godinator.board.dao.CommentDao;
import com.kitri.godinator.model.ReplyDto;

@Service
public class CommentServiceImpl implements CommentService{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void writeMemo(ReplyDto commentDto) {
		sqlSession.getMapper(CommentDao.class).writeMemo(commentDto);
	}



	@Override
	public String listMemo(int boardNo) {
//		System.out.println("service listMemo " + boardNo);
		return makeJson(boardNo);
	}

	private String makeJson(int boardNo) {
//		System.out.println("makeJson" + boardNo);
		List<ReplyDto> list = sqlSession.getMapper(CommentDao.class).listMemo(boardNo);
		JSONArray array = new JSONArray(list);
		JSONObject json = new JSONObject();
//		System.out.println("mybatis : " + array);
		json.put("commentList", array);
//		System.out.println("commentList" + json.toString());
		int count = sqlSession.getMapper(CommentDao.class).countMemo(boardNo);
		json.put("count", count);
//		System.out.println("service" + json.toString());
		return json.toString();
	}



	@Override
	public String deleteMemo(int boardNo, int commentNo) {
		sqlSession.getMapper(CommentDao.class).deleteMemo(commentNo);
		return makeJson(boardNo);
	}



	@Override
	public void updateMemo(ReplyDto replyDto) {
		sqlSession.getMapper(CommentDao.class).updateMemo(replyDto);
	}

}
