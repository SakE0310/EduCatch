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


	// ======== 로그인 체크 ==========
	@Override
	public List<MemberVO> loginCheck(MemberVO parma) {
		return session.selectOne("loginCheck");
				
	}
}
	
	

	
		
	

