package com.kitri.godinator.mentor.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kitri.godinator.mentor.service.MentorPageNaviDto;
import com.kitri.godinator.mentor.service.ResumeService;
import com.kitri.godinator.model.BoardDto;
import com.kitri.godinator.model.EditDto;
import com.kitri.godinator.model.MemberDto;



@Controller
@RequestMapping("/resume")
public class ResumeController {

	@Autowired
	private ResumeService resumeService;

//------------------------------------------------------------------------------------------------------------------------- 자소서 작성
	// #### 자소서 작성 페이지 이동 ####
	@RequestMapping(value = "/writeresume", method = RequestMethod.GET)
	public String mvWriteR(@RequestParam String mentor, Model model) {
		model.addAttribute("mentor", mentor);
		return "mentor/writeresume";
	}
	
	// #### 학교 검색 ####
	@RequestMapping(value = "/srcschool", method = RequestMethod.POST, headers = {"Content-Type=application/json"})
	public @ResponseBody String srchSchool(@RequestBody Map<String, String> srcCnd) {
		String json = resumeService.srchSchool(srcCnd);
//		System.out.println(json);
		return json;
	}
	
	// #### 자소서 작성 ####
	@RequestMapping(value = "/writeresume", method = RequestMethod.POST)
	public @ResponseBody String writeResume(EditDto editDto, Model model, HttpSession session) {
//		System.out.println(boardDto.getbSchoolName());
		MemberDto userInfo = (MemberDto) session.getAttribute("userInfo");
		editDto.setUserName(userInfo.getUserName());
		editDto.setbUserId(userInfo.getUserId());
		editDto.setMenteeId(userInfo.getUserId());
//		System.out.println(editDto.getUserName());
//		System.out.println(userInfo.getUserName());
		int result = resumeService.saveResume(editDto);
//		System.out.println(result);
		return result+"";
	}

	
//------------------------------------------------------------------------------------------------------------------------- 첨삭 작성
	// #### 첨삭 작성 페이지 이동 ####
	@RequestMapping(value = "/writeedit", method = RequestMethod.GET)
	public String mvWriteE(@RequestParam int pseq, Model model) {
		EditDto editDto = resumeService.getResume(pseq);
		model.addAttribute("editDto", editDto);
		model.addAttribute("pseq", pseq);
		return "mentor/edit";
	}
	
	// #### 첨삭 저장 ####
		@RequestMapping(value = "/writeedit", method = RequestMethod.POST)
		public @ResponseBody String writeEdit(EditDto editDto, Model model, HttpSession session) {
			
			MemberDto userInfo = (MemberDto) session.getAttribute("userInfo");
			editDto.setUserName(userInfo.getUserName());
			editDto.setbUserId(userInfo.getUserId());
			editDto.setMentorId(userInfo.getUserId());
			int result = resumeService.saveEdit(editDto);
			return result+"";
		}
//------------------------------------------------------------------------------------------------------------------------- 목록 화면
	// #### 자소서 목록 ####
	@RequestMapping("/resumelist")
	public String resumeList(@RequestParam Map<String, String> parameter, Model model, HttpSession session) {
		MemberDto userInfo = (MemberDto) session.getAttribute("userInfo");
		if(userInfo != null) {
			String userId = userInfo.getUserId();
			String schoolCate1 = ((parameter.get("schoolCate1") != null) ? parameter.get("schoolCate1").toString() : "h");
			String state = ((parameter.get("state") != null) ? parameter.get("state").toString() : "5");
			
			parameter.put("pageSize", "5");
			parameter.put("articleSize", "10");
			parameter.put("userId", userId);
			parameter.put("schoolCate1", schoolCate1);
			parameter.put("state", state);
			
			List<EditDto> list = resumeService.getResumeList(parameter);
			
			// 페이지 처리
			MentorPageNaviDto pageNavi = resumeService.getPageNavi(parameter);
			
			pageNavi.makeNavigator();
			
			model.addAttribute("parameter", parameter);
			model.addAttribute("resumelist", list);
			model.addAttribute("navigator", pageNavi);
		}
		return "mentor/resumelist";
		
	}

	// #### 첨삭 목록 ####
	@RequestMapping("/editlist")
	public String editlist(@RequestParam Map<String, String> parameter, Model model, HttpSession session) {
		MemberDto userInfo = (MemberDto) session.getAttribute("userInfo");
		if(userInfo != null) {
			String userId = userInfo.getUserId();
			String schoolCate1 = ((parameter.get("schoolCate1") != null) ? parameter.get("schoolCate1").toString() : "h");
			String state = ((parameter.get("state") != null) ? parameter.get("state").toString() : "5");
			
			parameter.put("pageSize", "5");
			parameter.put("articleSize", "10");
			parameter.put("userId", userId);
			parameter.put("schoolCate1", schoolCate1);
			parameter.put("state", state);
			
			List<EditDto> list = resumeService.getEditList(parameter);
			
			// 페이지 처리
			MentorPageNaviDto pageNavi = resumeService.getPageNavi(parameter);
			
			pageNavi.makeNavigator();
			
			int editcnt = resumeService.getEditCnt(parameter);
			int stayCnt = resumeService.getStayCnt(parameter);
			
			model.addAttribute("stayCnt", stayCnt);
			model.addAttribute("editcnt", editcnt);
			model.addAttribute("parameter", parameter);
			model.addAttribute("resumelist", list);
			model.addAttribute("navigator", pageNavi);
		}
		return "mentor/editlist";
	}
	
//------------------------------------------------------------------------------------------------------------------------- 상세 화면
	// #### 자소서 상세보기 ####
	@RequestMapping("/viewresume")
	public String mvViewR(@RequestParam Map<String, String> parameter, Model model) {
		EditDto editDto = null;
		if(parameter.get("seq") != null) {
			editDto = resumeService.getResume(Integer.parseInt(parameter.get("seq")));
		} else {
			editDto = resumeService.getEdit(Integer.parseInt(parameter.get("pseq")));
		}
			
		model.addAttribute("parameter", parameter);
		model.addAttribute("editDto", editDto);
		return "mentor/viewresume";
	}
	
	// #### 첨삭 상세보기 ####
	@RequestMapping("/viewedit")
	public String mvViewE(@RequestParam Map<String, String> parameter, Model model) {
		int seq = Integer.parseInt(parameter.get("seq"));
		EditDto editDto = resumeService.getResume(seq);
		model.addAttribute("parameter", parameter);
		model.addAttribute("editDto", editDto);
		return "mentor/viewedit";
	}
}
