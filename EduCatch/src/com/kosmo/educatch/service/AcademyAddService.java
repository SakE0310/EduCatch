package com.kosmo.educatch.service;

import java.util.List;

import com.kosmo.educatch.vo.AcademyVO;
import com.kosmo.educatch.vo.SearchVO;

public interface AcademyAddService {
	public SearchVO selectCategory(SearchVO svo);
	public int insertAcademy(AcademyVO param);
}
