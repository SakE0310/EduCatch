package com.kosmo.educatch.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.kosmo.educatch.vo.MemberVO;
import com.kosmo.educatch.vo.ReviewVO;
import com.kosmo.educatch.vo.AcademyVO;
import com.kosmo.educatch.vo.ConsultVO;
import com.kosmo.educatch.vo.FreeVO;

public class MyPageMapperImpl extends SqlSessionDaoSupport implements MyPageMapper{

	//=========마이페이지 조회===============
	@Override
	public MemberVO selectMyPage(MemberVO param) {
		MemberVO mvo = new MemberVO();
		mvo = getSqlSession().selectOne("selectMyPage");
		return mvo;
	}//end of selectMyPage

	//=======프로필 수정 : 비밀번호 검사 : 조회============
	@Override
	public MemberVO selectPW(MemberVO param) {
		MemberVO mvo = new MemberVO();
		mvo = getSqlSession().selectOne("selectPW");
		return mvo;
	}//end of selectPW

	//=======프로필 수정 : 비밀번호 검사 : 검사============
	@Override
	public MemberVO checkPW(MemberVO param) {
		MemberVO mvo = new MemberVO();
		mvo = getSqlSession().selectOne("checkPW");
		return mvo;
	}//end of checkPW

	//======프로필 수정 : 수정===========================
	@Override
	public int editMyPage(MemberVO param) {
		int nCnt = getSqlSession().update("editMyPage");
		return nCnt;
	}//end of editMyPage

	//===== 비밀번호 변경 : 수정 ==============
	@Override
	public int updatePW(MemberVO param) {
		int nCnt = getSqlSession().update("updatePW");
		return nCnt;
	}//end of updatePW

	//===== 학원문의 조회 ======================
	@Override
	public List<ConsultVO> consultQuestion(ConsultVO param) {
		List<ConsultVO> list = getSqlSession().selectList("consultQuestion");
		return list;
	}//end of consultSearch

	@Override
	public List<ReviewVO> myReview(ReviewVO param) {
		List<ReviewVO> list = getSqlSession().selectList("myReview");
		return list;
	}

	@Override
	public List<FreeVO> myFree(FreeVO param) {
		// TODO Auto-generated method stub
		List<FreeVO> list = getSqlSession().selectList("myFree");
		return list;
	}
	
	//=====회원 탈퇴==========
	@Override
	public int deleteMember(MemberVO param) {
		// TODO Auto-generated method stub
		int del =(int)getSqlSession().delete("deleteMember");
		return del;
	}
	//=====찜목록조회==========
	@Override
	public List<AcademyVO> listBookmark(AcademyVO param) {
		return getSqlSession().selectList("listBookmark");
	}

}
