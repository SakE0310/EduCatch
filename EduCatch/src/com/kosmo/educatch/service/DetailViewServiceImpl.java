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

	// 학원정보,과목정보
	@Override
	public SubjectVO DetailViewList(String sno) {
		log.info("DetailViewServiceImpl DetailViewList 시작 >>>> ");
		SubjectVO svo = new SubjectVO();
		svo = detailViewMapper.DetailViewList(sno);
		log.info("svo >>> " + svo);

		log.info("DetailViewServiceImpl DetailViewList 끝 >>>> ");

		return svo;
	}

}
