package com.kosmo.educatch.dao;

import com.kosmo.educatch.vo.MemberVO;

public interface MyPageMapper {
	public MemberVO selectMyPage(MemberVO param);
	public MemberVO selectPW(MemberVO param);
	public MemberVO checkPW(MemberVO param);
	public int editMyPage(MemberVO param);
	
}
