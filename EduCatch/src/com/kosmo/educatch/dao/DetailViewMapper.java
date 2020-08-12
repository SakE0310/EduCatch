package com.kosmo.educatch.dao;

import java.util.List;

import com.kosmo.educatch.vo.AcademyVO;
import com.kosmo.educatch.vo.ConvenienceVO;
import com.kosmo.educatch.vo.ReviewVO;
import com.kosmo.educatch.vo.SubjectVO;

public interface DetailViewMapper {
	public SubjectVO DetailViewList(String sno);
	public ConvenienceVO conViewList(String ano);
	public AcademyVO gradeSelect(String rno);
}
