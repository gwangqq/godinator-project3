package com.kitri.godinator.mentor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/chat")
public class ChatController {

	@RequestMapping("/findmentor")
	public String findMentor() {
		return "error";
	}
}
