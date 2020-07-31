package com.kosmo.educatch.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.kosmo.educatch.vo.ReviewVO;

public class ReviewMapperImpl extends SqlSessionDaoSupport implements ReviewMapper{

	//전체 조회
	@Override
	public List<ReviewVO> listReview(ReviewVO param) {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("listReview");
	}
	
	
	

}
