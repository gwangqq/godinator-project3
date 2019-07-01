package com.kitri.godinator.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kitri.godinator.board.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	  @Autowired private BoardService boardService;
	  
	  @RequestMapping(value = "/moveboard") public String move() { 
		  String path = "";
	  
		  path = "/board.jsp"; return path; 
	  
	  }
	 
}
