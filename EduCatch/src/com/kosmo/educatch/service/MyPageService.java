package com.kosmo.educatch.service;

import java.util.List;

import com.kosmo.educatch.vo.MemberVO;
import com.kosmo.educatch.vo.ReviewVO;
import com.kosmo.educatch.vo.AcademyVO;
import com.kosmo.educatch.vo.ConsultVO;
import com.kosmo.educatch.vo.FreeVO;

public interface MyPageService  {
	public MemberVO selectMyPage(MemberVO param);
	public MemberVO selectPW(MemberVO param);
	public MemberVO checkPW(MemberVO param);
	public int editMyPage(MemberVO param);
	public int updatePW(MemberVO param);
	public List<ConsultVO> consultQuestion(ConsultVO param);
	public List<ReviewVO> myReview(ReviewVO param);
	public List<FreeVO> myFree(FreeVO param);
	public int deleteMember(MemberVO param);
	public List<AcademyVO> listBookmark(AcademyVO param);
}
