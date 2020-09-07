package com.kosmo.educatch.service;

import java.util.List;

import com.kosmo.educatch.vo.AcademyVO;
import com.kosmo.educatch.vo.MemberVO;
import com.kosmo.educatch.vo.ReviewVO;

public interface ReviewService {
	
	public List<ReviewVO> listReview(ReviewVO param);
	public List<ReviewVO> searchList(ReviewVO param);
	public List<AcademyVO> academyList(AcademyVO param);
	public int insertReview(ReviewVO param);
	public int updateReview(ReviewVO param);
	public int deleteReview(ReviewVO param);
	public int insertDisplay(ReviewVO param);
	public ReviewVO selectReview(ReviewVO param);
	public ReviewVO selectUpdate(ReviewVO param);
	public AcademyVO academyAno(AcademyVO avo);
	public MemberVO memberMno(MemberVO param);
}
