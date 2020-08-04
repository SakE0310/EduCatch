package com.kosmo.educatch.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.kosmo.educatch.vo.AcademyVO;
import com.kosmo.educatch.vo.SubjectVO;

import org.apache.log4j.Logger;

public class DetailViewMapperImpl extends SqlSessionDaoSupport implements DetailViewMapper{
	
	private static Logger log = Logger.getLogger(DetailViewMapperImpl.class);

	//학원정보
	@Override
	public List<AcademyVO> academyViewList(AcademyVO param) {
		log.info("DetailViewMapperImpl.academyviewlist >>>> ");
		return getSqlSession().selectList("DetailViewMapper.academyViewList",param);
	}
	
	//과목정보
	@Override
	public List<SubjectVO> subjectViewList(SubjectVO param){
		log.info("DetailViewMapperImpl.subjectviewlist >>>> ");
		return getSqlSession().selectList("DetailViewMapper.subjectViewList",param);
	}

}
