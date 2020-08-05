package com.kosmo.educatch.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosmo.educatch.dao.MemberJoinMapper;
import com.kosmo.educatch.vo.MemberVO;

@Service
@Transactional
public class MemberJoinServiceImpl implements MemberJoinService {
	
	@Autowired
	private MemberJoinMapper memberjoinmapper;

	@Override
	public int memberInsert(MemberVO param) {
		// TODO Auto-generated method stub
		return 0;
	}

}
