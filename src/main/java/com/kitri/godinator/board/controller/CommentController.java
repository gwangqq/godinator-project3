package com.kitri.godinator.board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kitri.godinator.board.service.CommentService;
import com.kitri.godinator.model.ReplyDto;
import com.kitri.godinator.model.MemberDto;

@RestController
@RequestMapping("/comment")
public class CommentController {

	@Autowired
	private CommentService commentService;

	// JSON으로 넘어온 거는 받을 때 JSON인자 값에 @RequestBody, return type에 @RequestBody 붙여준다
	@RequestMapping(method = RequestMethod.POST, consumes = "application/json", headers = {
			"Content-type=application/json" })
	public String write(@RequestBody ReplyDto replyDto, HttpSession session) {
		System.out.println("Controller (post): " + replyDto);
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		
		if (memberDto != null) {
			System.out.println(memberDto.getUserId());
			replyDto.setCUserId(memberDto.getUserId());
			System.out.println("C : " + replyDto);
			commentService.writeMemo(replyDto);
			String json = commentService.listMemo(replyDto.getBoardNo());
			return json;
		}

		return "";
	}
}
