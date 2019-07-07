package com.kitri.godinator.board.service;

import java.util.Map;

import com.kitri.godinator.model.PageNavigation;

public interface BoardCommonService {
	//common method
		int getNextBoardNo();
		PageNavigation getPageNavigation(Map<String, String> parameter);
}
