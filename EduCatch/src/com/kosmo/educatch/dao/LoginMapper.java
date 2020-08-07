package com.kosmo.educatch.dao;

import javax.servlet.http.HttpSession;

import com.kosmo.educatch.vo.AMemberVO;
import com.kosmo.educatch.vo.MemberVO;

public interface LoginMapper {
	
		
		AMemberVO aLoginCheck(AMemberVO avo);
		
		// 로그인 체크
		public boolean loginCheck(MemberVO mvo);
		
		// 로그인 정보
		public MemberVO viewMember(MemberVO mvo); 
			
		
		// 로그아웃
		public void logout(HttpSession session);
		
	
	}

