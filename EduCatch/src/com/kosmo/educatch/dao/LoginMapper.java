package com.kosmo.educatch.dao;

import com.kosmo.educatch.vo.MemberVO;

public interface LoginMapper {

	public String emailCheckID(MemberVO param);
		
	public MemberVO memberLoginInfo(MemberVO param);

	public void passwordChange(MemberVO param);

	public MemberVO getMidByFindPw(MemberVO param);
		
}

