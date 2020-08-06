package com.kosmo.educatch.service;

import com.kosmo.educatch.vo.MemberVO;

public interface MemberJoinService {
	public int memberInsert(MemberVO param);
	public int memberUpdeate(MemberVO param);
}
