package com.kitri.godinator.user.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.godinator.model.MemberDto;
import com.kitri.godinator.model.MentorDto;
import com.kitri.godinator.user.dao.UserDao;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public String idCheck(String id) {
		int cnt = sqlSession.getMapper(UserDao.class).idCheck(id);
		JSONObject json = new JSONObject();
		json.put("idcount", cnt);
		return json.toString();
		
	}

	@Override
	public int register(MemberDto memberDto) {
		//System.out.println("register service");

//		String userCate = memberDto.getUserCate();
//		String cate="";
//		if(userCate.equals("학부모")) {
//			cate="p";
//			memberDto.setUserCate(cate);
//		}else {
//			cate="s";
//			memberDto.setUserCate(cate);
//		}
		
		System.out.println(memberDto.getUserCate());
		
		return sqlSession.getMapper(UserDao.class).register(memberDto);
	}

	@Override
	public int mentorRegister(Map<String, String> map) {
		System.out.println("mentorregister service");
		//int cnt = 0;
		String id = map.get("registerId");
		String highName = map.get("highSchool");
		String uniName = map.get("university");
		String hcheck = map.get("hcheck");
		String ucheck = map.get("ucheck");
		String hcate = map.get("hSchoolCate");
		String ucate = map.get("uSchoolCate");
		
//		1)hName이 있으면 member에 학교 코드, cate 업데이트(cnt++ => 1)  id/highName  
//		2)uName이 있으면 member에 학교 코드, cate 업데이트(cnt++ => 2)  id/uniName
//		3)hcheck되어 있으면 mentor에서 mentor R, cate h로 insert (cnt++ => 3)	id
//		4)ucheck되어 있으면 mentor에서 mentor R, cate u로 insert (cnt++ => 4)	id
//		5)둘다 체크 안되어 있으면, mentor N, cate null 	id
//		6)그 외(학교이름도 없고 선택도 안되어 있음) >> ?
		
		
		if(highName != "") {//member에 학교코드, 카테고리추가 (update) --고등학교
			 sqlSession.getMapper(UserDao.class).updateMemberh(map);//id, uniName
			//cnt++; 
		}
		
		if(uniName != ""){
			 sqlSession.getMapper(UserDao.class).updateMemberu(map);//id, highName
			//cnt++; //1	
		}
		
			
		if(hcheck != ""){
			return sqlSession.getMapper(UserDao.class).insertMentorh(id);	//R, h
			
		}else if(ucheck != ""){
			return sqlSession.getMapper(UserDao.class).insertMentoru(id);  //R, u		
			
		}else {
			return sqlSession.getMapper(UserDao.class).insertMentor(id);  //N, ""		
		}
		
	}

}










