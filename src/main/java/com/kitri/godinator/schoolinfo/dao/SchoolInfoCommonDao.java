package com.kitri.godinator.schoolinfo.dao;

import com.kitri.godinator.model.HSchoolDto;
import com.kitri.godinator.model.USchoolDto;

public interface SchoolInfoCommonDao {
   public HSchoolDto selectHSchoolName(String schoolName);
   public USchoolDto selectUSchoolName(String schoolName);
}