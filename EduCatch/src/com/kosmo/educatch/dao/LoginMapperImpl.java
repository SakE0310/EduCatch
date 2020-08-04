package com.kosmo.educatch.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kosmo.educatch.vo.AMemberVO;
import com.kosmo.educatch.vo.MemberVO;

public class LoginMapperImpl implements LoginMapper{

	@Autowired
	private SqlSession session;
	
	
	@Override
	public MemberVO loginCheck(MemberVO mvo) {
		MemberVO mmvo = session.selectOne("loginCheck");
		
		return mmvo;
	}

	@Override
	public AMemberVO aLoginCheck(AMemberVO avo) {
		AMemberVO amvo = session.selectOne("aLoginCheck");
		
		return amvo;
	}
	
	
		
}
	

