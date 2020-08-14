package com.kosmo.educatch.dao;

import com.kosmo.educatch.vo.MemberVO;

public interface AmemberJoinMapper {
	public int aMemberInsert(MemberVO param);
	public int aMemberUpdate(MemberVO param);
}
