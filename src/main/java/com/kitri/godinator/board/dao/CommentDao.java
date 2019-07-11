package com.kitri.godinator.board.dao;

import java.util.List;

import com.kitri.godinator.model.ReplyDto;

public interface CommentDao {
	
	//댓글 쓰기
	void writeMemo(ReplyDto replytDto);
	//댓글 보여주기
	List<ReplyDto> listMemo(int boardNo);
	
	
	ReplyDto viewMemo(int boardNo);
	int modifyMemo(ReplyDto replyDto);
	void deleteMemo(int commentNo);
	void updateMemo(ReplyDto replyDto);
	
	//댓글 수 보여주기
	int countMemo(int boardNo);
}
