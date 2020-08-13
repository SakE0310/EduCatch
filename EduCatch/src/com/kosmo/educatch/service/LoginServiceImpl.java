package com.kosmo.educatch.service;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosmo.educatch.dao.LoginMapper;
import com.kosmo.educatch.vo.MemberVO;

@Service("loginService")
@Transactional
public class LoginServiceImpl implements LoginService {

	private static Logger log=Logger.getLogger(ReviewServiceImpl.class);
	
	@Autowired
	private LoginMapper loginMapper;
	
  // ======= 일반 유저 로그인 ===========
	@Override
	public MemberVO loginCheck(MemberVO param) {
		log.info("LoginServiceImpl loginCheck >>> 호출성공");
		log.info("kid>>>"+param.getMid());
		log.info("kpw>>>"+param.getMpw());
		MemberVO mvo = new MemberVO();
		mvo =loginMapper.loginCheck(param);
		
		log.info("LoginServiceImpl loginCheck >>> 끝");
		return mvo;
	}


}


