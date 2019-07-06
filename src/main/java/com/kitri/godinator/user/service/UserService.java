package com.kitri.godinator.user.service;

import java.util.Map;

import com.kitri.godinator.model.MemberDto;
import com.kitri.godinator.model.MentorDto;

public interface UserService {
	String idCheck(String id);
	int register(MemberDto memberDto);
	int mentorRegister(Map<String, String> map);
	
}
