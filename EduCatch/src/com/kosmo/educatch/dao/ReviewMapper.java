package com.kosmo.educatch.dao;

import java.util.List;

import com.kosmo.educatch.vo.ReviewVO;

public interface ReviewMapper {
	
	public List<ReviewVO> listReview(ReviewVO param);
}
