package com.kitri.godinator.user.dao;

import java.util.Map;

import com.kitri.godinator.model.MemberDto;

public interface UserDao {

	int idCheck(String id);
	int register(MemberDto memberDto); 
	
	void updateMemberh(Map<String, String> map);
	void updateMemberu(Map<String, String> map);
	
	int insertMentorh(String id);
	int insertMentoru(String id);
	int insertMentor(String id);

}
