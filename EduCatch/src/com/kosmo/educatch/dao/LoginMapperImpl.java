package com.kosmo.educatch.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kosmo.educatch.vo.AMemberVO;
import com.kosmo.educatch.vo.MemberVO;

public class LoginMapperImpl implements LoginMapper{

	
	
	@Autowired
	private SqlSession session;

	@Override
	public AMemberVO aLoginCheck(AMemberVO avo) {
		// TODO Auto-generated method stub
		return null;
	}

	// ======== 로그인 체크 ==========
	@Override
	public List<MemberVO> loginCheck(MemberVO parma) {
		String name = session.selectOne("loginCheck");
		return null;
				
	}

	// ======== 로그인 정보 ==========
	@Override
	public MemberVO viewMember(MemberVO mvo) {
		
		return session.selectOne("viewMember");
	}

	
	@Override
	public void logout(HttpSession session) {
		
	}
	
	

	
		
}
	

