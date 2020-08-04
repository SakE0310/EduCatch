package com.kosmo.educatch.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.apache.log4j.Logger;

import com.kosmo.educatch.dao.DetailViewMapper;
import com.kosmo.educatch.vo.AcademyVO;
import com.kosmo.educatch.vo.SubjectVO;

@Service
@Transactional
public class DetailViewServiceImpl implements DetailViewService {
	private static Logger log = Logger.getLogger(DetailViewServiceImpl.class);

	@Autowired
	private DetailViewMapper detailViewMapper;

	// 학원정보
	@Override
	public List<AcademyVO> academyViewList(AcademyVO param) {
		List<AcademyVO> list = new ArrayList<AcademyVO>();
		list = detailViewMapper.academyViewList(param);

		log.info("DetailViewServiceImpl academyviewlist >>>> ");
		log.info("DetailViewServiceImpl academyviewlist param >>>> " + param);

		return list;
	}

	// 과목정보
	@Override
	public List<SubjectVO> subjectViewList(SubjectVO param) {
		List<SubjectVO> list = new ArrayList<SubjectVO>();
		list = detailViewMapper.subjectViewList(param);

		log.info("DetailViewServiceImpl subjectviewlist >>>> ");
		log.info("DetailViewServiceImpl subjectviewlist param >>>> " + param);

		return list;
	}

}
