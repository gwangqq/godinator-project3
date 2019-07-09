package com.kitri.godinator.board.service;

import com.kitri.godinator.model.ReplyDto;

public interface CommentService {
	
	//댓글 작성
	void writeMemo(ReplyDto commentDto);
	//댓글 리스트
	String listMemo(int boardNo);
	
}
