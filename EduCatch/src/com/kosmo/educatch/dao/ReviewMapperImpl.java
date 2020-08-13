package com.kosmo.educatch.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.kosmo.educatch.vo.AcademyVO;
import com.kosmo.educatch.vo.ReviewVO;

public class ReviewMapperImpl extends SqlSessionDaoSupport implements ReviewMapper{

	//전체 조회
	@Override
	public List<ReviewVO> listReview(ReviewVO param) {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("listReview");
	}

	//입력
	@Override
	public int insertReview(ReviewVO param) {
		// TODO Auto-generated method stub
		return getSqlSession().insert("insertReview");
	}
	
	//목록페이지->글쓰기 페이지
	@Override
	public int insertDisplay(ReviewVO param) {
		// TODO Auto-generated method stub
		return 0;
	}

	//상세 조회
	@Override
	public ReviewVO selectReview(String rbno) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("selectReview");
	}

	@Override
	public int updateReview(ReviewVO param) {
		// TODO Auto-generated method stub
		return getSqlSession().update("updateReview");
	}

	@Override
	public ReviewVO selectUpdate(String rbno) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("selectUpdate");
	}

	@Override
	public int deleteReview(String rbno) {
		// TODO Auto-generated method stub
		return getSqlSession().update("deleteReview");
	}

	@Override
	public List<AcademyVO> academyList(AcademyVO param) {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("academyList");
	}

	@Override
	public List<ReviewVO> searchList(ReviewVO param) {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("searchList");
	}

	@Override
	public AcademyVO academyAno(String ano) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("academyAno");
	}
	
}
