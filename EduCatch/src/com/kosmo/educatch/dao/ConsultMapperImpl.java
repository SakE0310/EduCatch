package com.kosmo.educatch.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.kosmo.educatch.service.ConsultService;
import com.kosmo.educatch.vo.ConsultVO;

public class ConsultMapperImpl extends SqlSessionDaoSupport implements ConsultService{

	//상담 전체 조회
	@Override
	public List<ConsultVO> listConsult(ConsultVO param) {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("listConsult");
	}

}
