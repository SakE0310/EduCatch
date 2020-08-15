package com.kosmo.educatch.service;

import com.kosmo.educatch.vo.MemberVO;

public interface LoginService {
	
	// 로그인 체크
	public MemberVO loginCheck(MemberVO param);
	
	public String passwordReset(MemberVO param);
	
	public String passwordChange(MemberVO param);
}
