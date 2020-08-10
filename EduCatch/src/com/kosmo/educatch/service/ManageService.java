package com.kosmo.educatch.service;

import java.util.List;

import com.kosmo.educatch.vo.MemberVO;

public interface ManageService {
	public List<MemberVO> getAcaAccept();
	public int setAcceptAcaMem(MemberVO vo);
	public int delAcaMem(MemberVO vo);
}
