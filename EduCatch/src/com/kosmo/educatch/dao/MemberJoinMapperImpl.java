package com.kosmo.educatch.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.kosmo.educatch.vo.MemberVO;

public class MemberJoinMapperImpl extends SqlSessionDaoSupport implements MemberJoinMapper {

	@Override
	public int memberInsert(MemberVO param) {
		// TODO Auto-generated method stub
		int ins =(int)getSqlSession().insert("memberInsert");
		return ins;
	}

	@Override
	public int memberUpdeate(MemberVO param) {
		// TODO Auto-generated method stub
		return 0;
	}

}
