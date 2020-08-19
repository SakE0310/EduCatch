package com.kosmo.educatch.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.kosmo.educatch.manager.LoggerManager;
import com.kosmo.educatch.vo.MemberVO;

public class LoginMapperImpl implements LoginMapper{

	private Logger log = LoggerManager.getInstance().getLogger(LoginMapperImpl.class);
	
	@Autowired
	private SqlSession session;

	/*
	 * 일반회원 LOGIN INFO
	 * RETURN MemberVO
	 */
	@Override
	public MemberVO memberLoginInfo(MemberVO param) {                                                   
		MemberVO member= session.selectOne("memberLoginInfo",param);
		log.info("member >>> " + member);
		return member;
	}

	/*
	 * 이메일 인증이 완료된 Member 확인
	 * 난수관련 'Y' 값 확인
	 */
	@Override
	public String emailCheckID(MemberVO param) {
		String member= session.selectOne("emailCheckID",param);
		return member;
	}

	@Override
	public void passwordChange(MemberVO param) {
		session.update("passwordChange",param);
	}
		
}
	

