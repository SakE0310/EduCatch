package com.kosmo.educatch.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.kosmo.educatch.vo.MemberVO;

public class AmemberJoinMapperImpl extends SqlSessionDaoSupport implements AmemberJoinMapper {

	@Override
	public int aMemberInsert(MemberVO param) {
		// TODO Auto-generated method stub
		int ins = (int)getSqlSession().insert("aMemberInsert");
		return ins;
	}

	@Override
	public int aMemberUpdate(MemberVO param) {
		// TODO Auto-generated method stub
		int upd = (int)getSqlSession().update("aMemberUpdate");
		return upd;
	}


}
