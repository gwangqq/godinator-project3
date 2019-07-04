package com.kitri.godinator.schoolinfo.service;

import java.util.List;
import java.util.Map;

import com.kitri.godinator.model.HSchoolDto;
import com.kitri.godinator.model.USchoolDto;

public interface SchoolInfoCommonService {

	public List<HSchoolDto> selectHSchoolName(Map<String, String> parameter);
	public List<USchoolDto> selectUSchoolName(Map<String, String> parameter);
}
