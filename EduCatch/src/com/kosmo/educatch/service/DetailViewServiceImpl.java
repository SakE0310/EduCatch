package com.kosmo.educatch.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.apache.log4j.Logger;

import com.kosmo.educatch.dao.DetailViewMapper;
import com.kosmo.educatch.vo.AcademyVO;
import com.kosmo.educatch.vo.ConvenienceVO;
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
	
	// 학원 편의기능 정보
	@Override
	public ConvenienceVO conViewList(String ano) {
		log.info("DetailViewServiceImpl conViewList 시작 >>>> ");
		ConvenienceVO cvo = new ConvenienceVO();
		cvo = detailViewMapper.conViewList(ano);
		log.info("svo >>> " + cvo);

		log.info("DetailViewServiceImpl conViewList 끝 >>>> ");
		
		return cvo;
	}
	
	// 리뷰 게시판 평점
	@Override
	public AcademyVO gradeSelect(String rno) {
		log.info("DetailViewServiceImpl gradeSelect 시작 >>>> ");
		AcademyVO rvo = new AcademyVO();
		rvo = detailViewMapper.gradeSelect(rno);
		log.info("rvo >>> " + rvo);

		log.info("DetailViewServiceImpl gradeSelect 끝 >>>> ");
		
		return rvo;
	}

}
