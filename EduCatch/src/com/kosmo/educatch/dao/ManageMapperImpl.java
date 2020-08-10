package com.kosmo.educatch.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.kosmo.educatch.manager.LoggerManager;
import com.kosmo.educatch.vo.MemberVO;

public class ManageMapperImpl extends SqlSessionDaoSupport implements ManageMapper {
	
	private Logger log = LoggerManager.getInstance().getLogger(ManageMapperImpl.class);

	@Override
	public List<MemberVO> getAcaAccept() {
		log.info("ManageMapperImpl getAcaAccept >>> ");
		return getSqlSession().selectList("ManageMapper.getAcaAccept");
	}

	@Override
	public int setAcceptAcaMem(MemberVO vo) {
		log.info("ManageMapperImpl setAcceptAcaMem >>> ");
		return getSqlSession().update("ManagerMapper.setAcceptAcaMem", vo);
	}

	@Override
	public int delAcaMem(MemberVO vo) {
		log.info("ManageMapperImpl delAcaMem >>> ");
		return getSqlSession().delete("ManagerMapper.delAcaMem", vo);
	}

}
