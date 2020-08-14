package com.kosmo.educatch.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosmo.educatch.dao.AmemberJoinMapper;
import com.kosmo.educatch.manager.LoggerManager;
import com.kosmo.educatch.vo.MemberVO;

@Service
@Transactional
public class AmemberJoinServiceImpl implements AmemberJoinService {
	private Logger log = LoggerManager.getInstance().getLogger(AmemberJoinServiceImpl.class);
	
	@Autowired
	private AmemberJoinMapper amemberjoinmapper;
	
	@Override
	public int aMemberInsert(MemberVO param) {
		// TODO Auto-generated method stub
		log.info("aMemberInsert서비스 진입");
		int ins = amemberjoinmapper.aMemberInsert(param);
		log.info("aMemberInsert서비스 끝");
		return ins;
	}

	@Override
	public int aMemberUpdate(MemberVO param) {
		// TODO Auto-generated method stub
		log.info("aMemberUpdate서비스 진입");
		int upd = amemberjoinmapper.aMemberUpdate(param);
		log.info("aMemberUpdate서비스 끝");
		return upd;
	}

}
