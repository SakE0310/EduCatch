package com.kosmo.educatch.dao;

import java.util.List;

import com.kosmo.educatch.vo.AcademyVO;
import com.kosmo.educatch.vo.ConvenienceVO;
import com.kosmo.educatch.vo.MemberVO;
import com.kosmo.educatch.vo.ReviewVO;
import com.kosmo.educatch.vo.SubjectVO;

public interface DetailViewMapper {
	public AcademyVO academyView(String ano);
	public ConvenienceVO conView(String ano);
	public AcademyVO gradeView(String ano);
	public List<SubjectVO> subjectViewList(SubjectVO param);
	public List<ReviewVO> reviewList(ReviewVO param);
	public int insertBookmark(AcademyVO param);
	public int deleteBookmark(AcademyVO param);
	public List<AcademyVO> selectBookmark(AcademyVO param);
}
