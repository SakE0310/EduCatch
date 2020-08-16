package com.kosmo.educatch.dao;

import com.kosmo.educatch.vo.MemberVO;
import com.kosmo.educatch.vo.ConsultVO;
import java.util.List;

public interface MyPageMapper {
	public MemberVO selectMyPage(MemberVO param);
	public MemberVO selectPW(MemberVO param);
	public MemberVO checkPW(MemberVO param);
	public int editMyPage(MemberVO param);
	public int updatePW(MemberVO param);
	public List<ConsultVO> consultQuestion(ConsultVO param);
	
}
