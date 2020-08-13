package com.kosmo.educatch.service;

import java.util.List;

import com.kosmo.educatch.vo.AcademyVO;
import com.kosmo.educatch.vo.ConvenienceVO;
import com.kosmo.educatch.vo.ReviewVO;
import com.kosmo.educatch.vo.SubjectVO;

public interface DetailViewService {
	public AcademyVO academyView(String ano);
	public ConvenienceVO conView(String ano);
	public AcademyVO gradeView(String ano);
	public List<SubjectVO> subjectViewList(SubjectVO param);
	public List<ReviewVO> reviewList(ReviewVO param);
	public int insertBookmark(AcademyVO param);
	public int deleteBookmark(AcademyVO param);
}
