package com.kosmo.educatch.dao;

import java.util.List;

import com.kosmo.educatch.vo.MemberVO;

public interface MemberJoinMapper {
	public int memberInsert(MemberVO param);
	public int memberUpdate(MemberVO param);
	//아이디 체크
	public List<MemberVO> memberCheck(MemberVO param);
	

}
