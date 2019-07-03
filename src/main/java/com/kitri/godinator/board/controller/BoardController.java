package com.kitri.godinator.board.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kitri.godinator.board.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
//	  @Autowired
//	  private BoardService boardService;
	  
	  @RequestMapping(value = "/movelist", method = RequestMethod.GET)
	  public String move() { 
		  return "board/list";
	  }
	  
	  @RequestMapping(value = "/movewrite", method = RequestMethod.GET)
	  public String move2() { 
		  return "board/write";
	  }
	  
	  @RequestMapping(value = "/moveview", method = RequestMethod.GET)
	  public String move3() { 
		  return "board/view";
	  }
	 
	  //게시판 list에서 글 작성 버튼 누르면 글 작성 페이지로 이동
	  @RequestMapping(value = "/write", method = RequestMethod.GET)
	  public void write(@RequestParam Map<String, String> parameter, Model model) {
		  model.addAttribute("parameter", parameter);
	  }
	  
//	  @RequestMapping(value = "/write", method = RequestMethod.POST)
//	  public void write(@RequestParam Map<String, String> parameter, Model model, ) {
//		  model.addAttribute("parameter", parameter);
//	  }
//	  
}
