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
	public List<AcademyVO> academyviewlist(AcademyVO param) {
		log.info("DetailViewMapperImpl.academyviewlist >>>> ");
		return getSqlSession().selectList("DetailViewMapper.academyviewlist",param);
	}
	
	//과목정보
	@Override
	public List<SubjectVO> subjectviewlist(SubjectVO param){
		log.info("DetailViewMapperImpl.subjectviewlist >>>> ");
		return getSqlSession().selectList("DetailViewMapper.subjectviewlist",param);
	}

}
