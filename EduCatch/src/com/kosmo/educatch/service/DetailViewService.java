package com.kosmo.educatch.service;

import java.util.List;

import com.kosmo.educatch.vo.AcademyVO;
import com.kosmo.educatch.vo.ConvenienceVO;
import com.kosmo.educatch.vo.SubjectVO;

public interface DetailViewService {
	public SubjectVO DetailViewList(String sno);
	public ConvenienceVO conViewList(String ano);
}
