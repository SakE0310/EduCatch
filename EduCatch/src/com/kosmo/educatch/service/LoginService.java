package com.kosmo.educatch.service;

import com.kosmo.educatch.vo.AMemberVO;
import com.kosmo.educatch.vo.MemberVO;

public interface LoginService {

	
	public MemberVO loginCheck(MemberVO mvo);
	
	public AMemberVO ALoginCheck(AMemberVO avo);
	
	
}
