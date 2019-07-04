package com.kitri.godinator.admin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kitri.godinator.model.HSchoolDto;

@Service
public interface SchoolService {
	List<HSchoolDto> HList(String name); 
}
