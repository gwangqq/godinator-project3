package com.kitri.godinator.board.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kitri.godinator.board.service.BoardService;
import com.kitri.godinator.model.MemberDto;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	  @Autowired
	  private BoardService boardService;
	  
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
	  
	  
	  //학교 검색 모달창 학교 검색
	  @RequestMapping(value = "/searchschool", method = RequestMethod.POST, consumes = "application/json", headers = {"Content-type=application/json"})
	   public String searchSchool(@RequestBody Map<String, String> parameter, Model model) {
		  
		  System.out.println("Controller진입!" + parameter);
		  String schoolType = parameter.get("schoolType");
		  String schoolName = parameter.get("schoolName");
		  
		  System.out.println("학교 유형 : "+schoolType +", 학교 이름 : " +schoolName);
		  
		  String json = "";
		  if("고등학교".equals(schoolType)) {
			 json = boardService.findHSchool(schoolName);
			  System.out.println("C : " + json);
		  } else {
			 json = boardService.findUSchool(schoolName);
		  }
		  
		  return json;
	  }
	  
//	  @RequestMapping(value = "/write", method = RequestMethod.POST)
//	  public void write(@RequestParam Map<String, String> parameter, Model model, ) {
//		  model.addAttribute("parameter", parameter);
//	  }
//	  
}
