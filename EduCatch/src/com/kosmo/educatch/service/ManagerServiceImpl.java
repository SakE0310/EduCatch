package com.kosmo.educatch.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosmo.educatch.dao.ManageMapper;
import com.kosmo.educatch.manager.LoggerManager;
import com.kosmo.educatch.vo.MemberVO;

@Service
@Transactional
public class ManagerServiceImpl implements ManageService {

	private Logger log = LoggerManager.getInstance().getLogger(ManagerServiceImpl.class);
	
	@Autowired
	private ManageMapper manageMapper;
	
	@Override
	public MemberVO getAcaAccept() {
		log.info("ManagerServiceImpl getAcaAccept >>> ");
		MemberVO mvo = null;
		mvo = manageMapper.getAcaAccept();
		log.info("ManagerServiceImpl getAcaAccept end >>> ");
		return mvo;
	}

}
