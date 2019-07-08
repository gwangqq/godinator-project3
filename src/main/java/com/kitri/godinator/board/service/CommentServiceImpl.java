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
		return makeJson(boardNo);
	}

	private String makeJson(int boardNo) {
		List<ReplyDto> list = sqlSession.getMapper(CommentDao.class).listMemo(boardNo);
		JSONArray array = new JSONArray(list);
		JSONObject json = new JSONObject();
		json.put("commentList", array);
		return json.toString();
	}

}
