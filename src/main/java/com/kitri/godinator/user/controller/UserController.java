package com.kitri.godinator.user.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kitri.godinator.model.MemberDto;

import com.kitri.godinator.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/idcheck", method = RequestMethod.GET)
	public @ResponseBody String idCheck(@RequestParam (name="checkid", defaultValue = "") String id) {
		
		String json = userService.idCheck(id);
		return json.toString();
		
	}
	
	@RequestMapping(value="/register", method = RequestMethod.POST)
	public String register(MemberDto memberDto, Model model) {
		//System.out.println("register controller");
		
		int cnt = userService.register(memberDto);
		if(cnt !=0) {
			model.addAttribute("registerInfo", memberDto);
			return "user/register_2";
		}else {
			return "";
		}
		
	}
	
	@RequestMapping(value="/mentorRegister", method = RequestMethod.POST)
	public String mentorRegister( 
			MemberDto memberDto,//학교별 cate 담겨있음
			@RequestParam("registerId") String registerId,
			@RequestParam("hSchoolCate") String hSchoolCate,
			@RequestParam("uSchoolCate") String uSchoolCate,
			@RequestParam(name ="highSchool", defaultValue = "") String highSchool,
			@RequestParam(name="university", defaultValue = "") String university,
			@RequestParam(name="uniMentorCheck", defaultValue = "") String ucheck,
			@RequestParam(name="highMentorCheck", defaultValue = "") String hcheck,
			Model model) {		
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("registerId", registerId);//로그인한 아이디
		map.put("highSchool", highSchool);//입력한 고등학교 이름
		map.put("university", university);//입력한 대학교 이름
		map.put("ucheck", ucheck);//대학교 멘토 체크 유무
		map.put("hcheck", hcheck);//고등학교 멘토 체크 유무
		map.put("hSchoolCate", hSchoolCate);//고등학교 멘토 체크 유무
		map.put("uSchoolCate", uSchoolCate);//고등학교 멘토 체크 유무
	
		int cnt = userService.mentorRegister(map);
		if(cnt >0 ) {
			model.addAttribute("registerId", registerId);
			model.addAttribute("highSchool", highSchool);
			model.addAttribute("university", university);
			return "user/register_3";
		}else {
			return "error";
		}
		
	}
	
	

}
