package com.kosmo.educatch.dao;

import com.kosmo.educatch.vo.MemberVO;

public interface MemberJoinMapper {
	public int memberInsert(MemberVO param);
	public int memberUpdate(MemberVO param);
	

}
