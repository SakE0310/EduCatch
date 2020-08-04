package com.kosmo.educatch.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosmo.educatch.dao.AcademyAddMapper;
import com.kosmo.educatch.vo.AcademyVO;

@Service
@Transactional
public class AcademyAddServiceImpl implements AcademyAddService{

	private static Logger log = Logger.getLogger(AcademyAddServiceImpl.class);
	
	
	@Autowired
	private AcademyAddMapper academyAddMapper;
	
	//학원 등록
	@Override
	public int insertAcademy(AcademyVO param) {
		log.info("AcademyAddServiceImpl insertAcademy >>> 시작 ");
		
		int nCnt = 0;
		nCnt = academyAddMapper.insertAcademy(param);
		log.info("nCnt >>> " + nCnt);
		
		log.info("AcademyAddServiceImpl insertAcademy >>> 끝 ");
		return 0;
	}//end of insertAcademy
	
}
