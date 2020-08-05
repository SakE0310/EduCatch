package com.kosmo.educatch.service;

import java.util.List;

import com.kosmo.educatch.vo.ReviewVO;

public interface ReviewService {
	
	public List<ReviewVO> listReview(ReviewVO param);
	public int insertReview(ReviewVO param);
	public int updateReview(ReviewVO param);
	public int deleteReview(String rbno);
	public int insertDisplay(ReviewVO param);
	public ReviewVO selectReview(String rbno);
	public ReviewVO selectUpdate(String rbno);
}
