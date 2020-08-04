package com.kosmo.educatch.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosmo.educatch.dao.SearchMapper;
import com.kosmo.educatch.vo.SearchVO;

@Service
@Transactional
public class SearchServiceImpl implements SearchService{
	private static Logger log = Logger.getLogger(SearchServiceImpl.class);
	
	@Autowired
	private SearchMapper searchMapper;
	//지역 list
	@Override
	public List<SearchVO> selectArea(SearchVO param) {
		// TODO Auto-generated method stub
		log.info("service selectArea start >>> ");
		List<SearchVO> list = searchMapper.selectArea(param);
		log.info("service selectArea end >>> ");
		log.info("service selectArea list >>> "+list);
		return list;
	}//end searchPopup
	
	//지역 select
	@Override
	public List<SearchVO> searchAreaList(SearchVO param) {
		log.info("service searchAreaList start >>> ");
		List<SearchVO> list = searchMapper.searchAreaList(param);
		log.info("service searchAreaList end >>> ");
		log.info("service searchAreaList list >>> "+list);
		return list;
	}//end searchAreaList
	
	//전체선택완료
	@Override
	public List<SearchVO> selectComplete(SearchVO param) {
		// TODO Auto-generated method stub
		log.info("service searchCateList start >>> ");
		List<SearchVO> list = searchMapper.selectComplete(param);
		log.info("service searchCateList end >>> ");
		log.info("service searchCateList list >>> "+list);
		return list;
	}//end selectCompelete
//-----------------------------------------------------------------------------	
	//카테 list
	@Override
	public List<SearchVO> searchCateList(SearchVO param) {
		// TODO Auto-generated method stub
		log.info("service searchCateList start >>> ");
		List<SearchVO> list = searchMapper.searchCateList(param);
		log.info("service searchCateList end >>> ");
		log.info("service searchCateList list >>> "+list);
		return list;
	}
}
