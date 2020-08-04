package com.kosmo.educatch.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosmo.educatch.dao.LoginMapper;
import com.kosmo.educatch.vo.AMemberVO;
import com.kosmo.educatch.vo.MemberVO;

@Service("loginService")
@Transactional
public class LoginServiceImpl implements LoginService {

	@Autowired
	private LoginMapper loginMapper;
	
  // ======= 일반 유저 로그인 ===========
	@Override
	public MemberVO loginCheck(MemberVO mvo) {
		MemberVO mmvo = loginMapper.loginCheck(mvo);
		
		
		return mmvo;
	}

	// ======= 학원관리자 로그인 ===========	
	@Override
	public AMemberVO ALoginCheck(AMemberVO avo) {
		AMemberVO amvo = loginMapper.aLoginCheck(avo);
		return amvo;
	}

}
