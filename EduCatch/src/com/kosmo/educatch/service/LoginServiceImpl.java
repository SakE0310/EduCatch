package com.kosmo.educatch.service;

import javax.servlet.http.HttpSession;

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
	
//  // ======= 일반 유저 로그인 ===========
//	@Override
//	public MemberVO loginCheck(MemberVO mvo) {
//		MemberVO mmvo = loginMapper.loginCheck(mvo);
//		
//		
//		return mmvo;
//	}

	// ======= 학원관리자 로그인 ===========	
	@Override
	public AMemberVO ALoginCheck(AMemberVO avo) {
		AMemberVO amvo = loginMapper.aLoginCheck(avo);
		return amvo;
	}

	
	// ========= 일반 회원 로그인 ======================
	@Override
	public boolean logincheck(MemberVO mvo, HttpSession session) {
		boolean result = loginMapper.loginCheck(mvo);
		
		if(result) {//true 일 경우 세션에 등록 
			MemberVO mvo2 = viewMember(mvo);
			
			//세션 변수 등록
			session.setAttribute("mid", mvo2.getMid());
			session.setAttribute("mname", mvo2.getMname());
			
			
		}
		
		return result;
	}
	
	// ======= 로그인 정보 ===========
	@Override
	public MemberVO viewMember(MemberVO mvo) {
			return LoginMapper.viewMember(mvo);
		
	}

	// ====== 로그아웃 ===========
	@Override
	public void logout(HttpSession session) {
			// 세션 별수 개별 삭제
			// session.removeAttribute("mid");
			// 세션 정보를 초기화 시킴
			
			session.invalidate();
		
	}

	
}


