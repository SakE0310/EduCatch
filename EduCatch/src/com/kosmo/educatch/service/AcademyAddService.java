package com.kosmo.educatch.service;

import java.util.List;

import com.kosmo.educatch.vo.AcademyVO;
import com.kosmo.educatch.vo.ConvenienceVO;
import com.kosmo.educatch.vo.SearchVO;

public interface AcademyAddService {
	public AcademyVO selectCategory(AcademyVO avo);
	public int insertAcademy(AcademyVO param);
	public int insertConveniece(ConvenienceVO param);
}
