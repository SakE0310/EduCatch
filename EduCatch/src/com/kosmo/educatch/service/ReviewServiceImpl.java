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

	//입력
	@Override
	public int insertReview(ReviewVO param) {
		
		return reviewMapper.insertReview(param);
	}

	//목록페이지에서 글쓰기 페이지로 넘어가기 위한 함수
	@Override
	public int insertDisplay(ReviewVO param) {
		// TODO Auto-generated method stub
		return reviewMapper.insertDisplay(param);
	}

	@Override
	public ReviewVO selectReview(String rbno) {
		// TODO Auto-generated method stub
		return reviewMapper.selectReview(rbno);
	}

	
	@Override
	public ReviewVO selectUpdate(String rbno) {
		// TODO Auto-generated method stub
		return reviewMapper.selectUpdate(rbno);
	}
	
	
	@Override
	public int updateReview(ReviewVO param) {
		// TODO Auto-generated method stub
		return reviewMapper.updateReview(param);
	}
	
	
}
