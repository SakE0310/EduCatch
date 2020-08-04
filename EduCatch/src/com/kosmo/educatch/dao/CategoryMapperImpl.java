package com.kosmo.educatch.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.kosmo.educatch.vo.SearchVO;

public class CategoryMapperImpl extends SqlSessionDaoSupport implements CategoryMapper {

	private static Logger log = Logger.getLogger(CategoryMapperImpl.class);
	
	@Override
	public List<SearchVO> getCmajorList() {
		log.info("CategoryMapperImpl.getCmajor >>>> ");
		return getSqlSession().selectList("CategoryMapper.getCmajorList");
	}

	@Override
	public List<SearchVO> getCminorList(String major) {
		
		return getSqlSession().selectList("CategoryMapper.getCminorList", major);
	}


}
