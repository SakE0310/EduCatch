package com.kosmo.educatch.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosmo.educatch.dao.ManageMapper;
import com.kosmo.educatch.manager.LoggerManager;
import com.kosmo.educatch.vo.MemberVO;

@Service
@Transactional
public class ManageServiceImpl implements ManageService {

	private Logger log = LoggerManager.getInstance().getLogger(ManageServiceImpl.class);
	
	@Autowired
	private ManageMapper manageMapper;
	
	@Override
	public List<MemberVO> getAcaAccept() {
		log.info("ManagerServiceImpl getAcaAccept >>> ");
		List<MemberVO> list = null;
		list = manageMapper.getAcaAccept();
		log.info("ManagerServiceImpl getAcaAccept end >>> ");
		return list;
	}

	@Override
	public int setAcceptAcaMem(MemberVO vo) {
		log.info("ManagerserviceImpl setAcceptAcaMem >>> ");
		int cnt = manageMapper.setAcceptAcaMem(vo);
		log.info("ManagerserviceImpl setAcceptAcaMem end >>> ");
		return cnt;
	}

	@Override
	public int delAcaMem(MemberVO vo) {
		log.info("ManagerserviceImpl delAcaMem >>> ");
		int cnt = manageMapper.delAcaMem(vo);
		log.info("ManagerserviceImpl delAcaMem end >>> ");
		return cnt;
	}

}
