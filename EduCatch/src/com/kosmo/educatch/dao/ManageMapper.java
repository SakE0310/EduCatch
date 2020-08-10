package com.kosmo.educatch.dao;

import java.util.List;

import com.kosmo.educatch.vo.MemberVO;

public interface ManageMapper {
	public List<MemberVO> getAcaAccept();
	public int setAcceptAcaMem(MemberVO vo);
	public int delAcaMem(MemberVO vo);
}
