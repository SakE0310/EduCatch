package com.kosmo.educatch.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.kosmo.educatch.vo.SearchVO;

public class SearchMapperImpl extends SqlSessionDaoSupport implements SearchMapper{

	private static Logger log = Logger.getLogger(SearchMapperImpl.class);
	
	//지역list
	@Override
	public List<SearchVO> selectArea(String district) {
		// TODO Auto-generated method stub
		log.info("Mapper searchPopup start >>> ");
		List<SearchVO> list = getSqlSession().selectList("selectArea");
		log.info("Mapper searchPopup list>>> "+list);
		log.info("Mapper searchPopup end >>> ");
		return list;
	}//end searchPopup
	
	//지역select 
	@Override
	public List<SearchVO> searchAreaList(SearchVO param) {
		// TODO Auto-generated method stub
		log.info("Mapper searchAreaList start >>> ");
		List<SearchVO> list = getSqlSession().selectList("searchAreaList");
		log.info("Mapper searchAreaList list >>> "+list);
		log.info("Mapper searchAreaList end >>> ");
		return list;
	}//end searchAreaList
	
	//전체선택완료
	@Override
	public List<SearchVO> selectComplete(SearchVO param){
		List<SearchVO> list = getSqlSession().selectList("selectComplete");
		return list;
	}//end selectCompelete
//-------------------------------------------------------------------------
	//cate list
	@Override
	public List<SearchVO> searchCateList(SearchVO param) {
		// TODO Auto-generated method stub
		log.info("Mapper searchCateList start >>> ");
		List<SearchVO> list = getSqlSession().selectList("searchCateList");
		log.info("Mapper searchCateList list >>> "+list);
		log.info("Mapper searchCateList end >>> ");
		return list;
	}
	//cata select
	@Override
	public List<SearchVO> selectCate(SearchVO param) {
		// TODO Auto-generated method stub
		log.info("Mapper selectCate start >>> ");
		List<SearchVO> list = getSqlSession().selectList("selectCate");
		log.info("Mapper selectCate list >>> "+list);
		log.info("Mapper selectCate end >>> ");
		return list;
	}
	
}
