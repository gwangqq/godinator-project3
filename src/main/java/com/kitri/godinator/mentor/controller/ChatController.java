package com.kitri.godinator.mentor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/chat")
public class ChatController{

<<<<<<< Upstream, based on develop

	

=======
	@RequestMapping("/findmentor")
	public String findMentor() {
		return "error";
	}
>>>>>>> 4861a4e DB 데이터 타입 수정 및 ERROR페이지 추가
}
