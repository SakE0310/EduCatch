package com.kosmo.educatch.service;

import com.kosmo.educatch.vo.MemberVO;

public interface MyPageService  {
	public MemberVO selectMyPage(MemberVO param);
	public MemberVO selectPW(MemberVO param);
	public MemberVO checkPW(MemberVO param);
}
