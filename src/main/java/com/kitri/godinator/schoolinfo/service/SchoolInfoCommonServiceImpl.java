package com.kitri.godinator.schoolinfo.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.godinator.model.HSchoolDto;
import com.kitri.godinator.model.USchoolDto;
import com.kitri.godinator.schoolinfo.dao.SchoolInfoCommonDao;

@Service
public class SchoolInfoCommonServiceImpl implements SchoolInfoCommonService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<HSchoolDto> selectHSchoolName(Map<String, String> parameter) {
		return sqlSession.getMapper(SchoolInfoCommonDao.class).selectHSchoolName(parameter);
	}
	
	@Override
	public List<USchoolDto> selectUSchoolName(Map<String, String> parameter) {
		return sqlSession.getMapper(SchoolInfoCommonDao.class).selectUSchoolName(parameter);
	}

}
