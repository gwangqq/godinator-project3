package com.kitri.godinator.admin.dao;

import java.util.List;

import com.kitri.godinator.model.HSchoolDto;

public interface SchoolDao {
	List<HSchoolDto> schoolList(String name);
}
