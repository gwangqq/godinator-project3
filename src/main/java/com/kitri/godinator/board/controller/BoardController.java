package com.kitri.godinator.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kitri.godinator.board.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
//	  @Autowired
//	  private BoardService boardService;
	  
	  @RequestMapping(value = "/moveboard1", method = RequestMethod.GET)
	  public String move() { 
		  return "board/board";
	  }
	  
	  @RequestMapping(value = "/moveboard2", method = RequestMethod.GET)
	  public String move2() { 
		  return "board/write";
	  }
	  
	  @RequestMapping(value = "/moveboard3", method = RequestMethod.GET)
	  public String move3() { 
		  return "board/adresult";
	  }
	 
//	  @RequestMapping(value = "/write", method = RequestMethod.GET)
//		public void write(@RequestParam Map<String, String> parameter, Model model) {
//			model.addAttribute("parameter", parameter);
//		}
}
