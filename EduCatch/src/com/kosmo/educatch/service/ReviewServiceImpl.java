package com.kosmo.educatch.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosmo.educatch.dao.ReviewMapper;
import com.kosmo.educatch.vo.AcademyVO;
import com.kosmo.educatch.vo.MemberVO;
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
	public ReviewVO selectReview(ReviewVO param) {
		// TODO Auto-generated method stub
		return reviewMapper.selectReview(param);
	}

	
	@Override
	public ReviewVO selectUpdate(ReviewVO param) {
		// TODO Auto-generated method stub
		return reviewMapper.selectUpdate(param);
	}
	
	
	@Override
	public int updateReview(ReviewVO param) {
		// TODO Auto-generated method stub
		return reviewMapper.updateReview(param);
	}

	@Override
	public int deleteReview(ReviewVO param) {
		// TODO Auto-generated method stub
		return reviewMapper.deleteReview(param);
	}

	//학원명 조회
	@Override
	public List<AcademyVO> academyList(AcademyVO param) {
		// TODO Auto-generated method stub
		List<AcademyVO> list=new ArrayList<AcademyVO>();
		list=reviewMapper.academyList(param);

		return list;
	}

	@Override
	public List<ReviewVO> searchList(ReviewVO param) {
		// TODO Auto-generated method stub
		List<ReviewVO> list=new ArrayList<ReviewVO>();
		list=reviewMapper.searchList(param);
		
		return list;
	}

	@Override
	public AcademyVO academyAno(AcademyVO param) {
		
		AcademyVO avo = new AcademyVO();
		avo = reviewMapper.academyAno(param);
		
		return avo;
		
	}

	@Override
	public MemberVO memberMno(MemberVO param) {
		// TODO Auto-generated method stub
		MemberVO mvo = new MemberVO();
		mvo = reviewMapper.memberMno(param);
		
		return mvo;
	}
	
	
}
