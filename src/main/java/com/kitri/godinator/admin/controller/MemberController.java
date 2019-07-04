package com.kitri.godinator.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("member")
public class MemberController {

	@RequestMapping("view")
	public String viewMember() {
		return "admin/member";
	}
}
