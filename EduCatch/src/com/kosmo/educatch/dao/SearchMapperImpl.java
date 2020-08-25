package com.kosmo.educatch.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.kosmo.educatch.vo.AcademyVO;
import com.kosmo.educatch.vo.SearchVO;

public class SearchMapperImpl extends SqlSessionDaoSupport implements SearchMapper{

	private static Logger log = Logger.getLogger(SearchMapperImpl.class);
	
	//지역 대분류
	@Override
	public List<SearchVO> getDistrict(SearchVO param) {
		// TODO Auto-generated method stub
		log.info("Mapper getDistrict start >>> ");
		List<SearchVO> list = getSqlSession().selectList("getDistrict");
		log.info("Mapper getDistrict list >>> "+list);
		log.info("Mapper getDistrict end >>> ");
		return list;
	}//getDistrict

	//지역 소분류
	@Override
	public List<SearchVO> getCity(SearchVO param) {
		// TODO Auto-generated method stub
		log.info("Mapper getCity start >>> ");
		List<SearchVO> list = getSqlSession().selectList("getCity");
		log.info("Mapper getCity list >>> "+list);
		log.info("Mapper getCity end >>> ");
		return list;
	}//getCity

	//학원리스트 가져오기
	@Override
	public List<AcademyVO> getAcaList(AcademyVO param) {
		// TODO Auto-generated method stub
		log.info("Mapper getAcaList start >>> ");
		List<AcademyVO> list = getSqlSession().selectList("getAcaList");
		log.info("Mapper getAcaList list >>> "+list);
		log.info("Mapper getAcaList end >>> ");
		return list;
	}//getAcaList

}
