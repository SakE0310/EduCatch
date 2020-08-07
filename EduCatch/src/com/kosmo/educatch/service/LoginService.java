package com.kosmo.educatch.service;

import javax.servlet.http.HttpSession;

import com.kosmo.educatch.vo.AMemberVO;
import com.kosmo.educatch.vo.MemberVO;

public interface LoginService {

	// 일반 회원 로그인 체크
	//public MemberVO loginCheck(MemberVO mvo);
	
	// 학원 회원 로그인 체크
	public AMemberVO ALoginCheck(AMemberVO avo);

	
	// 로그인 체크
	public boolean logincheck(MemberVO mvo, HttpSession session);
	
	// 로그인 정보
	public MemberVO viewMember(MemberVO mvo);
	
	// 로그아웃
	public void logout(HttpSession session);
	
	
	
}
