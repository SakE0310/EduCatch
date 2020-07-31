package com.kosmo.educatch.dao;

import java.util.List;

import com.kosmo.educatch.vo.AcademyVO;
import com.kosmo.educatch.vo.SubjectVO;

public interface DetailViewMapper {
	public List<AcademyVO> academyviewlist(AcademyVO param);
	public List<SubjectVO> subjectviewlist(SubjectVO param);

}
