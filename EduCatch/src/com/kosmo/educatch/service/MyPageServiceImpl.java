package com.kosmo.educatch.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosmo.educatch.dao.MyPageMapper;
import com.kosmo.educatch.manager.LoggerManager;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import com.kosmo.educatch.vo.MemberVO;
import com.kosmo.educatch.vo.ReviewVO;
import com.kosmo.educatch.vo.ConsultVO;
import com.kosmo.educatch.vo.FreeVO;

@Service
@Transactional
public class MyPageServiceImpl implements MyPageService{
	
	private Logger log = LoggerManager.getInstance().getLogger(MyPageServiceImpl.class);

	@Autowired
	private MyPageMapper mypageMapper;
	
	//========= 마이페이지 조회 ==================
	@Override
	public MemberVO selectMyPage(MemberVO param) {
		log.info("MyPageServiceImpl selectMyPage 시작>>>");
		
		MemberVO mvo = new MemberVO();
		mvo = mypageMapper.selectMyPage(param);
		
		log.info("MyPageServiceImpl selectMyPage 끝>>>");
		return mvo;
	}//end of selectMyPage

	//=========프로필 수정 : 비밀번호 검사 : 조회
	@Override
	public MemberVO selectPW(MemberVO param) {
		log.info("MyPageServiceImpl selectPW 시작>>>");
		
		MemberVO mvo = new MemberVO();
		mvo = mypageMapper.selectPW(param);
		
		log.info("MyPageServiceImpl selectPW 끝>>>");
		return mvo;
	}//end of selectPW

	//=======프로필 수정 : 비밀번호 검사 : 검사
	@Override
	public MemberVO checkPW(MemberVO param) {
		log.info("MyPageServiceImpl checkPW 시작>>>");
		
		MemberVO mvo = new MemberVO();
		mvo = mypageMapper.checkPW(param);
		
		log.info("MyPageServiceImpl checkPW 끝>>>");
		return mvo;
	}//end of checkPW

	//======프로필 수정 : 수정===========================
	@Override
	public int editMyPage(MemberVO param) {
		log.info("MyPageServiceImpl editMyPage 시작>>>");
		
		int nCnt = mypageMapper.editMyPage(param);
		
		log.info("MyPageServiceImpl editMyPage 끝>>>");
		return nCnt;
	}//end ofeditMyPage

	//===== 비밀번호 변경 : 수정 ==============
	@Override
	public int updatePW(MemberVO param) {
		log.info("MyPageServiceImpl updatePW 시작>>>");
		
		int nCnt = mypageMapper.updatePW(param);
		
		log.info("MyPageServiceImpl updatePW 끝>>>");
		return nCnt;
	}//end updatePW

	//===== 학원문의 조회 ======================
	@Override
	public List<ConsultVO> consultQuestion(ConsultVO param) {
		log.info("MyPageServiceImpl consultSearch 시작>>>");
		
		List<ConsultVO> list = new ArrayList<ConsultVO>();
		list = mypageMapper.consultQuestion(param);
		log.info("MyPageServiceImpl consultSearch list.size() >>>"+list.size());
		
		log.info("MyPageServiceImpl consultSearch 끝>>>");
		return list;
	}//end of consultSearch

	@Override
	public List<ReviewVO> myReview(ReviewVO param) {
		// TODO Auto-generated method stub
		log.info("MyPageServiceImpl myReview 시작>>>");
		
		List<ReviewVO> list = new ArrayList<ReviewVO>();
		list = mypageMapper.myReview(param);
		log.info("MyPageServiceImpl consultSearch list.size() >>>"+list.size());
		
		log.info("MyPageServiceImpl myReview 끝>>>");
		return list;
	}

	@Override
	public List<FreeVO> myFree(FreeVO param) {
		// TODO Auto-generated method stub
		log.info("MyPageServiceImpl FreeVO 시작>>>");
		
		List<FreeVO> list = new ArrayList<FreeVO>();
		list = mypageMapper.myFree(param);
		
		
		log.info("MyPageServiceImpl myFree 끝>>>");
		return list;
	}
	//=========회원탈퇴==================
	@Override
	public int deleteMember(MemberVO param) {
		// TODO Auto-generated method stub
		log.info("회원탈퇴deleteMember서비스 진입");
		int del = mypageMapper.deleteMember(param);
		log.info("회원탈퇴deleteMember서비스 진입 끝");
		return del;
	}
}
