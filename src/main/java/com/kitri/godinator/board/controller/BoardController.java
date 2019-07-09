package com.kitri.godinator.board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kitri.godinator.board.service.BoardCommonService;
import com.kitri.godinator.board.service.BoardService;
import com.kitri.godinator.model.BoardDto;
import com.kitri.godinator.model.MemberDto;
import com.kitri.godinator.model.PageNavigation;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardCommonService boardCommonService;
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(@RequestParam Map<String, String> parameter, Model model) {
		return "board/main";
	}
	

	// 게시판 list에서 글 작성 버튼 누르면 글 작성 페이지로 이동
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void write(@RequestParam Map<String, String> parameter, Model model) {
		model.addAttribute("parameter", parameter);
	}

	// 학교 검색 모달창 학교 검색
	@RequestMapping(value = "/searchschool", method = RequestMethod.POST, consumes = "application/json", headers = {
			"Content-type=application/json" })
	public @ResponseBody String searchSchool(@RequestBody Map<String, String> parameter, Model model) {

//		  System.out.println("Controller진입!" + parameter);
		String schoolType = parameter.get("schoolType");
		String schoolName = parameter.get("schoolName");

//		  System.out.println("학교 유형 : "+schoolType +", 학교 이름 : " +schoolName);

		String json = "";
		if ("고등학교".equals(schoolType)) {
			json = boardService.findHSchool(schoolName);
//			  System.out.println("C : " + json);
		} else {
			json = boardService.findUSchool(schoolName);
//			  System.out.println("C : " + json);
		}

		return json;
	}

//------------------------[글쓰기]-------------------------
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(BoardDto boardDto, @RequestParam Map<String, String> parameter, Model model,
			HttpSession session) {
//		System.out.println(parameter.toString());
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		String path = "";
		
		if (memberDto != null) {
			
			int boardNo = boardCommonService.getNextBoardNo();
			boardDto.setBoardNo(boardNo);
			boardDto.setbUserId(memberDto.getUserId());
			boardDto.setUserName(memberDto.getUserName());
//			System.out.println("C : " + boardDto);
			boardNo = boardService.writeArticle(boardDto);
			if (boardNo != 0) {
				model.addAttribute("boardNo", boardNo);
				path = "board/writeok";
			} else {
				path = "오류 페이지 넣어야됨";
			}
		
		} else {
			path = "redirect:/index.jsp";
		}
		model.addAttribute("parameter", parameter);
		return path;
	}
	
//------------------------[게시물 보여주기]------------------------------
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String view(@RequestParam("boardNo") int boardNo, @RequestParam Map<String, String> parameter, Model model,
			HttpSession session) {
//		System.out.println("view/c : " + parameter.toString() + boardNo);
		String path = "";
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		if (memberDto != null) {
			BoardDto boardDto = boardService.viewArticle(boardNo);

			parameter.put("boardNo", Integer.toString(boardNo));
			int isPrev = boardService.checkPrev(parameter);
			int isNext = boardService.checkNext(parameter);
			
			model.addAttribute("article", boardDto);
			model.addAttribute("parameter", parameter);
			model.addAttribute("boardNo", boardNo);
			model.addAttribute("isPrev", isPrev);
			model.addAttribute("isNext", isNext);
//			System.out.println("결과 : " + isPrev);
//			System.out.println(parameter);
			path = "board/view";
		} else {
			path = "redirect:/index.jsp";
		}
		return path;
	}


//------------------------[게시판 리스트]------------------------------------
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(@RequestParam Map<String, String> parameter, Model model, HttpServletRequest requset) {

//		System.out.println("get으로 넘어왔다" + parameter.toString());
		List<BoardDto> list = boardService.listArticle(parameter);
		
		String path = "";
//		System.out.println(list);
		PageNavigation pageNavigation = boardCommonService.getPageNavigation(parameter);
		pageNavigation.setRoot(requset.getContextPath());
		pageNavigation.makeNavigator();

		model.addAttribute("parameter", parameter);
		model.addAttribute("articleList", list);
		model.addAttribute("navigator", pageNavigation);
		
		return path = "board/list";
	}

	
//-----------------------------------[수정기능]--------------------------------------------------
		
		//수정페이지로 이동
		@RequestMapping(value = "/modify", method = RequestMethod.GET)
		public String modify(@RequestParam("boardNo") int boardNo, 
								@RequestParam Map<String, String> parameter, Model model) {
//			System.out.println("글 수정 C : " + parameter +  "/" + boardNo );
				String path = "";
			
				BoardDto boardDto = boardService.getArticle(boardNo);
				boardDto.setBoardCategory(Integer.parseInt(parameter.get("boardCategory")));
				model.addAttribute("article", boardDto);
//				System.out.println(boardDto);
				model.addAttribute("parameter", parameter);
				path = "board/modify";
			return path;
		}

		
		
//수정 완료 버튼 클릭
		@RequestMapping(value = "/modify", method = RequestMethod.POST)
		public String modify(BoardDto boardDto, 
				@RequestParam Map<String, String> parameter, Model model,
				HttpSession session) {
//			System.out.println("수정 완료 " + boardDto);
			String path = "";
			MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");

			if (memberDto != null) {

				int boardNo = boardService.modifyArticle(boardDto);
				if (boardNo != 0) {
					model.addAttribute("boardNo", boardNo);
					path = "board/writeok";
				} else {
					//수정 실패했습니다 만들어야
					path = "redirect:/index.jsp";
				}
			} else {

				path = "";
			}
			model.addAttribute("parameter", parameter);
			return path;
		}

//-------------------------------[이전 글 보기]-----------------------------
		@RequestMapping(value = "/prev", method = RequestMethod.GET)
		public String prev(@RequestParam("boardNo") int boardNo, @RequestParam Map<String, String> parameter, Model model,
				HttpSession session) {
//			System.out.println("prev// boardNo : " + boardNo + " boardCategory : "+ boardCategory);
			String path = "";
			System.out.println("prev 들어옴" + parameter);
			MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
			if (memberDto != null) {
				BoardDto boardDto = boardService.prevArticle(parameter);
				model.addAttribute("article", boardDto);
				model.addAttribute("parameter", parameter);
				model.addAttribute("boardNo", parameter.get("boardNo"));
				//System.out.println("C : boardNo -- " + parameter.get("boardNo"));
				
				//System.out.println(parameter);
				path = "board/view";
			} else {
				path = "redirect:/index.jsp";
			}
			return path;
		}

//-------------------------------[다음 글 보기]-----------------------------
		@RequestMapping(value = "/next", method = RequestMethod.GET)
		public String next(@RequestParam("boardNo") int boardNo, @RequestParam Map<String, String> parameter, Model model,
				HttpSession session) {
//			System.out.println("prev// boardNo : " + boardNo + " boardCategory : "+ boardCategory);
			String path = "";
			System.out.println("prev 들어옴" + parameter);
			MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
			if (memberDto != null) {
				BoardDto boardDto = boardService.nextArticle(parameter);
				model.addAttribute("article", boardDto);
				model.addAttribute("parameter", parameter);
				model.addAttribute("boardNo", parameter.get("boardNo"));
				System.out.println("C : boardNo -- " + parameter.get("boardNo"));
				
				System.out.println(parameter);
				path = "board/view";
			} else {
				path = "redirect:/index.jsp";
			}
			return path;
		}
		

//-------------------------------[글 삭제]------------------------------
		@RequestMapping(value = "/delete", method = RequestMethod.GET)
		public String delete(@RequestParam("boardNo") int boardNo, @RequestParam Map<String, String> parameter, Model model,
				HttpSession session) {
			MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
			String path = "";
			System.out.println(boardNo);
			System.out.println("C :" +parameter);
			if (memberDto != null) {
				
				boardService.deleteArticle(boardNo);
//				System.out.println("C : " + boardDto);
				if (boardNo != 0) {
					model.addAttribute("boardNo", boardNo);
					model.addAttribute("parameter", parameter);
					path = "board/list";
				} else {
					path = "오류 페이지 넣어야됨";
				}
			
			} else {
				path = "redirect:/index.jsp";
			}
			return path;
		}
}
