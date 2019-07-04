package com.kitri.godinator.admin.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kitri.godinator.admin.dao.SchoolDao;
import com.kitri.godinator.model.HSchoolDto;

public class SchoolServiceImpl implements SchoolService{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<HSchoolDto> HList(String name) {
		return sqlSession.getMapper(SchoolDao.class).schoolList(name); 
	}

}
