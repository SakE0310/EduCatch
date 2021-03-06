package com.kosmo.educatch.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.kosmo.educatch.service.ConsultService;
import com.kosmo.educatch.vo.AcademyVO;
import com.kosmo.educatch.vo.ConsultVO;
import com.kosmo.educatch.vo.MemberVO;

public class ConsultMapperImpl extends SqlSessionDaoSupport implements ConsultMapper{

	//상담 전체 조회
	@Override
	public List<ConsultVO> listConsult(ConsultVO param) {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("listConsult");
	}

	@Override
	public int insertConsult(ConsultVO param) {
		// TODO Auto-generated method stub
		return getSqlSession().insert("insertConsult");
	}

	@Override
	public ConsultVO selectConsult(ConsultVO param) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("selectConsult");
	}

	@Override
	public ConsultVO selectUpdate1(ConsultVO param) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("selectUpdate1");
	}

	@Override
	public int updateConsult(ConsultVO param) {
		// TODO Auto-generated method stub
		return getSqlSession().update("updateConsult");
	}

	@Override
	public int deleteConsult(ConsultVO param) {
		// TODO Auto-generated method stub
		return getSqlSession().update("deleteConsult");
	}

	@Override
	public List<ConsultVO> searchConsult(ConsultVO param) {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("searchConsult");
	}

	@Override
	public List<AcademyVO> cacademyList(AcademyVO param) {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("cacademyList");
	}
	
	@Override
	public AcademyVO academyAno(AcademyVO ano) {
		return getSqlSession().selectOne("academyAno");
	}

	@Override
	public MemberVO memberMno(MemberVO param) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("memberMno");
	}

}
