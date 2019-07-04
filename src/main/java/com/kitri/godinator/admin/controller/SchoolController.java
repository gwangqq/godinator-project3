package com.kitri.godinator.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kitri.godinator.admin.service.SchoolService;
import com.kitri.godinator.model.HSchoolDto;


@Controller
@RequestMapping("/school")
public class SchoolController {

	//@Autowired
	private SchoolService schoolService;
	
	@RequestMapping("/view")
	public String viewMember(@RequestParam("name") String name) {
		// 고등학교 리스트, 대학교 리스트 같이 받아오기
		
		System.out.println("> SchoolController 들어옴!");
		
		List<HSchoolDto> hlist = schoolService.HList(name); // 고등학교 리스트
		//List<HSchoolDto> ulist = schoolService.UList(parameter); // 대학교
		
		HSchoolDto dto = new HSchoolDto();
		System.out.println("> DTO : " + dto.getSchoolName());
		return "admin/school";
	}
}
