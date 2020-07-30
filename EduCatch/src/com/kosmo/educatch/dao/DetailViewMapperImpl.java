package com.kosmo.educatch.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.kosmo.educatch.vo.DetailViewVO;

import org.apache.log4j.Logger;

public class DetailViewMapperImpl extends SqlSessionDaoSupport implements DetailViewMapper{
	
	private static Logger log = Logger.getLogger(DetailViewMapperImpl.class);

	@Override
	public List<DetailViewVO> detailviewlist(DetailViewVO param) {
		log.info("DetailViewMapperImpl listDetailView >>>> ");
		return getSqlSession().selectList("detailviewlist");
	}

}
