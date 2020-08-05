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

	//지역 대분류
	@Override
	public List<SearchVO> getDistrict(SearchVO param) {
		log.info("service getDistrict start >>> ");
		List<SearchVO> list = searchMapper.getDistrict(param);
		log.info("service getDistrict end >>> ");
		log.info("service getDistrict list >>> "+list);
		return list;
	}//getDistrict

	//지역 소분류
	@Override
	public List<SearchVO> getCity(SearchVO param) {
		// TODO Auto-generated method stub
		log.info("service getCity start >>> ");
		List<SearchVO> list = searchMapper.getCity(param);
		log.info("service getCity end >>> ");
		log.info("service getCity list >>> "+list);
		return list;
	}
	
//	//지역 list
//	@Override
//	public List<SearchVO> selectArea(String district) {
//		// TODO Auto-generated method stub
//		log.info("service selectArea start >>> ");
//		List<SearchVO> list = searchMapper.selectArea(district);
//		log.info("service selectArea end >>> ");
//		log.info("service selectArea list >>> "+list);
//		return list;
//	}//end searchPopup
	
	
//	//전체선택완료
//	@Override
//	public List<SearchVO> selectComplete(SearchVO param) {
//		// TODO Auto-generated method stub
//		log.info("service searchCateList start >>> ");
//		List<SearchVO> list = searchMapper.selectComplete(param);
//		log.info("service searchCateList end >>> ");
//		log.info("service searchCateList list >>> "+list);
//		return list;
//	}//end selectCompelete
//-----------------------------------------------------------------------------	
//	//카테 list
//	@Override
//	public List<SearchVO> searchCateList(SearchVO param) {
//		// TODO Auto-generated method stub
//		log.info("service searchCateList start >>> ");
//		List<SearchVO> list = searchMapper.searchCateList(param);
//		log.info("service searchCateList end >>> ");
//		log.info("service searchCateList list >>> "+list);
//		return list;
//	}

//	@Override
//	public List<SearchVO> selectCate(SearchVO param) {
//		// TODO Auto-generated method stub
//		log.info("service selectCate start >>> ");
//		List<SearchVO> list = searchMapper.selectCate(param);
//		log.info("service selectCate end >>> ");
//		log.info("service selectCate list >>> "+list);
//		return list;
//	}
}
