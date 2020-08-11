package com.kosmo.educatch.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosmo.educatch.dao.SearchMapper;
import com.kosmo.educatch.vo.ReviewVO;
import com.kosmo.educatch.vo.SearchVO;

@Service
@Transactional
public class SearchServiceImpl implements SearchService{
	private static Logger log = Logger.getLogger(SearchServiceImpl.class);
	
	@Autowired
	private SearchMapper searchMapper;

	//지역 대분류
	@Override
	public List<SearchVO> getDistrict(SearchVO param) {
		log.info("service getDistrict start >>> ");
		List<SearchVO> list = searchMapper.getDistrict(param);
		log.info("service getDistrict list >>> "+list);
		log.info("service getDistrict end >>> ");
		return list;
	}//getDistrict

	//지역 소분류
	@Override
	public List<SearchVO> getCity(SearchVO param) {
		// TODO Auto-generated method stub
		log.info("service getCity start >>> ");
		List<SearchVO> list = searchMapper.getCity(param);
		log.info("service getCity list >>> "+list);
		log.info("service getCity end >>> ");
		return list;
	}//getCity

	//학원리스트 가져오기
	@Override
	public List<SearchVO> getAcaList(SearchVO param) {
		// TODO Auto-generated method stub
		log.info("service getAcaList start >>> ");
		List<SearchVO> list = searchMapper.getAcaList(param);
		log.info("service getAcaList list >>> "+list);
		log.info("service getAcaList end >>> ");
		return list;
	}//getAcaList

	//평점가져오기
	@Override
	public List<SearchVO> getReview(SearchVO param) {
		// TODO Auto-generated method stub
		log.info("service getReview start >>> ");
		List<SearchVO> list = searchMapper.getReview(param);
		log.info("service getReview list >>> "+list);
		log.info("service getReview end >>> ");
		return list;
	}//getReview

}
