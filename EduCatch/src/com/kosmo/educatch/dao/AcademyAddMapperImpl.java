package com.kosmo.educatch.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.kosmo.educatch.vo.AcademyVO;
import com.kosmo.educatch.vo.SearchVO;

public class AcademyAddMapperImpl extends SqlSessionDaoSupport implements AcademyAddMapper {

	private static Logger log = Logger.getLogger(AcademyAddMapperImpl.class);
	
	// 학원 등록
	@Override
	public int insertAcademy(AcademyVO param) {
		log.info("AcademyAddMapperImpl.insertAcademy >>>");
		int nCnt = getSqlSession().insert("AcademyAddMapper.insertAcademy", param);
		return nCnt;
	}// end of insertAcademy

	//카테고리 정보
	@Override
	public SearchVO selectCategory(SearchVO svo) {
		log.info("AcademyAddMapperImpl.selectCategory >>>");
		return getSqlSession().selectOne("selectCategory");
	}//end of selectCategory
	
	

}
