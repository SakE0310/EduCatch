package com.kosmo.educatch.service;

import java.util.List;

import com.kosmo.educatch.vo.MemberVO;

public interface MemberJoinService {
	public int memberInsert(MemberVO param);
	public int memberUpdate(MemberVO param);
	public List<MemberVO> memberCheck(MemberVO param);
}
