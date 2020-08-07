package com.kosmo.educatch.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosmo.educatch.controller.AcademyRequestController;
import com.kosmo.educatch.dao.MemberJoinMapper;
import com.kosmo.educatch.manager.LoggerManager;
import com.kosmo.educatch.vo.MemberVO;

@Service
@Transactional
public class MemberJoinServiceImpl implements MemberJoinService {
	private Logger log = LoggerManager.getInstance().getLogger(MemberJoinServiceImpl.class);
	
	@Autowired
	private MemberJoinMapper memberjoinmapper;

	@Override
	public int memberInsert(MemberVO param) {
		// TODO Auto-generated method stub
		log.info("memberInsert서비스 진입");
		int ins = memberjoinmapper.memberInsert(param);
		log.info("memberInsert서비스 끝");
		return ins;
	}

	@Override
	public int memberUpdate(MemberVO param) {
		// TODO Auto-generated method stub
		log.info("memberUpdate서비스 진입");
		int ups = memberjoinmapper.memberUpdate(param);
		log.info("memberUpdate서비스 끝");
		return ups;
	}

}
