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
	//지역데이터
	@Override
<<<<<<< HEAD
	public List<SearchVO> SearchAreaList(SearchVO param) {
=======
	public List<SearchVO> searchAreaList(SearchVO param) {
>>>>>>> branch 'master' of https://github.com/SakE0310/EduCatch
		// TODO Auto-generated method stub
		log.info("service start >>> ");
		List<SearchVO> list = searchMapper.searchAreaList(param);
		log.info("service end >>> ");
		log.info("service list >>> "+list);
		return list;
	}

}
