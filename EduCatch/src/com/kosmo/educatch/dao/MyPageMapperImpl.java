package com.kosmo.educatch.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.kosmo.educatch.vo.MemberVO;
import com.kosmo.educatch.vo.ConsultVO;

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

}
