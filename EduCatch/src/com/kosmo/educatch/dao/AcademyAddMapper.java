package com.kosmo.educatch.dao;

import java.util.List;

import com.kosmo.educatch.vo.AcademyVO;
import com.kosmo.educatch.vo.SearchVO;

public interface AcademyAddMapper {
	public SearchVO selectCategory(SearchVO svo);
	public int insertAcademy(AcademyVO param);
}
