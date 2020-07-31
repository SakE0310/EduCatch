package com.kosmo.educatch.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.kosmo.educatch.vo.SearchVO;

public class SearchMapperImpl extends SqlSessionDaoSupport implements SearchMapper{

	private static Logger log = Logger.getLogger(SearchMapperImpl.class);

	//지역데이터
	@Override
	public List<SearchVO> searchAreaList(SearchVO param) {
		// TODO Auto-generated method stub
		log.info("Mapper start >>> ");
		List<SearchVO> list = getSqlSession().selectList("areaData");
		log.info("Mapper end >>> ");
		log.info("Mapper list >>> "+list);
		return list;
	}
}
