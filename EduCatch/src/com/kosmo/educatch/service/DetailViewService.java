package com.kosmo.educatch.service;

import java.util.List;

import com.kosmo.educatch.vo.AcademyVO;
import com.kosmo.educatch.vo.SubjectVO;

public interface DetailViewService {
	public List<AcademyVO> academyViewList(AcademyVO param);
	public List<SubjectVO> subjectViewList(SubjectVO param);
}
