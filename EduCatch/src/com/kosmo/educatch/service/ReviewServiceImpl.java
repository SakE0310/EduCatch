package com.kosmo.educatch.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosmo.educatch.dao.ReviewMapper;
import com.kosmo.educatch.vo.ReviewVO;

@Service
@Transactional
public class ReviewServiceImpl implements ReviewService{

	
	private static Logger log=Logger.getLogger(ReviewServiceImpl.class);

	@Autowired
	private ReviewMapper reviewMapper;
	
	//전체조회
	@Override
	public List<ReviewVO> listReview(ReviewVO param) {
		log.info("ReviewServiceImpl listReview >>> 호출성공");
		
		List<ReviewVO> list=new ArrayList<ReviewVO>();
		list=reviewMapper.listReview(param);
		
		log.info("ReviewServiceImpl listReview >>> 끝");
		return list;
	}
	
	
}
