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
<<<<<<< HEAD
		List<SearchVO> list = getSqlSession().selectList("com.kosmo.educatch.dao.SearchDAO.areaData");
=======
<<<<<<< HEAD
		List<SearchVO> list = getSqlSession().selectList("com.kosmo.educatch.dao.SearchDAO.areaData");
=======
		List<SearchVO> list = getSqlSession().selectList("searchAreaList");
>>>>>>> branch 'master' of https://github.com/SakE0310/EduCatch
>>>>>>> branch 'master' of https://github.com/SakE0310/EduCatch.git
		log.info("Mapper end >>> ");
		log.info("Mapper list >>> "+list);
		return list;
	}
}
