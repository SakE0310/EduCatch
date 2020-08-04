package com.kosmo.educatch.dao;

import com.kosmo.educatch.vo.MemberVO;
import com.kosmo.educatch.vo.AMemberVO;

public interface LoginMapper {
	
		MemberVO loginCheck(MemberVO mvo);
		
		AMemberVO aLoginCheck(AMemberVO avo);
	
	}

