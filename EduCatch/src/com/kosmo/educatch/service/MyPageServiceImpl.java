package com.kosmo.educatch.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosmo.educatch.dao.MyPageMapper;
import com.kosmo.educatch.manager.LoggerManager;
import org.apache.log4j.Logger;
import com.kosmo.educatch.vo.MemberVO;

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
}
