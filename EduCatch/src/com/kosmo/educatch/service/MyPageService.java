package com.kosmo.educatch.service;

import java.util.List;

import com.kosmo.educatch.vo.MemberVO;
import com.kosmo.educatch.vo.ConsultVO;

public interface MyPageService  {
	public MemberVO selectMyPage(MemberVO param);
	public MemberVO selectPW(MemberVO param);
	public MemberVO checkPW(MemberVO param);
	public int editMyPage(MemberVO param);
	public int updatePW(MemberVO param);
	public List<ConsultVO> consultQuestion(ConsultVO param);
}
