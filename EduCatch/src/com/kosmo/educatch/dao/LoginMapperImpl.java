package com.kosmo.educatch.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.kosmo.educatch.vo.MemberVO;

public class LoginMapperImpl extends SqlSessionDaoSupport implements LoginMapper{

	
	


	// ======== 로그인 체크 ==========
	@Override
	public MemberVO loginCheck(MemberVO param) {
		MemberVO mvo = new MemberVO();
		mvo = getSqlSession().selectOne("loginCheck");
		return mvo;
				
	}
}
	
	

	
		
	

